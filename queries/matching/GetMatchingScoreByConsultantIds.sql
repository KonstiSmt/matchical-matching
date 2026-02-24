/* GetMatchingScoreByConsultantIds : Advanced SQL (Aurora Postgres, ODC)
   Purpose: return matching scores for demand and consultant combinations.
   Used for recalculating scores before persisting demand-consultant links.

   This is a LIGHTWEIGHT SCORING QUERY (Query 3).
   No filters, no sorting, no pagination. Pure scoring for input demand and consultant lists.

   Input: @DemandIds (Expand Inline), @ConsultantIds (Expand Inline), @TenantId,
          @UseCustomRoles,
          @Cat_RoleSkill, @Cat_Skill, @Cat_Role,
          @Cat_CustomRoleSkill, @Cat_CustomSkill, @Cat_CustomRole,
          @Cat_Industry, @Cat_FunctionalArea, @Cat_Language

   Output columns (ordered):
     DemandId, ConsultantId,
     MatchingScoreStrict, MatchingScoreHybrid, MatchingScoreSkills,
     CustomRolesMatchingScoreStrict, CustomRolesMatchingScoreHybrid, CustomRolesMatchingScoreSkills
*/

WITH
/* _____________ Input demands (tenant-valid only) _____________ */
input_demand AS (
  SELECT demand.[Id] AS DemandId
  FROM {Demand} demand
  WHERE demand.[Id] IN (@DemandIds)
    AND demand.[TenantId] = @TenantId
),

/* _____________ Input consultants (tenant-valid only) _____________ */
input_consultant AS (
  SELECT consultant.[Id] AS ConsultantId
  FROM {Consultant} consultant
  WHERE consultant.[Id] IN (@ConsultantIds)
    AND consultant.[TenantId] = @TenantId
),

/* _____________ Output matrix: one row per demand-consultant pair _____________ */
input_pair AS (
  SELECT
    demand.DemandId,
    consultant.ConsultantId
  FROM input_demand demand
  CROSS JOIN input_consultant consultant
),

/* _____________ Role variants: standard always, custom only when enabled _____________ */
role_variant AS (
  SELECT 0 AS UseCustomRolesEffective

  UNION ALL

  SELECT 1 AS UseCustomRolesEffective
  WHERE @UseCustomRoles = 1
),

/* _____________ Scoring modes to project _____________ */
scoring_mode AS (
  SELECT 'Strict' AS ScoringMode

  UNION ALL

  SELECT 'Hybrid' AS ScoringMode

  UNION ALL

  SELECT 'Skills' AS ScoringMode
),

/* _____________ Consultant experiences (pre-materialized for all branches) _____________ */
consultant_experience AS MATERIALIZED (
  SELECT
    experience.[ConsultantId] AS ConsultantId,
    experience.[CategoryId],
    experience.[RoleId],
    experience.[CustomRoleId],
    experience.[SkillId],
    experience.[IndustryId],
    experience.[FunctionalAreaId],
    experience.[LanguageId],
    experience.[Score],
    experience.[TenantId]
  FROM {Experience} experience
  JOIN input_consultant consultant
    ON consultant.ConsultantId = experience.[ConsultantId]
  WHERE experience.[TenantId] = @TenantId
    AND experience.[Score] > 0
),

/* _____________ Active requirements for selected demands _____________ */
requirement_raw AS MATERIALIZED (
  SELECT
    req.[Id]               AS RequirementId,
    req.[DemandId]         AS DemandId,
    req.[CategoryId],
    req.[RoleId],
    req.[CustomRoleId],
    req.[SkillId],
    req.[IndustryId],
    req.[FunctionalAreaId],
    req.[LanguageId],
    req.[Score]            AS ReqScore,
    req.[DynamicWeight],
    req.[RoleWeight],
    req.[TenantId]
  FROM {DemandRequirement} req
  JOIN input_demand demand
    ON demand.DemandId = req.[DemandId]
  WHERE req.[TenantId] = @TenantId
    AND req.[IsActive] = 1
    AND NOT (req.[HasMissingKeys] = 1)
),

/* _____________ RoleSkill requirements for both variants _____________ */
roleskill_requirement_raw AS (
  SELECT
    req.DemandId,
    req.RequirementId,
    0 AS UseCustomRolesEffective,
    req.[RoleId],
    req.[CustomRoleId],
    req.[SkillId],
    req.ReqScore,
    req.[DynamicWeight],
    req.[RoleWeight],
    req.[TenantId]
  FROM requirement_raw req
  WHERE req.[CategoryId] = @Cat_RoleSkill

  UNION ALL

  SELECT
    req.DemandId,
    req.RequirementId,
    1 AS UseCustomRolesEffective,
    req.[RoleId],
    req.[CustomRoleId],
    req.[SkillId],
    req.ReqScore,
    req.[DynamicWeight],
    req.[RoleWeight],
    req.[TenantId]
  FROM requirement_raw req
  WHERE @UseCustomRoles = 1
    AND req.[CategoryId] = @Cat_CustomRoleSkill
),

/* _____________ Role-only contribution per role bucket (global redistribution) _____________ */
roleskill_role_requirement_weight_raw AS (
  SELECT
    req.DemandId,
    0 AS UseCustomRolesEffective,
    req.[RoleId],
    NULL AS CustomRoleId,
    SUM(CAST(req.[DynamicWeight] AS DOUBLE PRECISION) * 100.0) AS RoleContribution
  FROM requirement_raw req
  WHERE req.[CategoryId] = @Cat_Role
  GROUP BY
    req.DemandId,
    req.[RoleId]

  UNION ALL

  SELECT
    req.DemandId,
    1 AS UseCustomRolesEffective,
    NULL AS RoleId,
    req.[CustomRoleId],
    SUM(CAST(req.[DynamicWeight] AS DOUBLE PRECISION) * 100.0) AS RoleContribution
  FROM requirement_raw req
  WHERE @UseCustomRoles = 1
    AND req.[CategoryId] = @Cat_CustomRole
  GROUP BY
    req.DemandId,
    req.[CustomRoleId]
),

/* _____________ Base role-skill weight (strict/hybrid) _____________ */
roleskill_base_weight_raw AS (
  SELECT
    req.DemandId,
    req.RequirementId,
    req.UseCustomRolesEffective,
    req.[RoleId],
    req.[CustomRoleId],
    req.[SkillId],
    req.ReqScore,
    req.[TenantId],
    CAST(req.[DynamicWeight] AS DOUBLE PRECISION) * CAST(req.[RoleWeight] AS DOUBLE PRECISION) AS SkillWeightBase
  FROM roleskill_requirement_raw req
),

/* _____________ Sum of base skill weights per role bucket _____________ */
roleskill_bucket_weight_sum_raw AS (
  SELECT
    req.DemandId,
    req.UseCustomRolesEffective,
    req.[RoleId],
    req.[CustomRoleId],
    SUM(req.SkillWeightBase) AS SkillBaseSum
  FROM roleskill_base_weight_raw req
  GROUP BY
    req.DemandId,
    req.UseCustomRolesEffective,
    req.[RoleId],
    req.[CustomRoleId]
),

/* _____________ Keep base and distributed weights side-by-side _____________ */
roleskill_weight_raw AS (
  SELECT
    req.DemandId,
    req.RequirementId,
    req.UseCustomRolesEffective,
    req.[RoleId],
    req.[CustomRoleId],
    req.[SkillId],
    req.ReqScore,
    req.[TenantId],
    req.SkillWeightBase,
    CASE
      WHEN COALESCE(bucket_weight.SkillBaseSum, 0) > 0
      THEN req.SkillWeightBase
           + COALESCE(role_weight.RoleContribution, 0)
             * (
                 req.SkillWeightBase
                 / bucket_weight.SkillBaseSum
               )
      ELSE req.SkillWeightBase
    END AS SkillWeightDistributed
  FROM roleskill_base_weight_raw req
  LEFT JOIN roleskill_bucket_weight_sum_raw bucket_weight
    ON bucket_weight.DemandId = req.DemandId
   AND bucket_weight.UseCustomRolesEffective = req.UseCustomRolesEffective
   AND (
     (req.UseCustomRolesEffective = 0 AND bucket_weight.[RoleId] = req.[RoleId])
     OR (req.UseCustomRolesEffective = 1 AND bucket_weight.[CustomRoleId] = req.[CustomRoleId])
   )
  LEFT JOIN roleskill_role_requirement_weight_raw role_weight
    ON role_weight.DemandId = req.DemandId
   AND role_weight.UseCustomRolesEffective = req.UseCustomRolesEffective
   AND (
     (req.UseCustomRolesEffective = 0 AND role_weight.[RoleId] = req.[RoleId])
     OR (req.UseCustomRolesEffective = 1 AND role_weight.[CustomRoleId] = req.[CustomRoleId])
   )
),

/* _____________ Strict and hybrid use base role-skill requirements _____________ */
roleskill_requirement_standard AS (
  SELECT
    req.DemandId,
    req.RequirementId,
    req.UseCustomRolesEffective,
    req.[RoleId],
    req.[CustomRoleId],
    req.[SkillId],
    req.ReqScore,
    req.[TenantId],
    req.SkillWeightBase AS SkillWeightEffective
  FROM roleskill_weight_raw req
),

/* _____________ Skills mode uses distributed and deduplicated role-skill requirements _____________ */
roleskill_requirement_ranked_global AS (
  SELECT
    req.DemandId,
    req.RequirementId,
    req.UseCustomRolesEffective,
    req.[RoleId],
    req.[CustomRoleId],
    req.[SkillId],
    req.ReqScore,
    req.[TenantId],
    req.SkillWeightDistributed,
    ROW_NUMBER() OVER (
      PARTITION BY req.DemandId, req.UseCustomRolesEffective, req.[SkillId]
      ORDER BY req.ReqScore DESC, req.SkillWeightDistributed DESC, req.RequirementId ASC
    ) AS SkillRank
  FROM roleskill_weight_raw req
),

roleskill_requirement_aggregated_global AS (
  SELECT
    req.DemandId,
    req.UseCustomRolesEffective,
    req.[SkillId],
    MAX(req.ReqScore) AS ReqScore,
    SUM(req.SkillWeightDistributed) AS SkillWeightEffective
  FROM roleskill_weight_raw req
  GROUP BY
    req.DemandId,
    req.UseCustomRolesEffective,
    req.[SkillId]
),

roleskill_requirement_skills AS (
  SELECT
    rep.DemandId,
    rep.RequirementId,
    rep.UseCustomRolesEffective,
    rep.[RoleId],
    rep.[CustomRoleId],
    rep.[SkillId],
    agg.ReqScore,
    rep.[TenantId],
    agg.SkillWeightEffective
  FROM roleskill_requirement_ranked_global rep
  JOIN roleskill_requirement_aggregated_global agg
    ON agg.DemandId = rep.DemandId
   AND agg.UseCustomRolesEffective = rep.UseCustomRolesEffective
   AND agg.[SkillId] = rep.[SkillId]
  WHERE rep.SkillRank = 1
),

/* _____________ Role-scoped candidate score for strict and hybrid _____________ */
roleskill_standard_role_score AS (
  SELECT
    req.DemandId,
    req.RequirementId,
    req.UseCustomRolesEffective,
    experience.ConsultantId,
    MAX(experience.[Score]) AS RoleScore
  FROM roleskill_requirement_standard req
  JOIN consultant_experience experience
    ON experience.[TenantId] = req.[TenantId]
   AND req.UseCustomRolesEffective = 0
   AND experience.[CategoryId] = @Cat_RoleSkill
   AND experience.[RoleId] = req.[RoleId]
   AND experience.[SkillId] = req.[SkillId]
  GROUP BY
    req.DemandId,
    req.RequirementId,
    req.UseCustomRolesEffective,
    experience.ConsultantId

  UNION ALL

  SELECT
    req.DemandId,
    req.RequirementId,
    req.UseCustomRolesEffective,
    experience.ConsultantId,
    MAX(experience.[Score]) AS RoleScore
  FROM roleskill_requirement_standard req
  JOIN consultant_experience experience
    ON experience.[TenantId] = req.[TenantId]
   AND req.UseCustomRolesEffective = 1
   AND experience.[CategoryId] = @Cat_CustomRoleSkill
   AND experience.[CustomRoleId] = req.[CustomRoleId]
   AND experience.[SkillId] = req.[SkillId]
  GROUP BY
    req.DemandId,
    req.RequirementId,
    req.UseCustomRolesEffective,
    experience.ConsultantId
),

/* _____________ Skill-scoped candidate score for strict, hybrid, and skills _____________ */
roleskill_standard_global_score AS (
  SELECT
    req.DemandId,
    req.RequirementId,
    req.UseCustomRolesEffective,
    experience.ConsultantId,
    MAX(experience.[Score]) AS GlobalScore
  FROM roleskill_requirement_standard req
  JOIN consultant_experience experience
    ON experience.[TenantId] = req.[TenantId]
   AND req.UseCustomRolesEffective = 0
   AND experience.[CategoryId] = @Cat_Skill
   AND experience.[SkillId] = req.[SkillId]
  GROUP BY
    req.DemandId,
    req.RequirementId,
    req.UseCustomRolesEffective,
    experience.ConsultantId

  UNION ALL

  SELECT
    req.DemandId,
    req.RequirementId,
    req.UseCustomRolesEffective,
    experience.ConsultantId,
    MAX(experience.[Score]) AS GlobalScore
  FROM roleskill_requirement_standard req
  JOIN consultant_experience experience
    ON experience.[TenantId] = req.[TenantId]
   AND req.UseCustomRolesEffective = 1
   AND experience.[CategoryId] = @Cat_CustomSkill
   AND experience.[SkillId] = req.[SkillId]
  GROUP BY
    req.DemandId,
    req.RequirementId,
    req.UseCustomRolesEffective,
    experience.ConsultantId
),

roleskill_standard_score AS (
  SELECT
    score_source.DemandId,
    score_source.RequirementId,
    score_source.UseCustomRolesEffective,
    score_source.ConsultantId,
    MAX(score_source.RoleScore) AS RoleScore,
    MAX(score_source.GlobalScore) AS GlobalScore
  FROM (
    SELECT
      role_score.DemandId,
      role_score.RequirementId,
      role_score.UseCustomRolesEffective,
      role_score.ConsultantId,
      role_score.RoleScore,
      CAST(NULL AS INTEGER) AS GlobalScore
    FROM roleskill_standard_role_score role_score

    UNION ALL

    SELECT
      global_score.DemandId,
      global_score.RequirementId,
      global_score.UseCustomRolesEffective,
      global_score.ConsultantId,
      CAST(NULL AS INTEGER) AS RoleScore,
      global_score.GlobalScore
    FROM roleskill_standard_global_score global_score
  ) score_source
  GROUP BY
    score_source.DemandId,
    score_source.RequirementId,
    score_source.UseCustomRolesEffective,
    score_source.ConsultantId
),

/* _____________ RoleSkill partials for strict and hybrid _____________ */
roleskill_partial_standard AS (
  SELECT
    req.DemandId,
    score.ConsultantId,
    req.UseCustomRolesEffective,
    mode.ScoringMode,
    SUM(
      CAST(
        CASE
          WHEN req.ReqScore = 0 THEN 0
          WHEN mode.ScoringMode = 'Strict'
          THEN
            CASE
              WHEN COALESCE(score.RoleScore, 0) >= req.ReqScore THEN req.SkillWeightEffective
              ELSE req.SkillWeightEffective * (CAST(COALESCE(score.RoleScore, 0) AS DOUBLE PRECISION) / CAST(req.ReqScore AS DOUBLE PRECISION))
            END
          ELSE
            CASE
              WHEN GREATEST(
                     COALESCE(score.RoleScore, 0),
                     GREATEST(COALESCE(score.GlobalScore, 0) - 1, 0)
                   ) >= req.ReqScore
              THEN req.SkillWeightEffective
              ELSE req.SkillWeightEffective
                   * (
                       CAST(
                         GREATEST(
                           COALESCE(score.RoleScore, 0),
                           GREATEST(COALESCE(score.GlobalScore, 0) - 1, 0)
                         ) AS DOUBLE PRECISION
                       )
                       / CAST(req.ReqScore AS DOUBLE PRECISION)
                     )
            END
        END
      AS DOUBLE PRECISION)
    ) AS RoleSkillScore
  FROM roleskill_requirement_standard req
  JOIN roleskill_standard_score score
    ON score.DemandId = req.DemandId
   AND score.RequirementId = req.RequirementId
   AND score.UseCustomRolesEffective = req.UseCustomRolesEffective
  JOIN scoring_mode mode
    ON mode.ScoringMode IN ('Strict', 'Hybrid')
  WHERE req.ReqScore <> 0
    AND (
      (mode.ScoringMode = 'Strict' AND COALESCE(score.RoleScore, 0) > 0)
      OR (
        mode.ScoringMode = 'Hybrid'
        AND GREATEST(
              COALESCE(score.RoleScore, 0),
              GREATEST(COALESCE(score.GlobalScore, 0) - 1, 0)
            ) > 0
      )
    )
  GROUP BY
    req.DemandId,
    score.ConsultantId,
    req.UseCustomRolesEffective,
    mode.ScoringMode
),

roleskill_skills_global_score AS (
  SELECT
    req.DemandId,
    req.RequirementId,
    req.UseCustomRolesEffective,
    experience.ConsultantId,
    MAX(experience.[Score]) AS GlobalScore
  FROM roleskill_requirement_skills req
  JOIN consultant_experience experience
    ON experience.[TenantId] = req.[TenantId]
   AND req.UseCustomRolesEffective = 0
   AND experience.[CategoryId] = @Cat_Skill
   AND experience.[SkillId] = req.[SkillId]
  GROUP BY
    req.DemandId,
    req.RequirementId,
    req.UseCustomRolesEffective,
    experience.ConsultantId

  UNION ALL

  SELECT
    req.DemandId,
    req.RequirementId,
    req.UseCustomRolesEffective,
    experience.ConsultantId,
    MAX(experience.[Score]) AS GlobalScore
  FROM roleskill_requirement_skills req
  JOIN consultant_experience experience
    ON experience.[TenantId] = req.[TenantId]
   AND req.UseCustomRolesEffective = 1
   AND experience.[CategoryId] = @Cat_CustomSkill
   AND experience.[SkillId] = req.[SkillId]
  GROUP BY
    req.DemandId,
    req.RequirementId,
    req.UseCustomRolesEffective,
    experience.ConsultantId
),

/* _____________ RoleSkill partials for skills mode _____________ */
roleskill_partial_skills AS (
  SELECT
    req.DemandId,
    score.ConsultantId,
    req.UseCustomRolesEffective,
    'Skills' AS ScoringMode,
    SUM(
      CAST(
        CASE
          WHEN req.ReqScore = 0 THEN 0
          WHEN score.GlobalScore >= req.ReqScore THEN req.SkillWeightEffective
          ELSE req.SkillWeightEffective * (CAST(score.GlobalScore AS DOUBLE PRECISION) / CAST(req.ReqScore AS DOUBLE PRECISION))
        END
      AS DOUBLE PRECISION)
    ) AS RoleSkillScore
  FROM roleskill_requirement_skills req
  JOIN roleskill_skills_global_score score
    ON score.DemandId = req.DemandId
   AND score.RequirementId = req.RequirementId
   AND score.UseCustomRolesEffective = req.UseCustomRolesEffective
  WHERE req.ReqScore <> 0
    AND score.GlobalScore > 0
  GROUP BY
    req.DemandId,
    score.ConsultantId,
    req.UseCustomRolesEffective
),

roleskill_partial_by_mode AS (
  SELECT
    standard_score.DemandId,
    standard_score.ConsultantId,
    standard_score.UseCustomRolesEffective,
    standard_score.ScoringMode,
    standard_score.RoleSkillScore
  FROM roleskill_partial_standard standard_score

  UNION ALL

  SELECT
    skills_score.DemandId,
    skills_score.ConsultantId,
    skills_score.UseCustomRolesEffective,
    skills_score.ScoringMode,
    skills_score.RoleSkillScore
  FROM roleskill_partial_skills skills_score
),

/* _____________ Role partials (excluded only for skills mode at projection) _____________ */
role_partial AS (
  SELECT
    req.DemandId,
    experience.ConsultantId,
    0 AS UseCustomRolesEffective,
    SUM(
      CAST(
        CASE
          WHEN req.ReqScore = 0 THEN 0
          ELSE
            (
              CASE
                WHEN experience.[Score] >= req.ReqScore THEN req.[DynamicWeight]
                ELSE req.[DynamicWeight] * (CAST(experience.[Score] AS DOUBLE PRECISION) / CAST(req.ReqScore AS DOUBLE PRECISION))
              END
            ) * 100.0
        END
      AS DOUBLE PRECISION)
    ) AS RoleScore
  FROM requirement_raw req
  JOIN consultant_experience experience
    ON experience.[TenantId] = req.[TenantId]
   AND req.[CategoryId] = @Cat_Role
   AND experience.[CategoryId] = @Cat_Role
   AND experience.[RoleId] = req.[RoleId]
   AND experience.[SkillId] IS NULL
  WHERE req.ReqScore <> 0
  GROUP BY
    req.DemandId,
    experience.ConsultantId

  UNION ALL

  SELECT
    req.DemandId,
    experience.ConsultantId,
    1 AS UseCustomRolesEffective,
    SUM(
      CAST(
        CASE
          WHEN req.ReqScore = 0 THEN 0
          ELSE
            (
              CASE
                WHEN experience.[Score] >= req.ReqScore THEN req.[DynamicWeight]
                ELSE req.[DynamicWeight] * (CAST(experience.[Score] AS DOUBLE PRECISION) / CAST(req.ReqScore AS DOUBLE PRECISION))
              END
            ) * 100.0
        END
      AS DOUBLE PRECISION)
    ) AS RoleScore
  FROM requirement_raw req
  JOIN consultant_experience experience
    ON experience.[TenantId] = req.[TenantId]
   AND req.[CategoryId] = @Cat_CustomRole
   AND experience.[CategoryId] = @Cat_CustomRole
   AND experience.[CustomRoleId] = req.[CustomRoleId]
   AND experience.[SkillId] IS NULL
  WHERE @UseCustomRoles = 1
    AND req.ReqScore <> 0
  GROUP BY
    req.DemandId,
    experience.ConsultantId
),

industry_partial AS (
  SELECT
    req.DemandId,
    experience.ConsultantId,
    SUM(
      CAST(
        CASE
          WHEN req.ReqScore = 0 THEN 0
          ELSE
            (
              CASE
                WHEN experience.[Score] >= req.ReqScore THEN req.[DynamicWeight]
                ELSE req.[DynamicWeight] * (CAST(experience.[Score] AS DOUBLE PRECISION) / CAST(req.ReqScore AS DOUBLE PRECISION))
              END
            ) * 100.0
        END
      AS DOUBLE PRECISION)
    ) AS IndustryScore
  FROM requirement_raw req
  JOIN consultant_experience experience
    ON experience.[TenantId] = req.[TenantId]
   AND req.[CategoryId] = @Cat_Industry
   AND experience.[CategoryId] = @Cat_Industry
   AND experience.[IndustryId] = req.[IndustryId]
  WHERE req.ReqScore <> 0
  GROUP BY
    req.DemandId,
    experience.ConsultantId
),

functional_partial AS (
  SELECT
    req.DemandId,
    experience.ConsultantId,
    SUM(
      CAST(
        CASE
          WHEN req.ReqScore = 0 THEN 0
          ELSE
            (
              CASE
                WHEN experience.[Score] >= req.ReqScore THEN req.[DynamicWeight]
                ELSE req.[DynamicWeight] * (CAST(experience.[Score] AS DOUBLE PRECISION) / CAST(req.ReqScore AS DOUBLE PRECISION))
              END
            ) * 100.0
        END
      AS DOUBLE PRECISION)
    ) AS FunctionalScore
  FROM requirement_raw req
  JOIN consultant_experience experience
    ON experience.[TenantId] = req.[TenantId]
   AND req.[CategoryId] = @Cat_FunctionalArea
   AND experience.[CategoryId] = @Cat_FunctionalArea
   AND experience.[FunctionalAreaId] = req.[FunctionalAreaId]
  WHERE req.ReqScore <> 0
  GROUP BY
    req.DemandId,
    experience.ConsultantId
),

language_partial AS (
  SELECT
    req.DemandId,
    experience.ConsultantId,
    SUM(
      CAST(
        CASE
          WHEN req.ReqScore = 0 THEN 0
          ELSE
            (
              CASE
                WHEN experience.[Score] >= req.ReqScore THEN req.[DynamicWeight]
                ELSE req.[DynamicWeight] * (CAST(experience.[Score] AS DOUBLE PRECISION) / CAST(req.ReqScore AS DOUBLE PRECISION))
              END
            ) * 100.0
        END
      AS DOUBLE PRECISION)
    ) AS LanguageScore
  FROM requirement_raw req
  JOIN consultant_experience experience
    ON experience.[TenantId] = req.[TenantId]
   AND req.[CategoryId] = @Cat_Language
   AND experience.[CategoryId] = @Cat_Language
   AND experience.[LanguageId] = req.[LanguageId]
  WHERE req.ReqScore <> 0
  GROUP BY
    req.DemandId,
    experience.ConsultantId
),

shared_nonrole_score AS (
  SELECT
    score_source.DemandId,
    score_source.ConsultantId,
    SUM(score_source.PartialScore) AS SharedScore
  FROM (
    SELECT
      industry.DemandId,
      industry.ConsultantId,
      industry.IndustryScore AS PartialScore
    FROM industry_partial industry

    UNION ALL

    SELECT
      functional.DemandId,
      functional.ConsultantId,
      functional.FunctionalScore AS PartialScore
    FROM functional_partial functional

    UNION ALL

    SELECT
      language.DemandId,
      language.ConsultantId,
      language.LanguageScore AS PartialScore
    FROM language_partial language
  ) score_source
  GROUP BY
    score_source.DemandId,
    score_source.ConsultantId
),

mode_score AS (
  SELECT
    pair.DemandId,
    pair.ConsultantId,
    variant.UseCustomRolesEffective,
    mode.ScoringMode,
    CAST(
      COALESCE(shared.SharedScore, 0)
      + COALESCE(roleskill.RoleSkillScore, 0)
      + CASE
          WHEN mode.ScoringMode = 'Skills' THEN 0
          ELSE COALESCE(role.RoleScore, 0)
        END
    AS DOUBLE PRECISION) AS MatchingScore
  FROM input_pair pair
  CROSS JOIN role_variant variant
  CROSS JOIN scoring_mode mode
  LEFT JOIN roleskill_partial_by_mode roleskill
    ON roleskill.DemandId = pair.DemandId
   AND roleskill.ConsultantId = pair.ConsultantId
   AND roleskill.UseCustomRolesEffective = variant.UseCustomRolesEffective
   AND roleskill.ScoringMode = mode.ScoringMode
  LEFT JOIN role_partial role
    ON role.DemandId = pair.DemandId
   AND role.ConsultantId = pair.ConsultantId
   AND role.UseCustomRolesEffective = variant.UseCustomRolesEffective
  LEFT JOIN shared_nonrole_score shared
    ON shared.DemandId = pair.DemandId
   AND shared.ConsultantId = pair.ConsultantId
)

SELECT
  score.DemandId AS DemandId,
  score.ConsultantId AS ConsultantId,
  COALESCE(MAX(CASE WHEN score.UseCustomRolesEffective = 0 AND score.ScoringMode = 'Strict' THEN score.MatchingScore END), 0) AS MatchingScoreStrict,
  COALESCE(MAX(CASE WHEN score.UseCustomRolesEffective = 0 AND score.ScoringMode = 'Hybrid' THEN score.MatchingScore END), 0) AS MatchingScoreHybrid,
  COALESCE(MAX(CASE WHEN score.UseCustomRolesEffective = 0 AND score.ScoringMode = 'Skills' THEN score.MatchingScore END), 0) AS MatchingScoreSkills,
  CASE
    WHEN @UseCustomRoles = 1
    THEN COALESCE(MAX(CASE WHEN score.UseCustomRolesEffective = 1 AND score.ScoringMode = 'Strict' THEN score.MatchingScore END), 0)
    ELSE NULL
  END AS CustomRolesMatchingScoreStrict,
  CASE
    WHEN @UseCustomRoles = 1
    THEN COALESCE(MAX(CASE WHEN score.UseCustomRolesEffective = 1 AND score.ScoringMode = 'Hybrid' THEN score.MatchingScore END), 0)
    ELSE NULL
  END AS CustomRolesMatchingScoreHybrid,
  CASE
    WHEN @UseCustomRoles = 1
    THEN COALESCE(MAX(CASE WHEN score.UseCustomRolesEffective = 1 AND score.ScoringMode = 'Skills' THEN score.MatchingScore END), 0)
    ELSE NULL
  END AS CustomRolesMatchingScoreSkills
FROM mode_score score
GROUP BY
  score.DemandId,
  score.ConsultantId
