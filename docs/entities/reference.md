# Reference Entities

## Status
Consultant status reference.

| Attribute | Type | Description |
|-----------|------|-------------|
| `Id` | GUID | Primary key |
| `IsReady` | Boolean | Consultant is ready for matching |
| `IsActive` | Boolean | Status is active |
| `Label` | Text | English label |
| `LabelTranslationsJSON` | JSON | Translations: `{"en":"Active","de":"Aktiv"}` |

### Usage
- Matching eligibility: `StatusId` on Consultant where `IsReady=1` AND `IsActive=1`
- Employment status display: `EmploymentStatusId` on ConsultancyUser

---

## Category
Generic category entity used for classifying entities.

| Attribute | Type | Description |
|-----------|------|-------------|
| `Id` | GUID | Primary key |
| `Label` | Text | English label |
| `LabelTranslationsJSON` | JSON | Translations |
| `Order` | Integer | Sort order |
| `Color` | Text | Display color (hex code) |
| `ParentCategoryId` | GUID | FK to parent Category |
| `IconCode` | Text | Icon identifier |

### Common Uses
- Experience categories (RoleSkill, Role, Industry, etc.)
- Filter categories (Default, Soft, Hard)
- Availability categories (Yes, No, Unknown)
- Location types (City, Region, Country)

---

## LanguageLevel
Static entity for language proficiency levels.

| Attribute | Type | Description |
|-----------|------|-------------|
| `Id` | GUID | Primary key |
| `Label` | Text | English label |
| `LabelTranslationsJSON` | JSON | Translations: `{"en":"Native","de":"Muttersprache"}` |
| `Order` | Integer | Sort order (1-6) |

### Level Mapping
| Order | Level |
|-------|-------|
| 1 | Beginner |
| 2 | Elementary |
| 3 | Intermediate |
| 4 | Advanced |
| 5 | Proficient |
| 6 | Native |

---

## CustomRole
Custom role definition mapped to a canonical role name. Used when `@UseCustomRoles = 1`.

| Attribute | Type | Description |
|-----------|------|-------------|
| `Id` | GUID | Primary key |
| `RoleNameId` | GUID | FK to RoleName (for localized name) |
| `ExternalId` | Text | External system identifier |
| `TenantId` | GUID | Tenant isolation |

### Join Path for Name
```
CustomRole → RoleName → LocaleDict (via RoleName.NameLocaleKeyId)
```

---

## RoleName
Canonical role names with localization support.

| Attribute | Type | Description |
|-----------|------|-------------|
| `Id` | GUID | Primary key |
| `NameLocaleKeyId` | GUID | FK to LocaleKey for localized name |

### Usage
Used for custom role display names via CustomRole.RoleNameId.

---

## LocaleDict Joining Pattern

All translatable text is stored via LocaleKey → LocaleDict.

### Standard Join
```sql
LEFT JOIN {LocaleDict} name_locale
  ON name_locale.[LocaleKeyId] = {Entity}.[NameLocaleKeyId]
  AND name_locale.[LanguageId] = @SystemLanguage
```

### Entities with LocaleDict

| Entity | Join Path |
|--------|-----------|
| Role | Role.NameLocaleKeyId → LocaleDict |
| RoleAlias | RoleAlias.NameLocaleKeyId → LocaleDict |
| RoleName | RoleName.NameLocaleKeyId → LocaleDict (for custom roles) |
| SkillAlias | SkillAlias.NameLocaleKeyId → LocaleDict |
| Industry | Industry.NameLocaleKeyId → LocaleDict |
| FunctionalArea | FunctionalArea.NameLocaleKeyId → LocaleDict |
| Language | Language.NameLocaleKeyId → LocaleDict |
| LocationTag | LocationTag.NameLocaleKeyId → LocaleDict |

---

## Filter Categories

| Parameter | Meaning |
|-----------|---------|
| `@Filter_Default` | No filtering, scoring only |
| `@Filter_Soft` | Soft filter: Score > 0 required |
| `@Filter_Hard` | Hard filter: Score >= ReqScore required |

---

## Custom Roles Parameters

When `@UseCustomRoles = 1`, queries switch from standard Role/RoleSkill matching to CustomRole/CustomRoleSkill matching.

| Parameter | Meaning |
|-----------|---------|
| `@UseCustomRoles` | Boolean (0/1): Switch between standard (0) and custom (1) roles |
| `@Cat_CustomRole` | Category ID for CustomRole experience |
| `@Cat_CustomRoleSkill` | Category ID for CustomRoleSkill experience |

Output structure remains unchanged - RoleAliasId/RoleAliasName fields are populated with CustomRoleId/CustomRoleName values.

---

## Requirement Name Resolution

| Category | DemandRequirement Field | Join Path |
|----------|------------------------|-----------|
| RoleSkill | `SkillAliasId` | → SkillAlias → LocaleDict |
| Role | `RoleAliasId` | → RoleAlias → LocaleDict |
| CustomRoleSkill | `SkillAliasId` | → SkillAlias → LocaleDict |
| CustomRole | `CustomRoleId` | → CustomRole → RoleName → LocaleDict |
| Industry | `IndustryId` | → Industry → LocaleDict |
| FunctionalArea | `FunctionalAreaId` | → FunctionalArea → LocaleDict |
| Language | `LanguageId` | → Language → LocaleDict |
