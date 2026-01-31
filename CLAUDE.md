# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Purpose

This repository is for iterating on the consultant-to-demand matching queries running on **OutSystems ODC** with **Aurora PostgreSQL**.

## Repository Structure

- `queries/GetMatchesByDemandId.sql` — Query 1: Scoring query (returns ConsultantId, MatchingScore, PricePerformanceScore, MatchedRequirementsCount, Count)
- `queries/GetConsultantMatchDetails.sql` — Query 2: Hydration query (returns display data for matched consultants)
- `queries/GetMatchingScoreByConsultantIds.sql` — Query 3: Lightweight scoring query (returns ConsultantId, MatchingScore for specific consultants)
- `queries/GetConsultantFullDetails.sql` — Query 4: Full details query (returns complete matching breakdown for single consultant)
- `docs/query-reference.md` — Full documentation (matching concepts, CTE walkthrough, performance notes)
- `docs/query1-output-example.json` — Example output for Query 1
- `docs/query2-output-example.json` — Example output for Query 2
- `docs/query3-output-example.json` — Example output for Query 3
- `docs/query4-output-example.json` — Example output for Query 4

## Query Architecture

```
Single Backend Call:
┌──────────────────────────────────────────────────────────────────────────────┐
│ Query 1: GetMatchesByDemandId (Scoring)                                       │
│   → ConsultantId, MatchingScore, PricePerformanceScore, MatchedRequirementsCount, Count│
│   → Pure scoring + per-consultant fulfilled count, no display data            │
│   → Returns: 12-20 rows                                                       │
└──────────────────────────────────────────────────────────────────────────────┘
                            ↓
                   (Pass ConsultantIds)
                            ↓
┌─────────────────────────────────────────────────────────────┐
│ Query 2: GetConsultantMatchDetails (Hydration)               │
│   → Input: ConsultantIds (comma-separated), DemandId         │
│   → Output: Nested JSON per consultant                       │
│     • Consultant info (name, photo, role, rate)              │
│     • Top 2 matches + total count                            │
│   → Returns: 12-20 rows (one per consultant)                 │
└─────────────────────────────────────────────────────────────┘

Score Recalculation (On-Demand):
┌─────────────────────────────────────────────────────────────────────────────┐
│ Query 3: GetMatchingScoreByConsultantIds (Lightweight Scoring)               │
│   → Input: ConsultantIds (comma-separated), DemandId, TenantId               │
│   → Output: ConsultantId, MatchingScore                                      │
│   → No filters, no sorting, no pagination                                    │
│   → Used when requirements or experiences change                             │
└─────────────────────────────────────────────────────────────────────────────┘

Sidebar Details (Single Consultant):
┌─────────────────────────────────────────────────────────────────────────────┐
│ Query 4: GetConsultantFullDetails (Full Breakdown)                           │
│   → Input: ConsultantId (single), DemandId, TenantId                         │
│   → Output: All requirements with scores, grouped by category                │
│     • RoleSkills (nested: Roles with Skills)                                 │
│     • Industries, FunctionalAreas, Languages (flat arrays)                   │
│     • Language level labels for display                                      │
│   → Returns: 1 row with nested JSON arrays                                   │
└─────────────────────────────────────────────────────────────────────────────┘
```

## OutSystems ODC Advanced SQL Rules

**Entity/attribute syntax:**
```sql
{EntityName}.[AttributeName]
-- Example: {Consultant}.[Id], {DemandRequirement}.[FilterCategoryId]
```

**Parameters:** `@ParamName`

**List parameters (Expand Inline):** When a parameter contains multiple IDs (e.g., `@ConsultantIds`), it uses "Expand Inline" in OutSystems. The parameter value is expanded directly into the SQL as literal text. Use it directly in an IN clause:
```sql
WHERE consultant.[Id] IN (@ConsultantIds)
```
Do NOT try to parse it as a string with `STRING_TO_ARRAY` or `UNNEST`. It's not a string—it's already expanded SQL.

**CRITICAL: No trailing semicolon.** ODC Advanced SQL can fail with a trailing `;`. End with the last SQL token (e.g., `OFFSET @StartIndex`).

**Booleans:** Treated as `0/1` integers. Use `= 1` and `<> 1` comparisons.

**Null dates:** Use `@Nulldate` sentinel (typically `1900-01-01`), not SQL `NULL`.

**CRITICAL: No dashes in comments.** Dashes (`-`) in SQL comments can cause query failures in ODC. Use underscores for comment separators instead:
```sql
/* _____________ Good _____________ */
/* ------------- Bad ------------- */
```

## Query Architecture (CTE Pipeline)

```
d (demand context) → req (requirements) → ec (eligible consultants prefilter)
    ↓
b_roleskill, b_role, b_industry, b_functional, b_language (scoring branches)
    ↓
partials (union) → scores (aggregate) → kept (filter enforcement)
    ↓
price_performance (window function for ratio calculation) → final SELECT
```

## Output Column Contracts (DO NOT REORDER)

**Query 1 (GetMatchesByDemandId):**
```
ConsultantId, MatchingScore, PricePerformanceScore, MatchedRequirementsCount, Count, HasActiveFilters
```

**Query 2 (GetConsultantMatchDetails):**
```
ConsultantId, IsPinned, MatchingScore, PricePerformanceScore, FirstName, LastName, PhotoUrl, TopRoleName, EuroFixedRate, TotalMatchingRequirements, TopMatchesJson, TopMatches
```

**Query 3 (GetMatchingScoreByConsultantIds):**
```
ConsultantId, MatchingScore
```

**Query 4 (GetConsultantFullDetails):**
```
ConsultantId, IsPinned, MatchingScore, PricePerformanceScore, FirstName, LastName, PhotoUrl, TopRoleName, EuroFixedRate, ClientOffsiteRate, ContingentDays, RequiredLocationName, RequiredLocationColor, MatchingConsultantLocationName, MatchingConsultantLocationColor, RoleSkillsJson, IndustriesJson, FunctionalAreasJson, LanguagesJson, RoleSkills, Industries, FunctionalAreas, Languages
```

Column order is contractual with the OutSystems output structure.

**Output Column Naming Rule:** Never use plain `Id` as an output column name. Always use descriptive names like `ConsultantId`, `DemandId`, `RequirementId`, etc.

**JSON Column Naming Convention:** Columns containing JSON data should be suffixed with `Json` (e.g., `TopMatchesJson`). Documentation should show the expanded structure for clarity.

## OutSystems Nested JSON Output Rule

When a query output contains nested structures (lists/arrays of objects), return **both**:
- `FieldNameJson` (Text) - The actual JSON string with data
- `FieldName` (List) - `NULL` as structure placeholder

**Why:** OutSystems requires the output structure to match exactly. The NULL placeholder allows OutSystems to define the nested structure, while the JSON column provides the data.

**Example:**
```sql
/* Actual data */
(SELECT COALESCE(json_agg(...), '[]'::json) ...) AS TopMatchesJson,

/* NULL placeholder for structure definition */
NULL AS TopMatches
```

**No Sub-Nesting Rule:** The dual-key pattern (`FieldJson` + `FieldName: null`) only applies at the **SQL output column level**. Within JSON structures (e.g., inside RoleSkillsJson), nested arrays are direct arrays without separate Json/null pairs:

```json
{
  "RoleAliasName": "Scrum Master",
  "Skills": [...]     /* Direct array, NOT "SkillsJson" + "Skills" */
}
```

**NULL Placeholder Column Positioning:** All NULL placeholder columns (e.g., `RoleSkills`, `Industries`, `FunctionalAreas`, `Languages`) must be positioned at the **end** of the output column list, after all JSON columns.

**COALESCE with NULL (not empty array):** When using COALESCE for JSON aggregation, always use `NULL` as the fallback, never `'[]'::json`:
```sql
/* Correct */
SELECT COALESCE(json_agg(...), NULL) AS FieldJson

/* Wrong */
SELECT COALESCE(json_agg(...), '[]'::json) AS FieldJson
```

**JSON Array Ordering Rule:** All JSON arrays in Query 4 are ordered by:
1. `DynamicWeight DESC` (highest weight first)
2. `Name ASC` (alphabetical when weights are equal)

## Safe Modification Zones

| Change Type | Modify Here |
|-------------|-------------|
| Eligibility filters | `ec` CTE |
| Scoring logic | `b_*` category branches |
| Price-performance calculation | `price_performance` CTE |
| Output fields | Final SELECT |
| Count behavior | Final SELECT's Count expression |
| Requirement selection | `req` CTE |

## Editing Rules

1. Provide **full-length query** for copy/paste (no partial snippets)
2. Changes must be **surgical**—modify only what's required, keep everything else verbatim
3. Never change column order without explicit request
4. Never add trailing semicolon
5. **When query output changes, always update the corresponding output example file** (`docs/query1-output-example.json` or `docs/query2-output-example.json`)

## Naming Conventions

**Always use descriptive names.** Never use single-character or cryptic abbreviations for aliases.

| Bad | Good |
|-----|------|
| `r` | `requirement` |
| `e` | `experience` |
| `c` | `consultant` |
| `s` | `status` |
| `d` | `demand` |
| `k` | `kept_consultant` |
| `eu_ct` | `external_user_contract_type` |
| `cl_h` | `consultant_location_hard` |
| `lc_h` | `location_closure_hard` |

The goal is **human readability and maintainability**. Someone reading the query should understand what each alias refers to without cross-referencing.

## Regression Checklist

After any change, verify:
- Top 12 ordering matches expected behavior on test demands
- Location filter (Default/Soft/Hard) edge cases
- Availability filter edge cases
- "Not Available" status exclusion when availability filter is active
- Count accuracy
- PricePerformanceScore: best ratio consultant = 10, others scaled proportionally
- PricePerformanceScore edge case: EuroFixedRate = 0 results in score = 0
- Internal vs external identity field resolution (Query 2, Query 4)
- Requirement names resolve correctly for all 5 categories (Query 2, Query 4)
- TopMatches JSON contains top 2 ranked by partial_score (Query 2)
- ConsultantScore is raw Experience.Score (1-5, or 1-6 for languages)

**Custom Roles Regression (when @UseCustomRoles = 1):**
- Scoring uses CustomRoleId for matching (Query 1, Query 3)
- Filter enforcement uses CustomRoleId (Query 1)
- Name resolution uses CustomRole → RoleName path (Query 2, Query 4)
- TopMatchesJson excludes CustomRole category (Query 2)
- TopRoleName uses TopCustomRoleId → CustomRole → RoleName path (Query 2, Query 4)
- RoleSkillsJson groups by CustomRoleId (Query 4)
- RoleAliasId outputs CustomRoleId value (Query 4)
- Standard mode (@UseCustomRoles = 0) returns identical results to pre-custom-roles behavior

## Entity Reference

### Consultant
Primary entity representing a consultant (internal or external).

| Attribute | Description |
|-----------|-------------|
| `Id` | Primary key |
| `TenantId` | Tenant isolation |
| `IsInternal` | Boolean: internal (ConsultancyUser) vs external (ExternalUser) |
| `ConsultancyUserId` | FK to ConsultancyUser (when IsInternal=1) |
| `ExternalUserId` | FK to ExternalUser (when IsInternal=0) |
| `StatusId` | FK to Status |
| `TopRoleId` | FK to Role (consultant's primary role, for display) |
| `TopCustomRoleId` | FK to CustomRole (consultant's primary custom role, when custom roles active) |
| `EuroFixedRate` | Rate for price-performance calculation |
| `NextAvailabiltyDate` | Next availability date (NullDate sentinel if not set) |
| `IsImmediatelyAvailable` | Boolean: immediately available |
| `NoticePeriod` | Notice period in days |
| `MinCapacity`, `MaxCapacity` | Capacity range |

### Experience
Pre-calculated skill/experience scores per consultant per category.

| Attribute | Description |
|-----------|-------------|
| `Id` | Primary key |
| `ConsultantId` | FK to Consultant |
| `TenantId` | Tenant isolation |
| `CategoryId` | Category: RoleSkill, Role, CustomRoleSkill, CustomRole, Industry, FunctionalArea, Language |
| `RoleId`, `SkillId` | Keys for RoleSkill/Role categories |
| `CustomRoleId` | Key for CustomRoleSkill/CustomRole categories |
| `IndustryId` | Key for Industry category |
| `FunctionalAreaId` | Key for FunctionalArea category |
| `LanguageId` | Key for Language category |
| `Score` | Pre-calculated experience score (typically 1-5) |

### Demand
A staffing request to be matched against consultants.

| Attribute | Description |
|-----------|-------------|
| `Id` | Primary key |
| `TenantId` | Tenant isolation |
| `LocationTagId` | Desired location |
| `LocationFilterCategoryId` | Location filter: Default/Soft/Hard |
| `AvailabilityFilterCategoryId` | Availability filter: Default/Soft/Hard |
| `IsCapacityFilterActive` | Boolean: capacity filtering enabled |
| `Capacity` | Required capacity |
| `StartDate` | Demand start date |
| `ClientOffsiteRate` | Rate for price-performance threshold |

### DemandRequirement
Individual requirement line for a demand (skills, roles, industries, etc.).

| Attribute | Description |
|-----------|-------------|
| `Id` | Primary key |
| `DemandId` | FK to Demand |
| `TenantId` | Tenant isolation |
| `CategoryId` | Category: RoleSkill, Role, CustomRoleSkill, CustomRole, Industry, FunctionalArea, Language |
| `RoleId`, `SkillId` | Keys for RoleSkill/Role categories (Experience matching) |
| `CustomRoleId` | Key for CustomRoleSkill/CustomRole categories (Experience matching) |
| `SkillAliasId` | FK to SkillAlias (for RoleSkill category display name) |
| `RoleAliasId` | FK to RoleAlias (for Role category display name) |
| `IndustryId` | Key for Industry category |
| `FunctionalAreaId` | Key for FunctionalArea category |
| `LanguageId` | Key for Language category |
| `Score` | Required score (1-5) |
| `DynamicWeight` | Weight for scoring |
| `RoleWeight` | Additional weight multiplier (RoleSkill only) |
| `FilterCategoryId` | Filter type: Default (scoring only), Soft, Hard |
| `IsActive` | Boolean: requirement is active |
| `HasMissingKeys` | Boolean: requirement has invalid/missing keys |
| `IsNiceToHave` | Boolean: true if nice-to-have, false if must-have |

### DemandConsultants
Junction table linking consultants assigned to demands.

| Attribute | Description |
|-----------|-------------|
| `Id` | Primary key |
| `DemandId` | FK to Demand |
| `ConsultantId` | FK to Consultant |
| `TenantId` | Tenant isolation |
| `CreatedAt` | Timestamp when assigned |
| `UpdatedAt` | Timestamp of last update |
| `MatchingScore` | Score at time of assignment |
| `CustomRolesMatchingScore` | Custom roles score |
| `Rate` | Rate for this assignment |
| `CandidateStageId` | FK to CandidateStage |
| `StatusId` | FK to Status |

### ConsultancyUser (Internal User Identity)
Identity fields for internal consultants.

| Attribute | Description |
|-----------|-------------|
| `Id` | Primary key |
| `Email` | Email address |
| `FirstName`, `LastName` | Name |
| `DefaultPhotoUrl`, `DefaultPhotoUrlRound` | Photo URLs |

### ExternalUser (External User Identity)
Identity fields for external consultants.

| Attribute | Description |
|-----------|-------------|
| `Id` | Primary key |
| `Email` | Email address |
| `FirstName`, `LastName` | Name |
| `DefaultPhotoUrl`, `DefaultPhotoUrlRound` | Photo URLs |

### Status
Consultant status reference.

| Attribute | Description |
|-----------|-------------|
| `Id` | Primary key |
| `IsReady` | Boolean: consultant is ready for matching |
| `IsActive` | Boolean: status is active |

### LocationTag
Location hierarchy node (city, region, country, etc.).

| Attribute | Description |
|-----------|-------------|
| `Id` | Primary key |
| `NameLocaleKeyId` | FK to LocaleDict for localized name |
| `CategoryId` | FK to Category (location type: city, region, country, etc.) |

### Category
Generic category entity used for classifying entities (e.g., location types).

| Attribute | Description |
|-----------|-------------|
| `Id` | Primary key |
| `Label` | English label |
| `LabelTranslationsJSON` | JSON with translations |
| `Order` | Sort order |
| `Color` | Display color (hex code) |
| `ParentCategoryId` | FK to parent Category |
| `IconCode` | Icon identifier |

### LocationTagsClosure
Closure table for location hierarchy (ancestor/descendant relationships).

| Attribute | Description |
|-----------|-------------|
| `AncestorId` | FK to LocationTag (parent in hierarchy) |
| `DescendantId` | FK to LocationTag (child in hierarchy) |

### ConsultantLocations
Junction table linking consultants to their available locations.

| Attribute | Description |
|-----------|-------------|
| `ConsultantId` | FK to Consultant |
| `LocationTagId` | FK to LocationTag |

### LanguageLevel
Static entity for language proficiency levels (Beginner through Native).

| Attribute | Description |
|-----------|-------------|
| `Id` | Primary key |
| `Label` | English label |
| `LabelTranslationsJSON` | JSON with translations: `{"en":"Native","de":"Muttersprache"}` |
| `Order` | Sort order (1-6: Beginner, Elementary, Intermediate, Advanced, Proficient, Native) |

### CustomRole
Custom role definition mapped to a canonical role name. Used when `@UseCustomRoles = 1`.

| Attribute | Description |
|-----------|-------------|
| `Id` | Primary key |
| `RoleNameId` | FK to RoleName (for localized name) |
| `ExternalId` | External system identifier |
| `TenantId` | Tenant isolation |

### RoleName
Canonical role names with localization support. Used for custom role display names.

| Attribute | Description |
|-----------|-------------|
| `Id` | Primary key |
| `NameLocaleKeyId` | FK to LocaleKey for localized name |

### Filter Categories

| Parameter | Meaning |
|-----------|---------|
| `@Filter_Default` | No filtering, scoring only |
| `@Filter_Soft` | Soft filter: Score > 0 required |
| `@Filter_Hard` | Hard filter: Score >= ReqScore required |

### Custom Roles Parameters

When `@UseCustomRoles = 1`, queries switch from standard Role/RoleSkill matching to CustomRole/CustomRoleSkill matching. Output structure remains unchanged - RoleAliasId/RoleAliasName fields are populated with CustomRoleId/CustomRoleName values.

| Parameter | Meaning |
|-----------|---------|
| `@UseCustomRoles` | Boolean (0/1): Switch between standard roles (0) and custom roles (1) |
| `@Cat_CustomRole` | Category ID for CustomRole experience |
| `@Cat_CustomRoleSkill` | Category ID for CustomRoleSkill experience |

**Custom Role Join Path:**
```
CustomRole → RoleName → LocaleDict (via RoleName.NameLocaleKeyId)
```

## LocaleDict Joining Pattern

All translatable text is stored via LocaleKey → LocaleDict:
- Entity has `NameLocaleKeyId` (or similar) attribute
- Join directly to `{LocaleDict}` (skip `{LocaleKey}` table)
- Filter by `LanguageId` parameter

**Example:**
```sql
LEFT JOIN {LocaleDict} name_locale
  ON name_locale.[LocaleKeyId] = {Entity}.[NameLocaleKeyId]
  AND name_locale.[LanguageId] = @SystemLanguage
```

**Entities with LocaleDict (via NameLocaleKeyId):**

| Entity | Join Path |
|--------|-----------|
| Role | Role.NameLocaleKeyId → LocaleDict |
| RoleAlias | RoleAlias.NameLocaleKeyId → LocaleDict |
| RoleName | RoleName.NameLocaleKeyId → LocaleDict (for custom roles) |
| SkillAlias | SkillAlias.NameLocaleKeyId → LocaleDict |
| Industry | Industry.NameLocaleKeyId → LocaleDict |
| FunctionalArea | FunctionalArea.NameLocaleKeyId → LocaleDict |
| Language | Language.NameLocaleKeyId → LocaleDict |

**Requirement Name Resolution (Query 2, Query 4):**

| Category | DemandRequirement Field | Join Path |
|----------|------------------------|-----------|
| RoleSkill | `SkillAliasId` | → SkillAlias → LocaleDict |
| Role | `RoleAliasId` | → RoleAlias → LocaleDict |
| CustomRoleSkill | `SkillAliasId` | → SkillAlias → LocaleDict (same as RoleSkill) |
| CustomRole | `CustomRoleId` | → CustomRole → RoleName → LocaleDict |
| Industry | `IndustryId` | → Industry → LocaleDict |
| FunctionalArea | `FunctionalAreaId` | → FunctionalArea → LocaleDict |
| Language | `LanguageId` | → Language → LocaleDict |
