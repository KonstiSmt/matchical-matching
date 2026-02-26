# CV Export Query Notes

## Scope (Current)
- Query: `GetConsultantCvTemplateFieldValues`
- Purpose: return dynamic CV export field values from a provided address by requested key categories.
- Initial supported mappings: consultant city and consultant country.

## Input Contract (Current)
- `@AddressId`
- `@SelectedKeyCategoryIds` (Expand Inline list)
- `@Cat_ConsultantCity` (static category parameter for consultant city)
- `@Cat_ConsultantCountry` (static category parameter for consultant country)
- `@SystemLanguage`

## Output Contract (Current)
- `KeyCategoryId`
- `Value` (text)

## Behavior Rules Agreed
- Query resolves values from `Address` using provided `@AddressId`.
- Query does not perform consultant lookup.
- Caller must pass an `@AddressId` that is already validated for tenant + consultant ownership.
- If `@AddressId` is `NULL` or empty string, category rows are still returned and address-dependent `Value` results are empty string (`''`).
- Unmapped categories are skipped.
- Caller guarantees selected key categories are unique (no distinct handling required).

## Consultant City Mapping (Current)
- Address source:
  - `@AddressId -> Address`
- City value source:
  - `Address.CityLocaleKeyId -> LocaleDict (LanguageId = @SystemLanguage) -> TextValue`
- Returned value:
  - `Value = LocaleDict.TextValue`

## Consultant Country Mapping (Current)
- Uses the same address source as city:
  - `@AddressId -> Address`
- Country value source:
  - `Address.CountryLocaleKeyId -> LocaleDict (LanguageId = @SystemLanguage) -> TextValue`
- Returned value:
  - `Value = LocaleDict.TextValue`

## Null And Safety Expectations
- If `AddressId` is `NULL`, query must not fail.
- If `AddressId` is `NULL` or empty string, city/country value resolution is skipped and `Value` falls back to empty string (`''`).
- If address join is missing, `Value` is empty string (`''`).
- If locale row for `@SystemLanguage` is missing, `Value` is empty string (`''`).

## Planned Extension Direction
- More key category mappings will be added later.
- Pattern: each supported key category maps to specific retrieval logic and outputs `KeyCategoryId`, `Value`.
