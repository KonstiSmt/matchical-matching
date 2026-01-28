# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Purpose

This repository is for iterating on the consultant-to-demand matching queries running on **OutSystems ODC** with **Aurora PostgreSQL**.

## Repository Structure

- `queries/GetMatchesByDemandId.sql` — Query 1: Scoring query (returns ConsultantId, MatchingScore, PricePerformanceScore, MatchedRequirementsCount, Count)
- `queries/GetConsultantMatchDetails.sql` — Query 2: Hydration query (returns display data for matched consultants)
- `docs/query-reference.md` — Full documentation (matching concepts, CTE walkthrough, performance notes)
- `docs/query1-output-example.json` — Example output for Query 1
- `docs/query2-output-example.json` — Example output for Query 2

## Two-Query Architecture

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
│     • Top 3 matches + total count                            │
│   → Returns: 12-20 rows (one per consultant)                 │
└─────────────────────────────────────────────────────────────┘
```

## OutSystems ODC Advanced SQL Rules

**Entity/attribute syntax:**
```sql
{EntityName}.[AttributeName]
-- Example: {Consultant}.[Id], {DemandRequirement}.[FilterCategoryId]
```

**Parameters:** `@ParamName`

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
Id, MatchingScore, PricePerformanceScore, MatchedRequirementsCount, Count
```

**Query 2 (GetConsultantMatchDetails):**
```
ConsultantId, MatchingScore, PricePerformanceScore, FirstName, LastName, PhotoUrl, RoleTitle, EuroFixedRate, TotalMatchingRequirements, TopMatchesJson, TopMatches
```

Column order is contractual with the OutSystems output structure.

**JSON Column Naming Convention:** Columns containing JSON data should be suffixed with `Json` (e.g., `TopMatchesJson`). Documentation should show the expanded structure for clarity.

## OutSystems Nested JSON Output Rule

When a query output contains nested structures (lists/arrays of objects), return **both**:
- `FieldNameJson` (Text) - The actual JSON string with data
- `FieldName` (List) - An empty array `'[]'::json` as structure placeholder

**Why:** OutSystems requires the output structure to match exactly. The empty placeholder allows OutSystems to define the nested structure, while the JSON column provides the data.

**Example:**
```sql
/* Actual data */
(SELECT COALESCE(json_agg(...), '[]'::json) ...) AS TopMatchesJson,

/* Empty placeholder for structure definition */
'[]'::json AS TopMatches
```

**Recursive:** If nested items have their own nested arrays, apply the same pattern at each level.

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
- Internal vs external identity field resolution (Query 2)
- Requirement names resolve correctly for all 5 categories (Query 2)
- TopMatches JSON contains top 3 ranked by partial_score (Query 2)

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
| `CategoryId` | Category: RoleSkill, Role, Industry, FunctionalArea, Language |
| `RoleId`, `SkillId` | Keys for RoleSkill/Role categories |
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
| `CategoryId` | Category: RoleSkill, Role, Industry, FunctionalArea, Language |
| `RoleId`, `SkillId` | Keys for RoleSkill/Role categories (Experience matching) |
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

### Filter Categories

| Parameter | Meaning |
|-----------|---------|
| `@Filter_Default` | No filtering, scoring only |
| `@Filter_Soft` | Soft filter: Score > 0 required |
| `@Filter_Hard` | Hard filter: Score >= ReqScore required |

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
| SkillAlias | SkillAlias.NameLocaleKeyId → LocaleDict |
| Industry | Industry.NameLocaleKeyId → LocaleDict |
| FunctionalArea | FunctionalArea.NameLocaleKeyId → LocaleDict |
| Language | Language.NameLocaleKeyId → LocaleDict |

**Requirement Name Resolution (Query 2):**

| Category | DemandRequirement Field | Join Path |
|----------|------------------------|-----------|
| RoleSkill | `SkillAliasId` | → SkillAlias → LocaleDict |
| Role | `RoleAliasId` | → RoleAlias → LocaleDict |
| Industry | `IndustryId` | → Industry → LocaleDict |
| FunctionalArea | `FunctionalAreaId` | → FunctionalArea → LocaleDict |
| Language | `LanguageId` | → Language → LocaleDict |
