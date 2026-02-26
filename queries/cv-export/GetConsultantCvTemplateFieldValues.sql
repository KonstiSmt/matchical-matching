/* GetConsultantCvTemplateFieldValues : Advanced SQL (Aurora Postgres, ODC)
   Purpose: Return dynamic CV template field values from a provided address.

   Initial supported mapping:
   @Cat_ConsultantCity -> Address.CityLocaleKeyId -> LocaleDict.TextValue
   @Cat_ConsultantCountry -> Address.CountryLocaleKeyId -> LocaleDict.TextValue

   Input:
     @AddressId,
     @SelectedKeyCategoryIds (Expand Inline list),
     @Cat_ConsultantCity,
     @Cat_ConsultantCountry,
     @SystemLanguage

   Output:
     KeyCategoryId,
     Value
*/

WITH selected_supported_key_category AS (
  SELECT @Cat_ConsultantCity AS KeyCategoryId
  WHERE @Cat_ConsultantCity IN (@SelectedKeyCategoryIds)
  UNION ALL
  SELECT @Cat_ConsultantCountry AS KeyCategoryId
  WHERE @Cat_ConsultantCountry IN (@SelectedKeyCategoryIds)
),
address_context AS (
  SELECT
    address.[CityLocaleKeyId] AS CityLocaleKeyId,
    address.[CountryLocaleKeyId] AS CountryLocaleKeyId
  FROM {Address} address
  WHERE NULLIF(@AddressId, '') IS NOT NULL
    AND address.[Id] = @AddressId
)
SELECT
  selected_supported_key_category.KeyCategoryId AS KeyCategoryId,
  CASE
    WHEN selected_supported_key_category.KeyCategoryId = @Cat_ConsultantCity
      THEN COALESCE(city_locale.[TextValue], '')
    WHEN selected_supported_key_category.KeyCategoryId = @Cat_ConsultantCountry
      THEN COALESCE(country_locale.[TextValue], '')
    ELSE ''
  END AS Value
FROM selected_supported_key_category
LEFT JOIN address_context
  ON 1 = 1
LEFT JOIN {LocaleDict} city_locale
  ON city_locale.[LocaleKeyId] = address_context.CityLocaleKeyId
 AND city_locale.[LanguageId] = @SystemLanguage
LEFT JOIN {LocaleDict} country_locale
  ON country_locale.[LocaleKeyId] = address_context.CountryLocaleKeyId
 AND country_locale.[LanguageId] = @SystemLanguage
ORDER BY
  selected_supported_key_category.KeyCategoryId
