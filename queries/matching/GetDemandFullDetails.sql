/* GetDemandFullDetails : Advanced SQL (Aurora Postgres, ODC)
   Purpose: Full details query for a single demand's matching breakdown against a consultant.
   Used when clicking on a demand card to open the sidebar with complete requirement details.

   This is the DETAILS QUERY (Query 7). Called when viewing a single demand's full match info.
   Returns all requirements with scoring breakdown, grouped by category.

   Input: @DemandId (single), @ConsultantId, @TenantId, @SystemLanguage
          Category IDs: @Cat_RoleSkill, @Cat_Role, @Cat_Industry, @Cat_FunctionalArea, @Cat_Language
                        @Cat_CustomRoleSkill, @Cat_CustomRole
          @UseCustomRoles

   Output columns (ordered):
     DemandId, IsPinned, MatchingScore, PricePerformanceScore,
     DemandName, ClientCompanyName, LogoUrl,
     EuroFixedRate, ClientOffsiteRate, ContingentDays,
     RequiredLocationName, RequiredLocationColor, MatchingConsultantLocationName, MatchingConsultantLocationColor,
     RoleSkillsJson, IndustriesJson, FunctionalAreasJson, LanguagesJson,
     RoleSkills, Industries, FunctionalAreas, Languages

   NOTE: PricePerformanceScore returns 0 as placeholder (cannot calculate for single demand).
*/

WITH
/* _____________ Demand base info _____________ */
demand_base AS (
  SELECT
    demand.[Id]                AS DemandId,
    demand.[NameLocaleKeyId]   AS NameLocaleKeyId,
    demand.[OpportunityId]     AS OpportunityId,
    demand.[ClientOffsiteRate] AS ClientOffsiteRate,
    demand.[ContingentDays]    AS ContingentDays,
    demand.[LocationTagId]     AS LocationTagId
  FROM {Demand} demand
  WHERE demand.[Id] = @DemandId
    AND demand.[TenantId] = @TenantId
),

/* _____________ Requirements (all active, valid requirements for demand) _____________ */
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
    req.[IsNiceToHave],
    req.[TenantId]
  FROM {DemandRequirement} req
  WHERE req.[DemandId] = @DemandId
    AND req.[TenantId] = @TenantId
    AND req.[IsActive] = 1
    AND NOT (req.[HasMissingKeys] = 1)
),

/* _____________ Experience matches with partial_score calculation _____________ */
experience_match AS (
  SELECT
    req.RequirementId,
    req.[CategoryId],
    req.[RoleId],
    req.[CustomRoleId],
    req.[SkillId],
    req.[SkillAliasId],
    req.[RoleAliasId],
    req.[IndustryId],
    req.[FunctionalAreaId],
    req.[LanguageId],
    req.ReqScore,
    req.[DynamicWeight],
    req.[RoleWeight],
    COALESCE(experience.[Score], 0) AS ConsultantScore,

    /* partial_score: same formula as Query 1 branches (handles both RoleSkill and CustomRoleSkill) */
    CAST(
      CASE
        WHEN req.ReqScore = 0 THEN 0
        WHEN req.[CategoryId] = @Cat_RoleSkill OR req.[CategoryId] = @Cat_CustomRoleSkill THEN
          CASE WHEN COALESCE(experience.[Score], 0) >= req.ReqScore
               THEN req.[DynamicWeight] * CAST(req.[RoleWeight] AS DOUBLE PRECISION)
               ELSE req.[DynamicWeight] * CAST(req.[RoleWeight] AS DOUBLE PRECISION)
                    * (CAST(COALESCE(experience.[Score], 0) AS DOUBLE PRECISION) / CAST(req.ReqScore AS DOUBLE PRECISION))
          END
        ELSE
          CASE WHEN COALESCE(experience.[Score], 0) >= req.ReqScore
               THEN req.[DynamicWeight] * 100.0
               ELSE req.[DynamicWeight] * 100.0
                    * (CAST(COALESCE(experience.[Score], 0) AS DOUBLE PRECISION) / CAST(req.ReqScore AS DOUBLE PRECISION))
          END
      END
    AS DOUBLE PRECISION) AS partial_score,

    /* IsMustHave: invert IsNiceToHave */
    CASE WHEN req.[IsNiceToHave] = 1 THEN 0 ELSE 1 END AS IsMustHave

  FROM requirement req
  LEFT JOIN {Experience} experience
    ON experience.[ConsultantId] = @ConsultantId
    AND experience.[TenantId] = req.[TenantId]
    AND (
      /* Standard RoleSkill */
      (@UseCustomRoles <> 1
       AND experience.[CategoryId] = @Cat_RoleSkill
       AND req.[CategoryId] = @Cat_RoleSkill
       AND experience.[RoleId] = req.[RoleId]
       AND experience.[SkillId] = req.[SkillId])
      /* Custom RoleSkill */
      OR (@UseCustomRoles = 1
          AND experience.[CategoryId] = @Cat_CustomRoleSkill
          AND req.[CategoryId] = @Cat_CustomRoleSkill
          AND experience.[CustomRoleId] = req.[CustomRoleId]
          AND experience.[SkillId] = req.[SkillId])
      /* Standard Role */
      OR (@UseCustomRoles <> 1
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
      /* Industry (unchanged) */
      OR (experience.[CategoryId] = @Cat_Industry
          AND req.[CategoryId] = @Cat_Industry
          AND experience.[IndustryId] = req.[IndustryId])
      /* FunctionalArea (unchanged) */
      OR (experience.[CategoryId] = @Cat_FunctionalArea
          AND req.[CategoryId] = @Cat_FunctionalArea
          AND experience.[FunctionalAreaId] = req.[FunctionalAreaId])
      /* Language (unchanged) */
      OR (experience.[CategoryId] = @Cat_Language
          AND req.[CategoryId] = @Cat_Language
          AND experience.[LanguageId] = req.[LanguageId])
    )
),

/* _____________ Matching score aggregate _____________ */
matching_score AS (
  SELECT
    COALESCE(SUM(em.partial_score), 0) AS MatchingScore
  FROM experience_match em
),

/* _____________ Location match (find consultant location that matches demand) _____________ */
location_match AS (
  SELECT
    location_locale.[TextValue] AS MatchingConsultantLocationName,
    location_category.[Color] AS MatchingConsultantLocationColor
  FROM demand_base db
  JOIN {ConsultantLocations} consultant_location
    ON consultant_location.[ConsultantId] = @ConsultantId
  JOIN {LocationTagsClosure} location_closure
    ON (
      /* Consultant location is descendant of demand location (consultant within demand) */
      location_closure.[AncestorId] = db.LocationTagId
      AND location_closure.[DescendantId] = consultant_location.[LocationTagId]
    )
    OR (
      /* Consultant location is ancestor of demand location (consultant covers demand) */
      location_closure.[AncestorId] = consultant_location.[LocationTagId]
      AND location_closure.[DescendantId] = db.LocationTagId
    )
  JOIN {LocationTag} location_tag
    ON location_tag.[Id] = consultant_location.[LocationTagId]
  LEFT JOIN {Category} location_category
    ON location_category.[Id] = location_tag.[CategoryId]
  LEFT JOIN {LocaleDict} location_locale
    ON location_locale.[LocaleKeyId] = location_tag.[NameLocaleKeyId]
    AND location_locale.[LanguageId] = @SystemLanguage
  LIMIT 1
)

/* _____________ Final projection _____________ */
SELECT
  /* 1) DemandId */
  db.DemandId AS DemandId,

  /* 2) IsPinned */
  CASE WHEN demand_consultant.[Id] IS NOT NULL THEN 1 ELSE 0 END AS IsPinned,

  /* 3) MatchingScore (calculated) */
  ms.MatchingScore AS MatchingScore,

  /* 4) PricePerformanceScore (placeholder) */
  0 AS PricePerformanceScore,

  /* 5) DemandName */
  demand_name_locale.[TextValue] AS DemandName,

  /* 6) ClientCompanyName */
  company.[Name] AS ClientCompanyName,

  /* 7) LogoUrl */
  company.[LogoUrl] AS LogoUrl,

  /* 8) EuroFixedRate */
  consultant.[EuroFixedRate] AS EuroFixedRate,

  /* 9) ClientOffsiteRate */
  db.ClientOffsiteRate AS ClientOffsiteRate,

  /* 10) ContingentDays */
  db.ContingentDays AS ContingentDays,

  /* 11) RequiredLocationName */
  demand_location_locale.[TextValue] AS RequiredLocationName,

  /* 12) RequiredLocationColor */
  demand_location_category.[Color] AS RequiredLocationColor,

  /* 13) MatchingConsultantLocationName */
  lm.MatchingConsultantLocationName AS MatchingConsultantLocationName,

  /* 14) MatchingConsultantLocationColor */
  lm.MatchingConsultantLocationColor AS MatchingConsultantLocationColor,

  /* 15) RoleSkillsJson (nested: roles with skills inside, ordered by DynamicWeight DESC, Name ASC) */
  /* Supports both standard roles (RoleAlias) and custom roles (CustomRole → RoleName) */
  (
    SELECT COALESCE(
      json_agg(
        json_build_object(
          'RoleAliasId', role_data.RoleAliasId,
          'RoleAliasName', role_data.RoleAliasName,
          'ConsultantScore', role_data.ConsultantScore,
          'RequiredScore', role_data.RequiredScore,
          'DynamicWeight', role_data.DynamicWeight,
          'PartialScore', role_data.PartialScore,
          'IsMustHave', role_data.IsMustHave,
          'Skills', role_data.Skills
        )
        ORDER BY role_data.DynamicWeight DESC, role_data.RoleAliasName ASC
      ),
      NULL
    )
    FROM (
      SELECT
        /* Output RoleAliasId or CustomRoleId depending on mode */
        CASE WHEN @UseCustomRoles = 1 THEN em_role.[CustomRoleId] ELSE em_role.[RoleAliasId] END AS RoleAliasId,
        /* Output standard or custom role name */
        CASE WHEN @UseCustomRoles = 1 THEN custom_role_locale.[TextValue] ELSE role_alias_locale.[TextValue] END AS RoleAliasName,
        em_role.ConsultantScore AS ConsultantScore,
        em_role.ReqScore AS RequiredScore,
        em_role.[DynamicWeight] AS DynamicWeight,
        em_role.partial_score AS PartialScore,
        em_role.IsMustHave AS IsMustHave,
        (
          SELECT COALESCE(
            json_agg(
              json_build_object(
                'SkillAliasId', em_skill.[SkillAliasId],
                'SkillAliasName', skill_alias_locale_inner.[TextValue],
                'ConsultantScore', em_skill.ConsultantScore,
                'RequiredScore', em_skill.ReqScore,
                'DynamicWeight', em_skill.[DynamicWeight] * em_skill.[RoleWeight] / 100.0,
                'PartialScore', em_skill.partial_score,
                'IsMustHave', em_skill.IsMustHave
              )
              ORDER BY (em_skill.[DynamicWeight] * em_skill.[RoleWeight] / 100.0) DESC, skill_alias_locale_inner.[TextValue] ASC
            ),
            NULL
          )
          FROM experience_match em_skill
          LEFT JOIN {SkillAlias} skill_alias_inner
            ON skill_alias_inner.[Id] = em_skill.[SkillAliasId]
          LEFT JOIN {LocaleDict} skill_alias_locale_inner
            ON skill_alias_locale_inner.[LocaleKeyId] = skill_alias_inner.[NameLocaleKeyId]
            AND skill_alias_locale_inner.[LanguageId] = @SystemLanguage
          /* Group skills by role - standard RoleId or CustomRoleId */
          WHERE (
            (@UseCustomRoles <> 1
             AND em_skill.[CategoryId] = @Cat_RoleSkill
             AND em_skill.[RoleId] = em_role.[RoleId])
            OR (@UseCustomRoles = 1
                AND em_skill.[CategoryId] = @Cat_CustomRoleSkill
                AND em_skill.[CustomRoleId] = em_role.[CustomRoleId])
          )
        ) AS Skills
      FROM experience_match em_role
      /* Standard Role name via RoleAlias */
      LEFT JOIN {RoleAlias} role_alias
        ON @UseCustomRoles <> 1
        AND role_alias.[Id] = em_role.[RoleAliasId]
      LEFT JOIN {LocaleDict} role_alias_locale
        ON @UseCustomRoles <> 1
        AND role_alias_locale.[LocaleKeyId] = role_alias.[NameLocaleKeyId]
        AND role_alias_locale.[LanguageId] = @SystemLanguage
      /* Custom Role name via CustomRole → RoleName */
      LEFT JOIN {CustomRole} custom_role
        ON @UseCustomRoles = 1
        AND custom_role.[Id] = em_role.[CustomRoleId]
      LEFT JOIN {RoleName} custom_role_name
        ON @UseCustomRoles = 1
        AND custom_role_name.[Id] = custom_role.[RoleNameId]
      LEFT JOIN {LocaleDict} custom_role_locale
        ON @UseCustomRoles = 1
        AND custom_role_locale.[LocaleKeyId] = custom_role_name.[NameLocaleKeyId]
        AND custom_role_locale.[LanguageId] = @SystemLanguage
      /* Filter to Role or CustomRole category */
      WHERE (
        (@UseCustomRoles <> 1 AND em_role.[CategoryId] = @Cat_Role)
        OR (@UseCustomRoles = 1 AND em_role.[CategoryId] = @Cat_CustomRole)
      )
    ) role_data
  ) AS RoleSkillsJson,

  /* 16) IndustriesJson (ordered by DynamicWeight DESC, Name ASC) */
  (
    SELECT COALESCE(
      json_agg(
        json_build_object(
          'IndustryId', em.[IndustryId],
          'IndustryName', industry_locale.[TextValue],
          'ConsultantScore', em.ConsultantScore,
          'RequiredScore', em.ReqScore,
          'DynamicWeight', em.[DynamicWeight],
          'PartialScore', em.partial_score,
          'IsMustHave', em.IsMustHave
        )
        ORDER BY em.[DynamicWeight] DESC, industry_locale.[TextValue] ASC
      ),
      NULL
    )
    FROM experience_match em
    LEFT JOIN {Industry} industry
      ON industry.[Id] = em.[IndustryId]
    LEFT JOIN {LocaleDict} industry_locale
      ON industry_locale.[LocaleKeyId] = industry.[NameLocaleKeyId]
      AND industry_locale.[LanguageId] = @SystemLanguage
    WHERE em.[CategoryId] = @Cat_Industry
  ) AS IndustriesJson,

  /* 17) FunctionalAreasJson (ordered by DynamicWeight DESC, Name ASC) */
  (
    SELECT COALESCE(
      json_agg(
        json_build_object(
          'FunctionalAreaId', em.[FunctionalAreaId],
          'FunctionalAreaName', functional_area_locale.[TextValue],
          'ConsultantScore', em.ConsultantScore,
          'RequiredScore', em.ReqScore,
          'DynamicWeight', em.[DynamicWeight],
          'PartialScore', em.partial_score,
          'IsMustHave', em.IsMustHave
        )
        ORDER BY em.[DynamicWeight] DESC, functional_area_locale.[TextValue] ASC
      ),
      NULL
    )
    FROM experience_match em
    LEFT JOIN {FunctionalArea} functional_area
      ON functional_area.[Id] = em.[FunctionalAreaId]
    LEFT JOIN {LocaleDict} functional_area_locale
      ON functional_area_locale.[LocaleKeyId] = functional_area.[NameLocaleKeyId]
      AND functional_area_locale.[LanguageId] = @SystemLanguage
    WHERE em.[CategoryId] = @Cat_FunctionalArea
  ) AS FunctionalAreasJson,

  /* 18) LanguagesJson (with level labels, ordered by DynamicWeight DESC, Name ASC) */
  (
    SELECT COALESCE(
      json_agg(
        json_build_object(
          'LanguageId', em.[LanguageId],
          'LanguageName', language_locale.[TextValue],
          'ConsultantScore', em.ConsultantScore,
          'RequiredScore', em.ReqScore,
          'DynamicWeight', em.[DynamicWeight],
          'PartialScore', em.partial_score,
          'IsMustHave', em.IsMustHave,
          'ConsultantLevelLabelJson', consultant_level.[LabelTranslationsJSON],
          'RequiredLevelLabelJson', required_level.[LabelTranslationsJSON]
        )
        ORDER BY em.[DynamicWeight] DESC, language_locale.[TextValue] ASC
      ),
      NULL
    )
    FROM experience_match em
    LEFT JOIN {Language} language_ref
      ON language_ref.[Id] = em.[LanguageId]
    LEFT JOIN {LocaleDict} language_locale
      ON language_locale.[LocaleKeyId] = language_ref.[NameLocaleKeyId]
      AND language_locale.[LanguageId] = @SystemLanguage
    LEFT JOIN {LanguageLevel} consultant_level
      ON consultant_level.[Order] = em.ConsultantScore
    LEFT JOIN {LanguageLevel} required_level
      ON required_level.[Order] = em.ReqScore
    WHERE em.[CategoryId] = @Cat_Language
  ) AS LanguagesJson,

  /* 19) RoleSkills (NULL placeholder for OutSystems structure) */
  NULL AS RoleSkills,

  /* 20) Industries (NULL placeholder for OutSystems structure) */
  NULL AS Industries,

  /* 21) FunctionalAreas (NULL placeholder for OutSystems structure) */
  NULL AS FunctionalAreas,

  /* 22) Languages (NULL placeholder for OutSystems structure) */
  NULL AS Languages

FROM demand_base db
CROSS JOIN matching_score ms
LEFT JOIN location_match lm ON TRUE
LEFT JOIN {Consultant} consultant
  ON consultant.[Id] = @ConsultantId
  AND consultant.[TenantId] = @TenantId
LEFT JOIN {LocaleDict} demand_name_locale
  ON demand_name_locale.[LocaleKeyId] = db.NameLocaleKeyId
  AND demand_name_locale.[LanguageId] = @SystemLanguage
LEFT JOIN {Opportunity} opportunity
  ON opportunity.[Id] = db.OpportunityId
LEFT JOIN {Company} company
  ON company.[Id] = opportunity.[ClientCompanyId]
LEFT JOIN {LocationTag} demand_location
  ON demand_location.[Id] = db.LocationTagId
LEFT JOIN {Category} demand_location_category
  ON demand_location_category.[Id] = demand_location.[CategoryId]
LEFT JOIN {LocaleDict} demand_location_locale
  ON demand_location_locale.[LocaleKeyId] = demand_location.[NameLocaleKeyId]
  AND demand_location_locale.[LanguageId] = @SystemLanguage
LEFT JOIN {DemandConsultants} demand_consultant
  ON demand_consultant.[DemandId] = db.DemandId
  AND demand_consultant.[ConsultantId] = @ConsultantId
