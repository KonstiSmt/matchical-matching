# CV Export Query Notes

## Scope (Current)
- Query: `GetConsultantCvTemplateFieldValues`
- Purpose: return dynamic CV export field values for a consultant by requested key categories.
- Initial supported mappings: consultant city and consultant country.

## Input Contract (Current)
- `@TenantId`
- `@ConsultantId`
- `@SelectedKeyCategoryIds` (Expand Inline list)
- `@Cat_ConsultantCity` (static category parameter for consultant city)
- `@Cat_ConsultantCountry` (static category parameter for consultant country)
- `@SystemLanguage`

## Output Contract (Current)
- `KeyCategoryId`
- `Value` (text)

## Behavior Rules Agreed
- Root entity in this query is `Consultant`.
- Tenant is checked on root entity only (`Consultant.TenantId = @TenantId`).
- Do not apply additional tenant checks on child joins unless explicitly required.
- Unmapped categories are skipped.
- Caller guarantees selected key categories are unique (no distinct handling required).

## Consultant City Mapping (Current)
- If consultant is internal (`IsInternal = 1`):
  - `Consultant -> ConsultancyUser -> AddressId -> Address`
- If consultant is external (`IsInternal <> 1`):
  - `Consultant -> ExternalUser -> AddressId -> Address`
- City value source:
  - `Address.CityLocaleKeyId -> LocaleDict (LanguageId = @SystemLanguage) -> TextValue`
- Returned value:
  - `Value = LocaleDict.TextValue`

## Consultant Country Mapping (Current)
- Uses the same address resolution path as city:
  - Internal: `Consultant -> ConsultancyUser -> AddressId -> Address`
  - External: `Consultant -> ExternalUser -> AddressId -> Address`
- Country value source:
  - `Address.CountryLocaleKeyId -> LocaleDict (LanguageId = @SystemLanguage) -> TextValue`
- Returned value:
  - `Value = LocaleDict.TextValue`

## Null And Safety Expectations
- If `AddressId` is `NULL`, query must not fail.
- If address join is missing, `Value` is `NULL`.
- If locale row for `@SystemLanguage` is missing, `Value` is `NULL`.

## Planned Extension Direction
- More key category mappings will be added later.
- Pattern: each supported key category maps to specific retrieval logic and outputs `KeyCategoryId`, `Value`.
