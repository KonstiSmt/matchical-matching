/* GetConsultantMatchPreview : Advanced SQL (Aurora Postgres, ODC)
   Purpose: Preview query for consultant match cards.

   This is the PREVIEW QUERY (Query 2). Called after GetMatchesByDemandId (Query 1).
   Takes ConsultantIds from Query 1 and returns display data for preview cards.

   Input: @ConsultantIds (comma-separated, Expand Inline), @DemandId, @TenantId, @SystemLanguage,
          @UseCustomRoles, @RoleSkillScoringModeId,
          @ScoringMode_StrictRole, @ScoringMode_GlobalSkill, @ScoringMode_RoleFirstHybrid,
          @Cat_RoleSkill, @Cat_Skill, @Cat_CustomRoleSkill, @Cat_CustomSkill

   Output columns (ordered):
     ConsultantId, IsPinned, MatchingScore, PricePerformanceScore, FirstName, LastName, PhotoUrl,
     TopRoleName, EuroFixedRate, AvailabilityCategoryId, EmploymentStatusId, EmploymentStatusLabelTranslationsJSON,
     TotalMatchingRequirements, TopMatchesJson, TopMatches

   NOTE: MatchingScore and PricePerformanceScore return 0 as placeholders.
   These values are already calculated in Query 1 and should be mapped in the
   application layer after this query returns.
*/

WITH
/* _____________ Consultant base info _____________ */
consultant_base AS (
  SELECT
    consultant.[Id]               AS ConsultantId,
    consultant.[IsInternal]       AS IsInternal,
    consultant.[ConsultancyUserId] AS ConsultancyUserId,
    consultant.[ExternalUserId]   AS ExternalUserId,
    consultant.[TopRoleId]        AS TopRoleId,
    consultant.[TopCustomRoleId]  AS TopCustomRoleId,
    consultant.[EuroFixedRate]    AS EuroFixedRate,
    consultant.[AvailabilityCategoryId] AS AvailabilityCategoryId
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
    req.[SkillAliasId],
    req.[RoleAliasId],
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

/* RoleSkill requirements in active role mode */
roleskill_requirement_raw AS (
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

/* Role-only requirement contribution per role bucket (for Global Skill redistribution) */
roleskill_role_requirement_weight_raw AS (
  SELECT
    req.[RoleId],
    req.[CustomRoleId],
    SUM(CAST(req.[DynamicWeight] AS DOUBLE PRECISION) * 100.0) AS RoleContribution
  FROM requirement req
  WHERE (
    (@UseCustomRoles <> 1 AND req.[CategoryId] = @Cat_Role)
    OR (@UseCustomRoles = 1 AND req.[CategoryId] = @Cat_CustomRole)
  )
  GROUP BY
    req.[RoleId],
    req.[CustomRoleId]
),

/* Base skill weight (pre-redistribution) */
roleskill_base_weight_raw AS (
  SELECT
    req.RequirementId,
    req.[RoleId],
    req.[CustomRoleId],
    req.[SkillId],
    req.ReqScore,
    req.[CategoryId],
    req.[TenantId],
    CAST(req.[DynamicWeight] AS DOUBLE PRECISION) * CAST(req.[RoleWeight] AS DOUBLE PRECISION) AS SkillBaseWeight
  FROM roleskill_requirement_raw req
),

/* Sum of base skill weights per role bucket */
roleskill_bucket_weight_sum_raw AS (
  SELECT
    base_weight.[RoleId],
    base_weight.[CustomRoleId],
    SUM(base_weight.SkillBaseWeight) AS SkillBaseSum
  FROM roleskill_base_weight_raw base_weight
  GROUP BY
    base_weight.[RoleId],
    base_weight.[CustomRoleId]
),

/* Per-row redistributed weight (Global Skill mode only) */
roleskill_weight_after_distribution_raw AS (
  SELECT
    req.RequirementId,
    req.[CategoryId],
    req.[RoleId],
    req.[CustomRoleId],
    req.[SkillId],
    req.ReqScore,
    req.[TenantId],
    CASE
      WHEN @RoleSkillScoringModeId = @ScoringMode_GlobalSkill
           AND COALESCE(bucket_weight.SkillBaseSum, 0) > 0
      THEN base_weight.SkillBaseWeight
           + COALESCE(role_weight.RoleContribution, 0)
             * (
                 base_weight.SkillBaseWeight
                 / bucket_weight.SkillBaseSum
               )
      ELSE base_weight.SkillBaseWeight
    END AS SkillWeightAfterDistribution
  FROM roleskill_requirement_raw req
  JOIN roleskill_base_weight_raw base_weight
    ON base_weight.RequirementId = req.RequirementId
  LEFT JOIN roleskill_bucket_weight_sum_raw bucket_weight
    ON (
      (@UseCustomRoles <> 1 AND bucket_weight.[RoleId] = req.[RoleId])
      OR (@UseCustomRoles = 1 AND bucket_weight.[CustomRoleId] = req.[CustomRoleId])
    )
  LEFT JOIN roleskill_role_requirement_weight_raw role_weight
    ON (
      (@UseCustomRoles <> 1 AND role_weight.[RoleId] = req.[RoleId])
      OR (@UseCustomRoles = 1 AND role_weight.[CustomRoleId] = req.[CustomRoleId])
    )
),

/* Rank deduplicated global-skill rows by highest required score first */
roleskill_requirement_ranked_global AS (
  SELECT
    req.RequirementId,
    req.[CategoryId],
    req.[RoleId],
    req.[CustomRoleId],
    req.[SkillId],
    req.ReqScore,
    req.[TenantId],
    req.SkillWeightAfterDistribution,
    ROW_NUMBER() OVER (
      PARTITION BY req.[TenantId], req.[SkillId]
      ORDER BY req.ReqScore DESC, req.SkillWeightAfterDistribution DESC, req.RequirementId ASC
    ) AS SkillRank
  FROM roleskill_weight_after_distribution_raw req
),

/* Merge global-skill duplicates across role buckets */
roleskill_requirement_aggregated_global AS (
  SELECT
    req.[SkillId],
    req.[TenantId],
    MAX(req.ReqScore) AS ReqScore,
    SUM(req.SkillWeightAfterDistribution) AS SkillWeightEffective
  FROM roleskill_weight_after_distribution_raw req
  GROUP BY
    req.[SkillId],
    req.[TenantId]
),

/* Effective role-skill requirements used for scoring by selected mode */
roleskill_requirement_effective AS (
  SELECT
    req.RequirementId,
    req.[CategoryId],
    req.[RoleId],
    req.[CustomRoleId],
    req.[SkillId],
    req.ReqScore,
    req.[TenantId],
    req.SkillWeightAfterDistribution AS SkillWeightEffective
  FROM roleskill_weight_after_distribution_raw req
  WHERE @RoleSkillScoringModeId <> @ScoringMode_GlobalSkill

  UNION ALL

  SELECT
    rep.RequirementId,
    rep.[CategoryId],
    rep.[RoleId],
    rep.[CustomRoleId],
    rep.[SkillId],
    agg.ReqScore,
    rep.[TenantId],
    agg.SkillWeightEffective
  FROM roleskill_requirement_ranked_global rep
  JOIN roleskill_requirement_aggregated_global agg
    ON agg.[SkillId] = rep.[SkillId]
   AND agg.[TenantId] = rep.[TenantId]
  WHERE @RoleSkillScoringModeId = @ScoringMode_GlobalSkill
    AND rep.SkillRank = 1
),

/* Role-scoped RoleSkill candidate scores */
roleskill_role_score AS (
  SELECT
    req.RequirementId,
    experience.[ConsultantId] AS ConsultantId,
    MAX(experience.[Score])   AS RoleScore
  FROM roleskill_requirement_effective req
  JOIN {Experience} experience
    ON experience.[ConsultantId] IN (@ConsultantIds)
   AND experience.[TenantId] = req.[TenantId]
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
  FROM roleskill_requirement_effective req
  JOIN {Experience} experience
    ON experience.[ConsultantId] IN (@ConsultantIds)
   AND experience.[TenantId] = req.[TenantId]
   AND experience.[Score] > 0
   AND (
     (@UseCustomRoles <> 1
      AND experience.[CategoryId] = @Cat_Skill
      AND experience.[SkillId] = req.[SkillId])
     OR (@UseCustomRoles = 1
         AND experience.[CategoryId] = @Cat_CustomSkill
         AND experience.[SkillId] = req.[SkillId])
   )
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

/* RoleSkill matches using effective score */
roleskill_match AS (
  SELECT
    roleskill_score.ConsultantId,
    req.RequirementId,
    roleskill_score.EffectiveScore AS ConsultantScore,
    CAST(
      CASE
        WHEN req.ReqScore = 0 THEN 0
        WHEN roleskill_score.EffectiveScore >= req.ReqScore
        THEN req.SkillWeightEffective
        ELSE req.SkillWeightEffective
             * (CAST(roleskill_score.EffectiveScore AS DOUBLE PRECISION) / CAST(req.ReqScore AS DOUBLE PRECISION))
      END
    AS DOUBLE PRECISION) AS partial_score
  FROM roleskill_requirement_effective req
  JOIN roleskill_score
    ON roleskill_score.RequirementId = req.RequirementId
  WHERE req.ReqScore > 0
    AND roleskill_score.EffectiveScore > 0
),

/* Non role-skill matches */
non_roleskill_match AS (
  SELECT
    experience.[ConsultantId] AS ConsultantId,
    req.RequirementId,
    experience.[Score]        AS ConsultantScore,
    CAST(
      CASE
        WHEN req.ReqScore = 0 THEN 0
        WHEN experience.[Score] >= req.ReqScore
        THEN req.[DynamicWeight] * 100.0
        ELSE req.[DynamicWeight] * 100.0
             * (CAST(experience.[Score] AS DOUBLE PRECISION) / CAST(req.ReqScore AS DOUBLE PRECISION))
      END
    AS DOUBLE PRECISION) AS partial_score
  FROM requirement req
  JOIN {Experience} experience
    ON experience.[ConsultantId] IN (@ConsultantIds)
   AND experience.[TenantId] = req.[TenantId]
   AND (
     (@RoleSkillScoringModeId <> @ScoringMode_GlobalSkill
      AND @UseCustomRoles <> 1
      AND req.[CategoryId] = @Cat_Role
      AND experience.[CategoryId] = @Cat_Role
      AND experience.[RoleId] = req.[RoleId]
      AND experience.[SkillId] IS NULL)
     OR (@RoleSkillScoringModeId <> @ScoringMode_GlobalSkill
         AND @UseCustomRoles = 1
         AND req.[CategoryId] = @Cat_CustomRole
         AND experience.[CategoryId] = @Cat_CustomRole
         AND experience.[CustomRoleId] = req.[CustomRoleId]
         AND experience.[SkillId] IS NULL)
     OR (req.[CategoryId] = @Cat_Industry
         AND experience.[CategoryId] = @Cat_Industry
         AND experience.[IndustryId] = req.[IndustryId])
     OR (req.[CategoryId] = @Cat_FunctionalArea
         AND experience.[CategoryId] = @Cat_FunctionalArea
         AND experience.[FunctionalAreaId] = req.[FunctionalAreaId])
     OR (req.[CategoryId] = @Cat_Language
         AND experience.[CategoryId] = @Cat_Language
         AND experience.[LanguageId] = req.[LanguageId])
   )
   AND experience.[Score] > 0
  WHERE req.ReqScore > 0
),

/* Requirement matches with partial_score and names */
requirement_matches AS (
  SELECT
    match_base.ConsultantId,
    req.RequirementId,
    req.[CategoryId] AS CategoryId,
    match_base.ConsultantScore,
    match_base.partial_score,
    COALESCE(
      skill_alias_locale.[TextValue],
      role_alias_locale.[TextValue],
      custom_role_locale.[TextValue],
      industry_locale.[TextValue],
      functional_locale.[TextValue],
      language_locale.[TextValue]
    ) AS RequirementName
  FROM (
    SELECT
      roleskill_match.ConsultantId,
      roleskill_match.RequirementId,
      roleskill_match.ConsultantScore,
      roleskill_match.partial_score
    FROM roleskill_match

    UNION ALL

    SELECT
      non_roleskill_match.ConsultantId,
      non_roleskill_match.RequirementId,
      non_roleskill_match.ConsultantScore,
      non_roleskill_match.partial_score
    FROM non_roleskill_match
  ) match_base
  JOIN requirement req
    ON req.RequirementId = match_base.RequirementId

  /* LocaleDict joins for requirement names - RoleSkill and CustomRoleSkill via SkillAlias */
  LEFT JOIN {SkillAlias} skill_alias
    ON (req.[CategoryId] = @Cat_RoleSkill OR req.[CategoryId] = @Cat_CustomRoleSkill)
   AND skill_alias.[Id] = req.[SkillAliasId]
  LEFT JOIN {LocaleDict} skill_alias_locale
    ON skill_alias_locale.[LocaleKeyId] = skill_alias.[NameLocaleKeyId]
   AND skill_alias_locale.[LanguageId] = @SystemLanguage

  /* LocaleDict joins for requirement names - Role category via RoleAlias */
  LEFT JOIN {RoleAlias} role_alias
    ON @UseCustomRoles <> 1
   AND req.[CategoryId] = @Cat_Role
   AND role_alias.[Id] = req.[RoleAliasId]
  LEFT JOIN {LocaleDict} role_alias_locale
    ON @UseCustomRoles <> 1
   AND role_alias_locale.[LocaleKeyId] = role_alias.[NameLocaleKeyId]
   AND role_alias_locale.[LanguageId] = @SystemLanguage

  /* LocaleDict joins for requirement names - CustomRole category via CustomRole to RoleName */
  LEFT JOIN {CustomRole} custom_role
    ON @UseCustomRoles = 1
   AND req.[CategoryId] = @Cat_CustomRole
   AND custom_role.[Id] = req.[CustomRoleId]
  LEFT JOIN {RoleName} custom_role_name
    ON @UseCustomRoles = 1
   AND custom_role_name.[Id] = custom_role.[RoleNameId]
  LEFT JOIN {LocaleDict} custom_role_locale
    ON @UseCustomRoles = 1
   AND custom_role_locale.[LocaleKeyId] = custom_role_name.[NameLocaleKeyId]
   AND custom_role_locale.[LanguageId] = @SystemLanguage

  /* LocaleDict joins for requirement names - Industry category */
  LEFT JOIN {Industry} industry
    ON req.[CategoryId] = @Cat_Industry
   AND industry.[Id] = req.[IndustryId]
  LEFT JOIN {LocaleDict} industry_locale
    ON industry_locale.[LocaleKeyId] = industry.[NameLocaleKeyId]
   AND industry_locale.[LanguageId] = @SystemLanguage

  /* LocaleDict joins for requirement names - FunctionalArea category */
  LEFT JOIN {FunctionalArea} functional_area
    ON req.[CategoryId] = @Cat_FunctionalArea
   AND functional_area.[Id] = req.[FunctionalAreaId]
  LEFT JOIN {LocaleDict} functional_locale
    ON functional_locale.[LocaleKeyId] = functional_area.[NameLocaleKeyId]
   AND functional_locale.[LanguageId] = @SystemLanguage

  /* LocaleDict joins for requirement names - Language category */
  LEFT JOIN {Language} language_ref
    ON req.[CategoryId] = @Cat_Language
   AND language_ref.[Id] = req.[LanguageId]
  LEFT JOIN {LocaleDict} language_locale
    ON language_locale.[LocaleKeyId] = language_ref.[NameLocaleKeyId]
   AND language_locale.[LanguageId] = @SystemLanguage
),

/* _____________ Ranked matches per consultant _____________ */
ranked_matches AS (
  SELECT
    rm.ConsultantId,
    rm.RequirementId,
    rm.CategoryId,
    rm.ConsultantScore,
    rm.partial_score,
    rm.RequirementName
  FROM requirement_matches rm
)

/* _____________ Final projection _____________ */
SELECT
  /* 1) ConsultantId */
  cb.ConsultantId AS ConsultantId,

  /* 2) IsPinned - true if consultant is assigned to this demand */
  CASE WHEN demand_consultant.[Id] IS NOT NULL THEN 1 ELSE 0 END AS IsPinned,

  /* 3) MatchingScore - placeholder, filled by app from Query 1 */
  0 AS MatchingScore,

  /* 4) PricePerformanceScore - placeholder, filled by app from Query 1 */
  0 AS PricePerformanceScore,

  /* 5) FirstName */
  (CASE WHEN cb.IsInternal = 1 THEN consultancy_user.[FirstName] ELSE external_user.[FirstName] END) AS FirstName,

  /* 6) LastName */
  (CASE WHEN cb.IsInternal = 1 THEN consultancy_user.[LastName] ELSE external_user.[LastName] END) AS LastName,

  /* 7) PhotoUrl */
  (CASE WHEN cb.IsInternal = 1
        THEN COALESCE(NULLIF(consultancy_user.[DefaultPhotoUrlRound], ''), consultancy_user.[DefaultPhotoUrl])
        ELSE COALESCE(NULLIF(external_user.[DefaultPhotoUrlRound], ''), external_user.[DefaultPhotoUrl])
   END) AS PhotoUrl,

  /* 8) TopRoleName (supports both standard and custom roles) */
  CASE WHEN @UseCustomRoles = 1 THEN top_custom_role_locale.[TextValue] ELSE role_locale.[TextValue] END AS TopRoleName,

  /* 9) EuroFixedRate */
  cb.EuroFixedRate AS EuroFixedRate,

  /* 10) AvailabilityCategoryId */
  cb.AvailabilityCategoryId AS AvailabilityCategoryId,

  /* 11) EmploymentStatusId (internal consultants only, NULL for external) */
  consultancy_user.[EmploymentStatusId] AS EmploymentStatusId,

  /* 12) EmploymentStatusLabelTranslationsJSON (internal consultants only, NULL for external) */
  employment_status.[LabelTranslationsJSON] AS EmploymentStatusLabelTranslationsJSON,

  /* 13) TotalMatchingRequirements - placeholder, filled by app from Query 1 */
  0 AS TotalMatchingRequirements,

  /* 14) TopMatchesJson - JSON array of top matches (excludes Role and CustomRole categories)
         Shows top 3 if exactly 3 non-role matches exist, otherwise top 2 */
  (
    SELECT COALESCE(
      json_agg(
        json_build_object(
          'RequirementId', top_matches.RequirementId,
          'RequirementName', top_matches.RequirementName,
          'ConsultantScore', top_matches.ConsultantScore
        )
        ORDER BY top_matches.rn
      ),
      NULL
    )
    FROM (
      SELECT
        rm.RequirementId,
        rm.RequirementName,
        rm.ConsultantScore,
        ROW_NUMBER() OVER (ORDER BY rm.partial_score DESC) AS rn,
        COUNT(*) OVER () AS total_non_role_matches
      FROM ranked_matches rm
      WHERE rm.ConsultantId = cb.ConsultantId
        AND rm.CategoryId <> @Cat_Role
        AND rm.CategoryId <> @Cat_CustomRole
    ) top_matches
    WHERE top_matches.rn <= CASE WHEN top_matches.total_non_role_matches = 3 THEN 3 ELSE 2 END
  ) AS TopMatchesJson,

  /* 15) TopMatches - NULL placeholder for OutSystems structure definition */
  NULL AS TopMatches

FROM consultant_base cb
LEFT JOIN {ConsultancyUser} consultancy_user
  ON cb.ConsultancyUserId = consultancy_user.[Id]
  AND cb.IsInternal = 1
LEFT JOIN {Status} employment_status
  ON employment_status.[Id] = consultancy_user.[EmploymentStatusId]
LEFT JOIN {ExternalUser} external_user
  ON cb.ExternalUserId = external_user.[Id]
  AND cb.IsInternal <> 1
/* Standard TopRole via Role */
LEFT JOIN {Role} role_ref
  ON @UseCustomRoles <> 1
  AND role_ref.[Id] = cb.TopRoleId
LEFT JOIN {LocaleDict} role_locale
  ON @UseCustomRoles <> 1
  AND role_locale.[LocaleKeyId] = role_ref.[NameLocaleKeyId]
  AND role_locale.[LanguageId] = @SystemLanguage
/* Custom TopRole via TopCustomRoleId → CustomRole → RoleName */
LEFT JOIN {CustomRole} top_custom_role
  ON @UseCustomRoles = 1
  AND top_custom_role.[Id] = cb.TopCustomRoleId
LEFT JOIN {RoleName} top_custom_role_name
  ON @UseCustomRoles = 1
  AND top_custom_role_name.[Id] = top_custom_role.[RoleNameId]
LEFT JOIN {LocaleDict} top_custom_role_locale
  ON @UseCustomRoles = 1
  AND top_custom_role_locale.[LocaleKeyId] = top_custom_role_name.[NameLocaleKeyId]
  AND top_custom_role_locale.[LanguageId] = @SystemLanguage
LEFT JOIN {DemandConsultants} demand_consultant
  ON demand_consultant.[ConsultantId] = cb.ConsultantId
  AND demand_consultant.[DemandId] = @DemandId
