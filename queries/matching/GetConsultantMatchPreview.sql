/* GetConsultantMatchPreview : Advanced SQL (Aurora Postgres, ODC)
   Purpose: Preview query for consultant match cards.

   This is the PREVIEW QUERY (Query 2). Called after GetMatchesByDemandId (Query 1).
   Takes ConsultantIds from Query 1 and returns display data for preview cards.

   Input: @ConsultantIds (comma-separated, Expand Inline), @DemandId, @TenantId, @SystemLanguage,
          @UseCustomRoles, @UseGlobalSkillExperienceForRoleSkill,
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

/* _____________ Requirement matches with partial_score and names _____________ */
requirement_matches AS (
  SELECT
    experience.[ConsultantId] AS ConsultantId,
    req.RequirementId,
    req.[CategoryId]          AS CategoryId,
    experience.[Score]        AS ConsultantScore,

    /* partial_score: same formula as Query 1 branches (handles both RoleSkill and CustomRoleSkill) */
    CAST(
      CASE
        WHEN req.ReqScore = 0 THEN 0
        WHEN req.[CategoryId] = @Cat_RoleSkill OR req.[CategoryId] = @Cat_CustomRoleSkill THEN
          CASE WHEN experience.[Score] >= req.ReqScore
               THEN req.[DynamicWeight] * CAST(req.[RoleWeight] AS DOUBLE PRECISION)
               ELSE req.[DynamicWeight] * CAST(req.[RoleWeight] AS DOUBLE PRECISION)
                    * (CAST(experience.[Score] AS DOUBLE PRECISION) / CAST(req.ReqScore AS DOUBLE PRECISION))
          END
        ELSE
          CASE WHEN experience.[Score] >= req.ReqScore
               THEN req.[DynamicWeight] * 100.0
               ELSE req.[DynamicWeight] * 100.0
                    * (CAST(experience.[Score] AS DOUBLE PRECISION) / CAST(req.ReqScore AS DOUBLE PRECISION))
          END
      END
    AS DOUBLE PRECISION) AS partial_score,

    /* Name resolution: COALESCE across all category-specific joins (supports custom roles) */
    COALESCE(
      skill_alias_locale.[TextValue],
      role_alias_locale.[TextValue],
      custom_role_locale.[TextValue],
      industry_locale.[TextValue],
      functional_locale.[TextValue],
      language_locale.[TextValue]
    ) AS RequirementName

  FROM requirement req

  /* Experience join - category-specific matching (supports both standard and custom roles) */
  JOIN {Experience} experience
    ON experience.[ConsultantId] IN (@ConsultantIds)
    AND experience.[TenantId] = req.[TenantId]
    AND (
      /* Standard RoleSkill (role-scoped mode) */
      (@UseCustomRoles <> 1
       AND @UseGlobalSkillExperienceForRoleSkill <> 1
       AND req.[CategoryId] = @Cat_RoleSkill
       AND experience.[CategoryId] = @Cat_RoleSkill
       AND experience.[RoleId] = req.[RoleId]
       AND experience.[SkillId] = req.[SkillId])
      /* Standard RoleSkill (global skill mode) */
      OR (@UseCustomRoles <> 1
          AND @UseGlobalSkillExperienceForRoleSkill = 1
          AND req.[CategoryId] = @Cat_RoleSkill
          AND experience.[CategoryId] = @Cat_Skill
          AND experience.[SkillId] = req.[SkillId])
      /* Custom RoleSkill (role-scoped mode) */
      OR (@UseCustomRoles = 1
          AND @UseGlobalSkillExperienceForRoleSkill <> 1
          AND req.[CategoryId] = @Cat_CustomRoleSkill
          AND experience.[CategoryId] = @Cat_CustomRoleSkill
          AND experience.[CustomRoleId] = req.[CustomRoleId]
          AND experience.[SkillId] = req.[SkillId])
      /* Custom RoleSkill (global skill mode) */
      OR (@UseCustomRoles = 1
          AND @UseGlobalSkillExperienceForRoleSkill = 1
          AND req.[CategoryId] = @Cat_CustomRoleSkill
          AND experience.[CategoryId] = @Cat_CustomSkill
          AND experience.[SkillId] = req.[SkillId])
      /* Standard Role */
      OR (@UseCustomRoles <> 1
          AND req.[CategoryId] = @Cat_Role
          AND experience.[CategoryId] = @Cat_Role
          AND experience.[RoleId] = req.[RoleId]
          AND experience.[SkillId] IS NULL)
      /* Custom Role */
      OR (@UseCustomRoles = 1
          AND req.[CategoryId] = @Cat_CustomRole
          AND experience.[CategoryId] = @Cat_CustomRole
          AND experience.[CustomRoleId] = req.[CustomRoleId]
          AND experience.[SkillId] IS NULL)
      /* Industry (unchanged) */
      OR (req.[CategoryId] = @Cat_Industry
          AND experience.[CategoryId] = @Cat_Industry
          AND experience.[IndustryId] = req.[IndustryId])
      /* FunctionalArea (unchanged) */
      OR (req.[CategoryId] = @Cat_FunctionalArea
          AND experience.[CategoryId] = @Cat_FunctionalArea
          AND experience.[FunctionalAreaId] = req.[FunctionalAreaId])
      /* Language (unchanged) */
      OR (req.[CategoryId] = @Cat_Language
          AND experience.[CategoryId] = @Cat_Language
          AND experience.[LanguageId] = req.[LanguageId])
    )
    AND experience.[Score] > 0

  /* LocaleDict joins for requirement names - RoleSkill/CustomRoleSkill category via SkillAlias */
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

  /* LocaleDict joins for requirement names - CustomRole category via CustomRole → RoleName */
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

  WHERE req.ReqScore > 0
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
