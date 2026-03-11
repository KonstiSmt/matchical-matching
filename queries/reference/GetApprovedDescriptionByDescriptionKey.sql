/* GetApprovedDescriptionByDescriptionKey : Advanced SQL (Aurora Postgres, ODC)
   Purpose: Return one approved localized text per description category for a given description key.

   Input:
     @DescriptionKeyId,
     @TenantId,
     @PreferredLanguageCode

   Output:
     DescriptionCategoryId,
     CategoryLabel,
     LanguageCode,
     TextValue
*/

WITH description_scope AS (
  SELECT
    description_dict.[DescriptionCategoryId],
    description_dict.[DescriptionLocaleKeyId]
  FROM {DescriptionDict} description_dict
  WHERE description_dict.[DescriptionKeyId] = @DescriptionKeyId
    AND description_dict.[TenantId] = @TenantId
),
category_scope AS (
  SELECT DISTINCT
    description_scope.[DescriptionCategoryId]
  FROM description_scope
),
approved_candidates AS (
  SELECT
    description_scope.[DescriptionCategoryId],
    locale_dict.[TextValue],
    COALESCE(system_language.[LanguageCode], CAST(locale_dict.[LanguageId] AS TEXT)) AS LanguageCode,
    ROW_NUMBER() OVER (
      PARTITION BY description_scope.[DescriptionCategoryId]
      ORDER BY
        CASE
          WHEN COALESCE(system_language.[LanguageCode], CAST(locale_dict.[LanguageId] AS TEXT))
             = CAST(@PreferredLanguageCode AS TEXT) THEN 0
          ELSE 1
        END,
        COALESCE(system_language.[Label], '') ASC,
        COALESCE(system_language.[LanguageCode], CAST(locale_dict.[LanguageId] AS TEXT)) ASC,
        COALESCE(locale_dict.[TextValue], '') ASC
    ) AS CandidateRank
  FROM description_scope
  JOIN {LocaleDict} locale_dict
    ON locale_dict.[LocaleKeyId] = description_scope.[DescriptionLocaleKeyId]
   AND locale_dict.[IsApproved] = 1
  LEFT JOIN {SystemLanguage} system_language
    ON system_language.[LanguageCode] = CAST(locale_dict.[LanguageId] AS TEXT)
)
SELECT
  category_scope.[DescriptionCategoryId] AS DescriptionCategoryId,
  COALESCE(category_ref.[Label], '') AS CategoryLabel,
  approved_candidates.[LanguageCode] AS LanguageCode,
  COALESCE(approved_candidates.[TextValue], '') AS TextValue
FROM category_scope
LEFT JOIN {Category} category_ref
  ON category_ref.[Id] = category_scope.[DescriptionCategoryId]
LEFT JOIN approved_candidates
  ON approved_candidates.[DescriptionCategoryId] = category_scope.[DescriptionCategoryId]
 AND approved_candidates.[CandidateRank] = 1
ORDER BY
  COALESCE(category_ref.[Order], 2147483647) ASC,
  COALESCE(category_ref.[Label], '') ASC,
  category_scope.[DescriptionCategoryId]
