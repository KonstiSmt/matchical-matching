/* GetDemandMatchPreview : Advanced SQL (Aurora Postgres, ODC)
   Purpose: Preview query for demand match cards.

   This is the PREVIEW QUERY (Query 6). Called after GetMatchesByConsultantId (Query 5).
   Takes DemandIds from Query 5 and returns display data for preview cards.

   Input: @DemandIds (comma-separated, Expand Inline), @ConsultantId, @TenantId, @SystemLanguage

   Output columns (ordered):
     DemandId, IsPinned, MatchingScore, PricePerformanceScore, DemandName, ClientCompanyName,
     LogoUrl, TotalMatchingRequirements, TopMatchesJson, TopMatches

   NOTE: MatchingScore and PricePerformanceScore return 0 as placeholders.
   These values are already calculated in Query 5 and should be mapped in the
   application layer after this query returns.
*/

WITH
/* _____________ Demand base info _____________ */
demand_base AS (
  SELECT
    demand.[Id]               AS DemandId,
    demand.[NameLocaleKeyId]  AS NameLocaleKeyId,
    demand.[OpportunityId]    AS OpportunityId
  FROM {Demand} demand
  WHERE demand.[Id] IN (@DemandIds)
    AND demand.[TenantId] = @TenantId
),

/* _____________ Requirement matches with partial_score and names _____________ */
requirement_matches AS (
  SELECT
    req.[DemandId]            AS DemandId,
    req.[Id]                  AS RequirementId,
    req.[CategoryId]          AS CategoryId,
    experience.[Score]        AS ConsultantScore,

    /* partial_score: same formula as Query 2 branches (handles both RoleSkill and CustomRoleSkill) */
    CAST(
      CASE
        WHEN req.[Score] = 0 THEN 0
        WHEN req.[CategoryId] = @Cat_RoleSkill OR req.[CategoryId] = @Cat_CustomRoleSkill THEN
          CASE WHEN experience.[Score] >= req.[Score]
               THEN req.[DynamicWeight] * CAST(req.[RoleWeight] AS DOUBLE PRECISION)
               ELSE req.[DynamicWeight] * CAST(req.[RoleWeight] AS DOUBLE PRECISION)
                    * (CAST(experience.[Score] AS DOUBLE PRECISION) / CAST(req.[Score] AS DOUBLE PRECISION))
          END
        ELSE
          CASE WHEN experience.[Score] >= req.[Score]
               THEN req.[DynamicWeight] * 100.0
               ELSE req.[DynamicWeight] * 100.0
                    * (CAST(experience.[Score] AS DOUBLE PRECISION) / CAST(req.[Score] AS DOUBLE PRECISION))
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

  FROM {DemandRequirement} req

  /* Experience join - for the single consultant, category-specific matching (supports both standard and custom roles) */
  JOIN {Experience} experience
    ON experience.[ConsultantId] = @ConsultantId
    AND experience.[TenantId] = req.[TenantId]
    AND experience.[CategoryId] = req.[CategoryId]
    AND (
      /* Standard RoleSkill */
      (@UseCustomRoles <> 1
       AND req.[CategoryId] = @Cat_RoleSkill
       AND experience.[RoleId] = req.[RoleId]
       AND experience.[SkillId] = req.[SkillId])
      /* Custom RoleSkill */
      OR (@UseCustomRoles = 1
          AND req.[CategoryId] = @Cat_CustomRoleSkill
          AND experience.[CustomRoleId] = req.[CustomRoleId]
          AND experience.[SkillId] = req.[SkillId])
      /* Standard Role */
      OR (@UseCustomRoles <> 1
          AND req.[CategoryId] = @Cat_Role
          AND experience.[RoleId] = req.[RoleId]
          AND experience.[SkillId] IS NULL)
      /* Custom Role */
      OR (@UseCustomRoles = 1
          AND req.[CategoryId] = @Cat_CustomRole
          AND experience.[CustomRoleId] = req.[CustomRoleId]
          AND experience.[SkillId] IS NULL)
      /* Industry (unchanged) */
      OR (req.[CategoryId] = @Cat_Industry
          AND experience.[IndustryId] = req.[IndustryId])
      /* FunctionalArea (unchanged) */
      OR (req.[CategoryId] = @Cat_FunctionalArea
          AND experience.[FunctionalAreaId] = req.[FunctionalAreaId])
      /* Language (unchanged) */
      OR (req.[CategoryId] = @Cat_Language
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

  WHERE req.[DemandId] IN (@DemandIds)
    AND req.[TenantId] = @TenantId
    AND req.[IsActive] = 1
    AND NOT (req.[HasMissingKeys] = 1)
    AND req.[Score] > 0
),

/* _____________ Ranked matches per demand _____________ */
ranked_matches AS (
  SELECT
    rm.DemandId,
    rm.RequirementId,
    rm.CategoryId,
    rm.ConsultantScore,
    rm.partial_score,
    rm.RequirementName
  FROM requirement_matches rm
)

/* _____________ Final projection _____________ */
SELECT
  /* 1) DemandId */
  db.DemandId AS DemandId,

  /* 2) IsPinned - true if consultant is assigned to this demand */
  CASE WHEN demand_consultant.[Id] IS NOT NULL THEN 1 ELSE 0 END AS IsPinned,

  /* 3) MatchingScore - placeholder, filled by app from Query 5 */
  0 AS MatchingScore,

  /* 4) PricePerformanceScore - placeholder, filled by app from Query 5 */
  0 AS PricePerformanceScore,

  /* 5) DemandName */
  demand_name_locale.[TextValue] AS DemandName,

  /* 6) ClientCompanyName */
  company.[Name] AS ClientCompanyName,

  /* 7) LogoUrl */
  company.[LogoUrl] AS LogoUrl,

  /* 8) TotalMatchingRequirements - placeholder, filled by app from Query 5 */
  0 AS TotalMatchingRequirements,

  /* 9) TopMatchesJson - JSON array of top matches (excludes Role and CustomRole categories)
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
      WHERE rm.DemandId = db.DemandId
        AND rm.CategoryId <> @Cat_Role
        AND rm.CategoryId <> @Cat_CustomRole
    ) top_matches
    WHERE top_matches.rn <= CASE WHEN top_matches.total_non_role_matches = 3 THEN 3 ELSE 2 END
  ) AS TopMatchesJson,

  /* 10) TopMatches - NULL placeholder for OutSystems structure definition */
  NULL AS TopMatches

FROM demand_base db
LEFT JOIN {LocaleDict} demand_name_locale
  ON demand_name_locale.[LocaleKeyId] = db.NameLocaleKeyId
  AND demand_name_locale.[LanguageId] = @SystemLanguage
LEFT JOIN {Opportunity} opportunity
  ON opportunity.[Id] = db.OpportunityId
LEFT JOIN {Company} company
  ON company.[Id] = opportunity.[ClientCompanyId]
LEFT JOIN {DemandConsultants} demand_consultant
  ON demand_consultant.[DemandId] = db.DemandId
  AND demand_consultant.[ConsultantId] = @ConsultantId
