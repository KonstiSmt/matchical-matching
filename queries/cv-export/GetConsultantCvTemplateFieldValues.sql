/* GetConsultantCvTemplateFieldValues : Advanced SQL (Aurora Postgres, ODC)
   Purpose: Return dynamic CV template field values for a consultant.

   Initial supported mapping:
   @Cat_ConsultantCity -> Address.CityLocaleKeyId -> LocaleDict.TextValue
   @Cat_ConsultantCountry -> Address.CountryLocaleKeyId -> LocaleDict.TextValue

   Input:
     @TenantId,
     @ConsultantId,
     @SelectedKeyCategoryIds (Expand Inline list),
     @Cat_ConsultantCity,
     @Cat_ConsultantCountry,
     @SystemLanguage

   Output:
     KeyCategoryId,
     Value
*/

WITH consultant_base AS (
  SELECT
    consultant.[Id] AS ConsultantId,
    consultant.[IsInternal] AS IsInternal,
    consultant.[ConsultancyUserId] AS ConsultancyUserId,
    consultant.[ExternalUserId] AS ExternalUserId
  FROM {Consultant} consultant
  WHERE consultant.[Id] = @ConsultantId
    AND consultant.[TenantId] = @TenantId
),
selected_supported_key_category AS (
  SELECT @Cat_ConsultantCity AS KeyCategoryId
  FROM consultant_base
  WHERE @Cat_ConsultantCity IN (@SelectedKeyCategoryIds)
  UNION ALL
  SELECT @Cat_ConsultantCountry AS KeyCategoryId
  FROM consultant_base
  WHERE @Cat_ConsultantCountry IN (@SelectedKeyCategoryIds)
),
consultant_context AS (
  SELECT
    consultant_base.ConsultantId,
    CASE
      WHEN consultant_base.IsInternal = 1 THEN consultancy_user.[AddressId]
      ELSE external_user.[AddressId]
    END AS AddressId
  FROM consultant_base
  LEFT JOIN {ConsultancyUser} consultancy_user
    ON consultant_base.IsInternal = 1
   AND consultancy_user.[Id] = consultant_base.ConsultancyUserId
  LEFT JOIN {ExternalUser} external_user
    ON consultant_base.IsInternal <> 1
   AND external_user.[Id] = consultant_base.ExternalUserId
)
SELECT
  selected_supported_key_category.KeyCategoryId AS KeyCategoryId,
  CASE
    WHEN selected_supported_key_category.KeyCategoryId = @Cat_ConsultantCity
      THEN city_locale.[TextValue]
    WHEN selected_supported_key_category.KeyCategoryId = @Cat_ConsultantCountry
      THEN country_locale.[TextValue]
    ELSE NULL
  END AS Value
FROM selected_supported_key_category
JOIN consultant_context
  ON 1 = 1
LEFT JOIN {Address} address
  ON address.[Id] = consultant_context.AddressId
LEFT JOIN {LocaleDict} city_locale
  ON city_locale.[LocaleKeyId] = address.[CityLocaleKeyId]
 AND city_locale.[LanguageId] = @SystemLanguage
LEFT JOIN {LocaleDict} country_locale
  ON country_locale.[LocaleKeyId] = address.[CountryLocaleKeyId]
 AND country_locale.[LanguageId] = @SystemLanguage
ORDER BY
  selected_supported_key_category.KeyCategoryId
