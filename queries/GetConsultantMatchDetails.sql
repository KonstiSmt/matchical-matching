/* GetConsultantMatchDetails : Advanced SQL (Aurora Postgres, ODC)
   Purpose: Hydration query for consultant match cards.

   This is the DISPLAY QUERY (Query 2). Called after GetMatchesByDemandId (Query 1).
   Takes ConsultantIds from Query 1 and returns full display data.

   Input: @ConsultantIds (comma-separated, Expand Inline), @DemandId, @TenantId, @SystemLanguage

   Output columns (ordered):
     ConsultantId, MatchingScore, PricePerformanceScore, FirstName, LastName, PhotoUrl,
     RoleTitle, EuroFixedRate, TotalMatchingRequirements, TopMatchesJson, TopMatches, IsPinned

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
    consultant.[EuroFixedRate]    AS EuroFixedRate
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

    /* partial_score: same formula as Query 1 branches */
    CAST(
      CASE
        WHEN req.ReqScore = 0 THEN 0
        WHEN req.[CategoryId] = @Cat_RoleSkill THEN
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

    /* Name resolution: COALESCE across all category-specific joins */
    COALESCE(
      skill_alias_locale.[TextValue],
      role_alias_locale.[TextValue],
      industry_locale.[TextValue],
      functional_locale.[TextValue],
      language_locale.[TextValue]
    ) AS RequirementName

  FROM requirement req

  /* Experience join - category-specific matching */
  JOIN {Experience} experience
    ON experience.[ConsultantId] IN (@ConsultantIds)
    AND experience.[TenantId] = req.[TenantId]
    AND experience.[CategoryId] = req.[CategoryId]
    AND (
      (req.[CategoryId] = @Cat_RoleSkill
       AND experience.[RoleId] = req.[RoleId]
       AND experience.[SkillId] = req.[SkillId])
      OR (req.[CategoryId] = @Cat_Role
          AND experience.[RoleId] = req.[RoleId]
          AND experience.[SkillId] IS NULL)
      OR (req.[CategoryId] = @Cat_Industry
          AND experience.[IndustryId] = req.[IndustryId])
      OR (req.[CategoryId] = @Cat_FunctionalArea
          AND experience.[FunctionalAreaId] = req.[FunctionalAreaId])
      OR (req.[CategoryId] = @Cat_Language
          AND experience.[LanguageId] = req.[LanguageId])
    )
    AND experience.[Score] > 0

  /* LocaleDict joins for requirement names - RoleSkill category via SkillAlias */
  LEFT JOIN {SkillAlias} skill_alias
    ON req.[CategoryId] = @Cat_RoleSkill
    AND skill_alias.[Id] = req.[SkillAliasId]
  LEFT JOIN {LocaleDict} skill_alias_locale
    ON skill_alias_locale.[LocaleKeyId] = skill_alias.[NameLocaleKeyId]
    AND skill_alias_locale.[LanguageId] = @SystemLanguage

  /* LocaleDict joins for requirement names - Role category via RoleAlias */
  LEFT JOIN {RoleAlias} role_alias
    ON req.[CategoryId] = @Cat_Role
    AND role_alias.[Id] = req.[RoleAliasId]
  LEFT JOIN {LocaleDict} role_alias_locale
    ON role_alias_locale.[LocaleKeyId] = role_alias.[NameLocaleKeyId]
    AND role_alias_locale.[LanguageId] = @SystemLanguage

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

  /* 2) MatchingScore - placeholder, filled by app from Query 1 */
  0 AS MatchingScore,

  /* 3) PricePerformanceScore - placeholder, filled by app from Query 1 */
  0 AS PricePerformanceScore,

  /* 4) FirstName */
  (CASE WHEN cb.IsInternal = 1 THEN consultancy_user.[FirstName] ELSE external_user.[FirstName] END) AS FirstName,

  /* 5) LastName */
  (CASE WHEN cb.IsInternal = 1 THEN consultancy_user.[LastName] ELSE external_user.[LastName] END) AS LastName,

  /* 6) PhotoUrl */
  (CASE WHEN cb.IsInternal = 1
        THEN COALESCE(NULLIF(consultancy_user.[DefaultPhotoUrlRound], ''), consultancy_user.[DefaultPhotoUrl])
        ELSE COALESCE(NULLIF(external_user.[DefaultPhotoUrlRound], ''), external_user.[DefaultPhotoUrl])
   END) AS PhotoUrl,

  /* 7) RoleTitle */
  role_locale.[TextValue] AS RoleTitle,

  /* 8) EuroFixedRate */
  cb.EuroFixedRate AS EuroFixedRate,

  /* 9) TotalMatchingRequirements - placeholder, filled by app from Query 1 */
  0 AS TotalMatchingRequirements,

  /* 10) TopMatchesJson - JSON array of top 3 matches (excludes Role category) */
  (
    SELECT COALESCE(
      json_agg(
        json_build_object(
          'RequirementId', top_matches.RequirementId,
          'RequirementName', top_matches.RequirementName,
          'ConsultantScore', top_matches.ConsultantScore
        )
      ),
      '[]'::json
    )
    FROM (
      SELECT rm.RequirementId, rm.RequirementName, rm.ConsultantScore
      FROM ranked_matches rm
      WHERE rm.ConsultantId = cb.ConsultantId
        AND rm.CategoryId <> @Cat_Role
      ORDER BY rm.partial_score DESC
      LIMIT 3
    ) top_matches
  ) AS TopMatchesJson,

  /* 11) TopMatches - empty placeholder for OutSystems structure definition */
  '[]'::json AS TopMatches,

  /* 12) IsPinned - true if consultant is assigned to this demand */
  CASE WHEN EXISTS (
    SELECT 1 FROM {DemandConsultants} demand_consultant
    WHERE demand_consultant.[ConsultantId] = cb.ConsultantId
      AND demand_consultant.[DemandId] = @DemandId
  ) THEN 1 ELSE 0 END AS IsPinned

FROM consultant_base cb
LEFT JOIN {ConsultancyUser} consultancy_user
  ON cb.ConsultancyUserId = consultancy_user.[Id]
  AND cb.IsInternal = 1
LEFT JOIN {ExternalUser} external_user
  ON cb.ExternalUserId = external_user.[Id]
  AND cb.IsInternal <> 1
LEFT JOIN {Role} role_ref
  ON role_ref.[Id] = cb.TopRoleId
LEFT JOIN {LocaleDict} role_locale
  ON role_locale.[LocaleKeyId] = role_ref.[NameLocaleKeyId]
  AND role_locale.[LanguageId] = @SystemLanguage
