# Entity Reference

This directory contains documentation for all database entities used in Matchical.

## Entity Categories

### Consultant Domain
- **[consultant.md](consultant.md)** - Consultant, ConsultancyUser, ExternalUser

### Demand Domain
- **[demand.md](demand.md)** - Demand, DemandRequirement, DemandConsultants

### Experience & Scoring
- **[experience.md](experience.md)** - Experience entity and scoring categories

### Location
- **[location.md](location.md)** - LocationTag, LocationTagsClosure, ConsultantLocations

### Reference Data
- **[reference.md](reference.md)** - Status, Category, LanguageLevel, CustomRole, RoleName, LocaleDict

## Common Patterns

### Multi-Tenancy
All entities use `TenantId` for tenant isolation. Always filter by `TenantId` in queries.

### LocaleDict Pattern
Translatable text uses LocaleKey → LocaleDict:
```sql
LEFT JOIN {LocaleDict} locale
  ON locale.[LocaleKeyId] = {Entity}.[NameLocaleKeyId]
  AND locale.[LanguageId] = @SystemLanguage
```

### Boolean Fields
Booleans are stored as `0/1` integers. Use `= 1` and `<> 1` comparisons.
