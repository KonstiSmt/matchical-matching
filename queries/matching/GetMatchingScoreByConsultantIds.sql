/* GetMatchingScoreByConsultantIds : Advanced SQL (Aurora Postgres, ODC)
   Purpose: return MatchingScore for specific consultants against a demand.
   Used for recalculating scores when demand requirements or consultant experiences change.

   This is a LIGHTWEIGHT SCORING QUERY (Query 3). Returns only ConsultantId and MatchingScore.
   No filters, no sorting, no pagination. Just pure scoring for the given consultants.

   Input: @ConsultantIds (comma-separated, Expand Inline), @DemandId, @TenantId,
          @UseCustomRoles, @RoleSkillScoringModeId,
          @ScoringMode_StrictRole, @ScoringMode_GlobalSkill, @ScoringMode_RoleFirstHybrid,
          @Cat_RoleSkill, @Cat_Skill, @Cat_CustomRoleSkill, @Cat_CustomSkill

   Output columns (ordered):
     ConsultantId, MatchingScore
*/

WITH
/* _____________ Input consultants (from Expand Inline parameter) _____________ */
input_consultant AS (
  SELECT consultant.[Id] AS ConsultantId
  FROM {Consultant} consultant
  WHERE consultant.[Id] IN (@ConsultantIds)
    AND consultant.[TenantId] = @TenantId
),

/* _____________ Requirements (valid only) _____________ */
requirement AS (
  SELECT
    req.[Id]               AS RequirementId,
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
  WHERE req.[DemandId] = @DemandId
    AND req.[TenantId]  = @TenantId
    AND req.[IsActive]  = 1
    AND NOT (req.[HasMissingKeys] = 1)
),

/* _____________ Category branches with computed partial_score (DOUBLE PRECISION) _____________ */

/* RoleSkill requirements in active role mode */
roleskill_requirement AS (
  SELECT
    req.RequirementId,
    req.[CategoryId],
    req.[RoleId],
    req.[CustomRoleId],
    req.[SkillId],
    req.ReqScore,
    req.[DynamicWeight],
    req.[RoleWeight],
    req.[TenantId]
  FROM requirement req
  WHERE (
    (@UseCustomRoles <> 1 AND req.[CategoryId] = @Cat_RoleSkill)
    OR (@UseCustomRoles = 1 AND req.[CategoryId] = @Cat_CustomRoleSkill)
  )
),

/* Role-scoped RoleSkill candidate scores */
roleskill_role_score AS (
  SELECT
    req.RequirementId,
    experience.[ConsultantId] AS ConsultantId,
    MAX(experience.[Score])   AS RoleScore
  FROM roleskill_requirement req
  JOIN {Experience} experience
    ON experience.[TenantId] = req.[TenantId]
   AND experience.[Score] > 0
   AND (
     (@UseCustomRoles <> 1
      AND experience.[CategoryId] = @Cat_RoleSkill
      AND experience.[RoleId] = req.[RoleId]
      AND experience.[SkillId] = req.[SkillId])
     OR (@UseCustomRoles = 1
         AND experience.[CategoryId] = @Cat_CustomRoleSkill
         AND experience.[CustomRoleId] = req.[CustomRoleId]
         AND experience.[SkillId] = req.[SkillId])
   )
  WHERE experience.[ConsultantId] IN (@ConsultantIds)
  GROUP BY
    req.RequirementId,
    experience.[ConsultantId]
),

/* Skill-scoped RoleSkill candidate scores */
roleskill_global_score AS (
  SELECT
    req.RequirementId,
    experience.[ConsultantId] AS ConsultantId,
    MAX(experience.[Score])   AS GlobalScore
  FROM roleskill_requirement req
  JOIN {Experience} experience
    ON experience.[TenantId] = req.[TenantId]
   AND experience.[Score] > 0
   AND (
     (@UseCustomRoles <> 1
      AND experience.[CategoryId] = @Cat_Skill
      AND experience.[SkillId] = req.[SkillId])
     OR (@UseCustomRoles = 1
         AND experience.[CategoryId] = @Cat_CustomSkill
         AND experience.[SkillId] = req.[SkillId])
   )
  WHERE experience.[ConsultantId] IN (@ConsultantIds)
  GROUP BY
    req.RequirementId,
    experience.[ConsultantId]
),

/* Effective score for selected RoleSkill scoring mode */
roleskill_score AS (
  SELECT
    score_source.RequirementId,
    score_source.ConsultantId,
    MAX(score_source.RoleScore)   AS RoleScore,
    MAX(score_source.GlobalScore) AS GlobalScore,
    CASE
      WHEN @RoleSkillScoringModeId = @ScoringMode_StrictRole
      THEN COALESCE(MAX(score_source.RoleScore), 0)
      WHEN @RoleSkillScoringModeId = @ScoringMode_GlobalSkill
      THEN COALESCE(MAX(score_source.GlobalScore), 0)
      WHEN @RoleSkillScoringModeId = @ScoringMode_RoleFirstHybrid
      THEN GREATEST(
             COALESCE(MAX(score_source.RoleScore), 0),
             GREATEST(COALESCE(MAX(score_source.GlobalScore), 0) - 1, 0)
           )
      ELSE COALESCE(MAX(score_source.RoleScore), 0)
    END AS EffectiveScore
  FROM (
    SELECT
      role_score.RequirementId,
      role_score.ConsultantId,
      role_score.RoleScore,
      CAST(NULL AS INTEGER) AS GlobalScore
    FROM roleskill_role_score role_score

    UNION ALL

    SELECT
      global_score.RequirementId,
      global_score.ConsultantId,
      CAST(NULL AS INTEGER) AS RoleScore,
      global_score.GlobalScore
    FROM roleskill_global_score global_score
  ) score_source
  GROUP BY
    score_source.RequirementId,
    score_source.ConsultantId
),

/* RoleSkill scoring branch using effective score from selected mode */
branch_roleskill AS (
  SELECT
    roleskill_score.ConsultantId AS ConsultantId,
    CASE WHEN @UseCustomRoles = 1 THEN @Cat_CustomRoleSkill ELSE @Cat_RoleSkill END AS CategoryId,
    CAST(
      CASE
        WHEN req.ReqScore = 0 THEN 0
        ELSE
          (
            CASE
              WHEN roleskill_score.EffectiveScore >= req.ReqScore THEN req.[DynamicWeight]
              ELSE req.[DynamicWeight] * (CAST(roleskill_score.EffectiveScore AS DOUBLE PRECISION) / CAST(req.ReqScore AS DOUBLE PRECISION))
            END
          ) * CAST(req.[RoleWeight] AS DOUBLE PRECISION)
      END
    AS DOUBLE PRECISION) AS partial_score
  FROM roleskill_requirement req
  JOIN roleskill_score
    ON roleskill_score.RequirementId = req.RequirementId
  WHERE req.ReqScore <> 0
    AND roleskill_score.EffectiveScore > 0
),

/* Role: match RoleId or CustomRole: match CustomRoleId (SkillId IS NULL on experience) */
branch_role AS (
  SELECT
    experience.[ConsultantId] AS ConsultantId,
    CASE WHEN @UseCustomRoles = 1 THEN @Cat_CustomRole ELSE @Cat_Role END AS CategoryId,
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
    AS DOUBLE PRECISION) AS partial_score
  FROM requirement req
  JOIN {Experience} experience
    ON experience.[TenantId] = req.[TenantId]
   AND (
     /* Standard Role */
     (@UseCustomRoles <> 1
      AND experience.[CategoryId] = @Cat_Role
      AND req.[CategoryId] = @Cat_Role
      AND experience.[RoleId] = req.[RoleId]
      AND experience.[SkillId] IS NULL)
     /* Custom Role */
     OR (@UseCustomRoles = 1
         AND experience.[CategoryId] = @Cat_CustomRole
         AND req.[CategoryId] = @Cat_CustomRole
         AND experience.[CustomRoleId] = req.[CustomRoleId]
         AND experience.[SkillId] IS NULL)
   )
  WHERE experience.[ConsultantId] IN (@ConsultantIds)
    AND req.ReqScore <> 0
    AND experience.[Score] > 0
),

/* Industry: match IndustryId */
branch_industry AS (
  SELECT
    experience.[ConsultantId] AS ConsultantId,
    @Cat_Industry AS CategoryId,
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
    AS DOUBLE PRECISION) AS partial_score
  FROM requirement req
  JOIN {Experience} experience
    ON experience.[TenantId] = req.[TenantId]
   AND experience.[CategoryId] = @Cat_Industry
   AND req.[CategoryId] = @Cat_Industry
   AND experience.[IndustryId] = req.[IndustryId]
  WHERE experience.[ConsultantId] IN (@ConsultantIds)
    AND req.ReqScore <> 0
    AND experience.[Score] > 0
),

/* FunctionalArea: match FunctionalAreaId */
branch_functional AS (
  SELECT
    experience.[ConsultantId] AS ConsultantId,
    @Cat_FunctionalArea AS CategoryId,
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
    AS DOUBLE PRECISION) AS partial_score
  FROM requirement req
  JOIN {Experience} experience
    ON experience.[TenantId] = req.[TenantId]
   AND experience.[CategoryId] = @Cat_FunctionalArea
   AND req.[CategoryId] = @Cat_FunctionalArea
   AND experience.[FunctionalAreaId] = req.[FunctionalAreaId]
  WHERE experience.[ConsultantId] IN (@ConsultantIds)
    AND req.ReqScore <> 0
    AND experience.[Score] > 0
),

/* Language: match LanguageId */
branch_language AS (
  SELECT
    experience.[ConsultantId] AS ConsultantId,
    @Cat_Language AS CategoryId,
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
    AS DOUBLE PRECISION) AS partial_score
  FROM requirement req
  JOIN {Experience} experience
    ON experience.[TenantId] = req.[TenantId]
   AND experience.[CategoryId] = @Cat_Language
   AND req.[CategoryId] = @Cat_Language
   AND experience.[LanguageId] = req.[LanguageId]
  WHERE experience.[ConsultantId] IN (@ConsultantIds)
),

/* _____________ Union of all category branches _____________ */
partials AS (
  SELECT * FROM branch_roleskill
  UNION ALL
  SELECT * FROM branch_role
  UNION ALL
  SELECT * FROM branch_industry
  UNION ALL
  SELECT * FROM branch_functional
  UNION ALL
  SELECT * FROM branch_language
),

/* _____________ Aggregate per consultant _____________ */
scores AS (
  SELECT
    partial.ConsultantId,
    SUM(partial.partial_score) AS MatchingScore
  FROM partials partial
  GROUP BY partial.ConsultantId
)

/* _____________ Final projection: all input consultants with their scores _____________ */
SELECT
  input.ConsultantId AS ConsultantId,
  COALESCE(score.MatchingScore, 0) AS MatchingScore
FROM input_consultant input
LEFT JOIN scores score ON score.ConsultantId = input.ConsultantId
