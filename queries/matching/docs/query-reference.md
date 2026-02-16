# GetMatchesByDemandId Query Reference

Complete documentation for the consultant matching query running on OutSystems ODC with Aurora PostgreSQL.

---

## 0) Working Rules and Preferences

* **Language:** Output and SQL comments should be **English**.
* **No unexplained abbreviations:** If you use an abbreviation, define it once first (example: "Common Table Expression (CTE)").
* **OutSystems ODC Advanced SQL:** **Do not** end the query with a **trailing semicolon** (`;`). In OutSystems ODC (Developer Cloud) Advanced SQL, a trailing semicolon can break execution (especially in the "test query" / execution context).
* **Editing style:** Always provide **full-length query** for copy/paste, and changes must be **surgical** ("modify only what's required; keep everything else verbatim").
* **Column output order matters:** The `SELECT` list order is treated as the contract with your OutSystems output structure. If you reorder columns, you can break the consumer logic.

---

## 1) OutSystems ODC Advanced SQL: Syntax + Practical Rules

### 1.1 Where Advanced SQL Sits in ODC

* You place a **SQL node** in a **Server Action**.
* You write SQL text that queries OutSystems entities via special syntax.

### 1.2 Entity and Attribute Syntax

OutSystems entities are referenced like:

* `{EntityName}.[AttributeName]`

Examples:

* `{Consultant}.[Id]`
* `{DemandRequirement}.[FilterCategoryId]`

Notes:

* The `{Entity}` wrapper is OutSystems' way to map to the physical table.
* The `.[Attribute]` bracket style is used for safety (reserved words, casing, etc.).

### 1.3 Parameters in Advanced SQL

* Parameters are referenced with `@ParamName`.
* You map them in the SQL node's **Parameters** pane.
* Default best practice: **do not** use "Expand Inline" unless you intentionally inject a full SQL fragment (and you control/validate it to avoid SQL injection risks).

### 1.4 Dialect: PostgreSQL vs ANSI-92

* In OutSystems ODC, **internal entities** run on **Aurora PostgreSQL** (PostgreSQL-compatible dialect).
* If you query **external entities / data fabric / external connections**, OutSystems may require an **ANSI-92** style.
  The current query is clearly oriented around internal entities and PostgreSQL behavior (casts like `::timestamptz`, `CURRENT_DATE`, etc.).

### 1.5 "No Semicolon at the End"

* Even though semicolons are standard in many SQL consoles, **ODC Advanced SQL can fail with a trailing semicolon**.
* Rule: end the query with the last token of SQL (for example `OFFSET @StartIndex`) and **no trailing `;`**.

### 1.6 Boolean Handling

Depending on how your OutSystems entities are mapped:

* Some "boolean" fields behave like `0/1` integers in SQL.
* The query uses comparisons like `= 1` and `<> 1`, which is consistent with that style.
* If a field is a real PostgreSQL boolean column, then comparisons should be `= TRUE` or just `WHERE column`, but **do not switch styles unless you know the underlying data type**.

### 1.7 Null Date and the "NullDate Sentinel"

* In OutSystems, a "null date" is often represented in application logic via a sentinel value (commonly `1900-01-01`) rather than database `NULL` in every scenario.
* The query uses `@Nulldate` as a sentinel and compares date fields against it.
* In database SQL, `NULL` semantics are `IS NULL` / `IS NOT NULL` (never `= NULL`).
* The query uses the sentinel in date comparisons for deterministic behavior.

---

## 2) What "Matching" Means in This System (Conceptual)

At a high level, the matching engine works like this:

### 2.1 Demand

A **Demand** is a "request" you want to staff. It includes:

* Tenant context
* Desired location (plus location filter category)
* Desired availability (plus availability filter category)
* Capacity constraints
* Pricing context (client offsite rate)

### 2.2 Demand Requirements

A **DemandRequirement** is one requirement line for a demand. It can represent one of several categories:

* Role-skill (role + skill)
* Role only
* Industry
* Functional area
* Language

Each requirement includes:

* Required score (for example 1–5)
* Dynamic weight (importance weight)
* Role weight (used for role-skill category)
* Filter category (Default / Soft / Hard) that decides whether this requirement is a "hard gate," a "soft gate," or just scoring.

### 2.3 Consultant "Experience" as the Matching Substrate

A **Consultant** has many **Experience** rows. Those experience rows are already **pre-calculated** scores per consultant per category (for example "Java score = 4", "Manufacturing score = 3", etc.).

Crucial point:

* The matching query does **not** compute skill hierarchy.
* Skill hierarchy has already been "baked into" the experience calculation step (historically via a closure table).
* Therefore, matching is "flat": it compares demand requirements directly to experience rows by matching keys (role id, skill id, industry id, etc.).

Role-skill scoring mode behavior:
* Strict Role (`@RoleSkillScoringModeId = @ScoringMode_StrictRole`): `effective_score = role_score`
* Global Skill (`@RoleSkillScoringModeId = @ScoringMode_GlobalSkill`): `effective_score = global_score`
* Role-First Hybrid (`@RoleSkillScoringModeId = @ScoringMode_RoleFirstHybrid`): `effective_score = max(role_score, max(global_score - 1, 0))`

Where:
* `role_score` comes from role-scoped categories (`@Cat_RoleSkill` / `@Cat_CustomRoleSkill`) with role key + `SkillId`
* `global_score` comes from skill-scoped categories (`@Cat_Skill` / `@Cat_CustomSkill`) with `SkillId` only

Global Skill refinements:
* Mandatory role soft gate is bypassed.
* Role/CustomRole requirement filters are ignored.
* Role/CustomRole scoring contribution is disabled.
* Role requirement weight is redistributed to same-role skills:
  * `RoleContribution_r = role_requirement.DynamicWeight * 100.0`
  * `SkillBase_k = skill_requirement.DynamicWeight * skill_requirement.RoleWeight`
  * `SkillBaseSum_r = SUM(SkillBase_k)`
  * `SkillWeightEffective_k = SkillBase_k + RoleContribution_r * (SkillBase_k / SkillBaseSum_r)`
* After redistribution, role-skill requirements are deduplicated by `SkillId`:
  * `ReqScore = MAX(ReqScore)` across duplicate skill requirements
  * `SkillWeightEffective = SUM(SkillWeightAfterDistribution)` across duplicate skill requirements
  * Must-have merge is "any must-have" (`IsNiceToHave = MIN(IsNiceToHave)`)
* Query 1 filtered role-skill merge uses filter precedence: Hard > Soft > Default.
* Query 4 keeps RoleSkillsJson shape, but in Global Skill mode returns one wrapper role object with role scoring fields as `NULL` and nested distinct skills.
  * Wrapper role identity comes from the highest role requirement dynamic weight (tie-break: lowest requirement id).

### 2.4 Scoring Model

For each demand requirement that matches an experience row, the query computes a partial contribution:

* If consultant score meets or exceeds required score, they get full weight.
* If it is below, they get proportional weight: `weight * (consultant_score / required_score)`.

Then:

* Partial scores are summed per consultant → `MatchingScore`.

### 2.5 Filter Enforcement (Early NOT EXISTS)

Soft/Hard filters are enforced **early** in the `eligible_consultant` CTE using a NOT EXISTS pattern:

* **Hard filter:** Consultant must have `Score >= ReqScore` for the requirement
* **Soft filter:** Consultant must have `Score > 0` for the requirement
* **Coverage check:** Consultant must have at least one matching experience row for every filtered requirement

For RoleSkill and CustomRoleSkill requirements, Hard/Soft checks use the selected mode's `effective_score`.

This approach eliminates consultants who fail filters **before** the expensive scoring phase, improving performance.

---

## 3) Query Structure (CTE by CTE)

The query is organized as a chain of **Common Table Expressions (CTEs)**. Treat each CTE as a named pipeline stage.

### 3.1 `demand` CTE: Demand Context (Single Row)

Extracts demand fields once:

* `LocationFilter`, `AvailabilityFilter`, capacity flags
* `CleanedStartDate` computed once:
  * If demand start date is sentinel, keep sentinel
  * If demand start date is earlier than today, clamp to today
  * Else use demand start date

This is a correctness + performance pattern: compute once, reuse.

**Security:** The CTE filters by both `@DemandId` AND `@TenantId` to ensure tenant isolation.

### 3.2 `requirement` CTE: Active, Valid Demand Requirements

Pulls all requirement lines for this demand:

* Active only
* No missing keys
* Includes category identifiers and all matching keys needed to join to experience

### 3.3 `role_requirement` CTE: Mandatory Role Gate Requirements

Extracts only role requirements used for the mandatory soft role gate:

* Same validity filters as `requirement` (active, no missing keys)
* In standard mode (`@UseCustomRoles <> 1`): includes only `@Cat_Role`
* In custom mode (`@UseCustomRoles = 1`): includes only `@Cat_CustomRole`
* Requirement extraction is independent of `@RoleSkillScoringModeId` (enforcement is bypassed in Global Skill mode)

### 3.4 `has_role_requirements` CTE: Role Gate Fast Path Flag

Computes a scalar boolean (`HasRoleRequirements`) once:

* `TRUE` if at least one role requirement exists in active role mode
* `FALSE` if none exist (mandatory role gate is skipped)

### 3.5 `filtered_requirement` and enforcement CTEs: Hard/Soft Filter Requirements

Extracts only requirements where `FilterCategoryId <> @Filter_Default`:

* Same validity filters as `requirement` CTE
* Used by the NOT EXISTS filter enforcement in `eligible_consultant`
* In Global Skill mode, role-skill filtered requirements are normalized before enforcement:
  * redistribute (already demand-side)
  * deduplicate by `SkillId`
  * merge `ReqScore` as max
  * merge filter category as Hard > Soft > Default

### 3.6 `eligible_consultant` CTE: Prefilter + Filter Enforcement

The main filtering stage. Returns only consultant identifiers that are eligible.

Includes:

* Tenant constraint
* Internal/external visibility logic
* "Not available" exclusion when availability filter is not default
* Location filtering driven by demand's location filter category (Default / Soft / Hard)
* Availability window logic using `CleanedStartDate`, next availability date, notice period
* Capacity constraints
* **Mandatory role soft-match gate (`Score > 0`)**
* **Filter requirement enforcement via NOT EXISTS**

Mandatory role soft-match gate:
* Consultant must match at least one required role (`@Cat_Role` / `@Cat_CustomRole`) with `Experience.Score > 0`
* Category path follows `@UseCustomRoles` mode
* Fast path: if `has_role_requirements.HasRoleRequirements = FALSE`, this gate is skipped
* Global Skill mode bypasses this gate

The filter enforcement uses a "double NOT EXISTS" pattern:
```
NOT EXISTS (filtered requirement WHERE NOT EXISTS (satisfying experience))
```

This means: "There must not exist any filtered requirement for which no satisfying experience exists."

**Fast path:** If no filtered requirements exist, the check is skipped entirely.

### 3.7 Category Branches: `branch_roleskill`, `branch_role`, `branch_industry`, `branch_functional`, `branch_language`

These branches:

* Join `requirement` to `{Experience}` for one category using the correct keys.
* Join to `eligible_consultant` to ensure only eligible consultants participate.
* Compute `partial_score` (using `DOUBLE PRECISION`)

Role-skill differs from the others:

* It multiplies by `RoleWeight`.
* Others multiply by `100.0`.
* Strict/Hybrid role-skill partial scoring uses `DynamicWeight * RoleWeight`.
* Global Skill mode uses redistributed-and-deduplicated role-skill weight (`SkillWeightEffective`) and disables role-only branch scoring.
* The consultant score source for role-skill partials depends on `@RoleSkillScoringModeId` effective-score mode.

Branches prune rows where `ReqScore = 0` or `Score <= 0` (except Language which allows presence-only).

### 3.8 `partials` CTE: Union of Category Branches

Uses `UNION ALL` (avoids distinct-sort overhead) to combine everything.

### 3.9 `scores` CTE: Aggregate Per Consultant

Per consultant:

* `SUM(partial_score)` → `MatchingScore`
* `COUNT(*) FILTER (WHERE CategoryId <> @Cat_Language)` → `MatchedRequirementsCount`

Simple aggregation since filter enforcement happened earlier in `eligible_consultant`.

Note: The count excludes Language requirements (business rule: language proficiency tracked separately).

### 3.10 `kept` CTE: Positive Score Filter

Removes consultants with zero or negative MatchingScore:

* `WHERE MatchingScore > 0`

### 3.11 `price_performance` CTE: Price-Performance Ratio Calculation

Computes the price-performance score using a window function:

* **Ratio** = `MatchingScore / EuroFixedRate` (higher = better value per euro)
* **Best Ratio** = `MAX(Ratio) OVER ()` across all kept consultants
* **PricePerformanceScore** = `(Ratio / BestRatio) * 10` (scaled 0-10)

Uses a window function to compute the best ratio in a single pass, avoiding extra subqueries.

Edge cases:
* `EuroFixedRate <= 0`: Ratio treated as 0
* `BestRatio = 0` (all consultants have zero rate): PricePerformanceScore = 0

### 3.12 Final SELECT: Scoring + Pagination

Final stage:

* Outputs `ConsultantId`, `MatchingScore`, `PricePerformanceScore`, `MatchedRequirementsCount`, `Count`, `HasActiveFilters`
* `MatchedRequirementsCount` is per-consultant (excludes Language)
* Produces `Count` via subquery on `kept` (total consultants)
* `HasActiveFilters` is true if any filter is active: requirement filters (Hard/Soft), availability filter (not Default), or location filter (not Default with location set)

Pagination:

* `ORDER BY MatchingScore DESC`
* `LIMIT @MaxRecords`
* `OFFSET @StartIndex`

---

## 4) Pagination and Count

### 4.1 Pagination Mechanics

* `LIMIT @MaxRecords` returns page size.
* `OFFSET @StartIndex` skips the first N rows in the sorted result.

**Key implication:** With an `ORDER BY MatchingScore`, the database generally must compute enough of the ordering to know which rows are "top" after the offset. That can still be expensive even if you only return 12 rows.

### 4.2 Count Mechanics

The current count uses `COUNT(*) OVER()` window function:

* Computed once across all rows in `price_performance`
* Returns total matching consultants (before pagination)
* Efficient in PostgreSQL as window functions compute in a single pass

**Performance reality:** The count is not typically the dominant cost; the expensive part is producing and sorting scored rows.

---

## 5) Performance Characteristics

### 5.1 Join Explosion in the Scoring Phase

The work scales roughly with:

* Number of eligible consultants (`eligible_consultant`)
  × number of requirements (`requirement`)
  × density of experience rows per consultant per category

As the skill graph becomes richer (multi-parent), if you pre-calculate more "indirect" experience rows, you increase experience density, which increases join and aggregate load.

### 5.2 Sorting by MatchingScore

Sorting large candidate sets is expensive. Even if you only return 12 rows, if the database can't cheaply restrict to "top K" early, it can still sort a huge intermediate set.

### 5.3 Early Filter Enforcement Benefits

The NOT EXISTS approach in `eligible_consultant`:

* **Short-circuits:** Stops checking as soon as one violation is found
* **Reduces row volume:** Consultants failing filters are excluded before scoring joins
* **Leverages indexes:** Can use `(ConsultantId, CategoryId, ...)` composite indexes efficiently

---

## 6) Indexing Recommendations

### 6.1 Experience Table (Critical)

All indexes use the **TenantId-first pattern** for multi-tenant optimization:

| Category | Index Columns |
|----------|---------------|
| Role | `(TenantId, ConsultantId, CategoryId, RoleId, Score)` |
| RoleSkill | `(TenantId, ConsultantId, CategoryId, RoleId, SkillId, Score)` |
| CustomRole | `(TenantId, ConsultantId, CategoryId, CustomRoleId, Score)` |
| CustomRoleSkill | `(TenantId, ConsultantId, CategoryId, CustomRoleId, SkillId, Score)` |
| Skill + CustomSkill | `(TenantId, ConsultantId, CategoryId, SkillId, Score)` |
| Industry | `(TenantId, ConsultantId, CategoryId, IndustryId, Score)` |
| FunctionalArea | `(TenantId, ConsultantId, CategoryId, FunctionalAreaId, Score)` |
| Language | `(TenantId, ConsultantId, CategoryId, LanguageId, Score)` |

**Why TenantId-first:**
* Multi-tenant isolation: TenantId partitions data logically
* With 30k+ consultants per tenant, TenantId narrows search space immediately
* All query WHERE clauses filter by TenantId early
* Supports both filter enforcement (NOT EXISTS) and branch CTE joins

### 6.2 Closure and Mapping Tables

* `{LocationTagsClosure}`: composite indexes on
  * `(AncestorId, DescendantId)`
  * `(DescendantId, AncestorId)`
* `{ConsultantLocations}`: composite index on
  * `(ConsultantId, LocationTagId)`

### 6.3 Other Tables

* `{DemandRequirement}`: `(DemandId, TenantId, IsActive)`
* `{Consultant}`: `(TenantId, StatusId)`

---

## 7) Safe Workflow for Modifying This Query

### 7.1 Never Change Unless Explicitly Requested

* Output column list and order:
  * `ConsultantId, MatchingScore, PricePerformanceScore, MatchedRequirementsCount, Count, HasActiveFilters`
* Sort order:
  * `ORDER BY MatchingScore DESC` (unless explicitly changing ranking)
* Pagination contract:
  * `LIMIT @MaxRecords`
  * `OFFSET @StartIndex`
* No trailing semicolon at the end

### 7.2 Where Changes Usually Belong

* Pure eligibility filters: **`eligible_consultant` CTE**
* Filter enforcement logic: **`eligible_consultant` CTE (NOT EXISTS block)**
* Filtered requirement definition: **`filtered_requirement` CTE**
* Pure scoring changes: **category branches** (`branch_*`)
* Price-performance calculation: **`price_performance` CTE**
* Output field changes (adding/removing columns): **final SELECT**
* Count behavior: **final SELECT's Count expression**
* Requirements selection logic: **`requirement` CTE**

### 7.3 Regression Checks After Changes

* Compare result set ordering (top 12) before vs after on a known demand
* Compare inclusion/exclusion of edge cases:
  * Location hard vs soft
  * Availability default vs soft
  * Hard filter enforcement (consultant below threshold excluded)
  * Soft filter enforcement (consultant with Score=0 excluded)
  * Missing experience coverage (consultant with no matching experience excluded)
  * Not-available status behavior when availability filter is not default
* Compare `Count` correctness (especially with cap)
* Verify PricePerformanceScore: best ratio consultant = 10, others scaled proportionally
* Verify edge case: EuroFixedRate = 0 results in PricePerformanceScore = 0
* Validate that internal/external identity fields still resolve correctly

---

## 8) Performance Analysis

If you want to systematically find bottlenecks:

* Run `EXPLAIN (ANALYZE, BUFFERS)` on the query in a comparable environment (or log query plan on Aurora PostgreSQL).
* Look for:
  * Large row counts in intermediate steps (especially union/aggregate stages)
  * Sort nodes with big memory or disk spill
  * Nested loop joins with high loop counts
  * Sequential scans on Experience table (should use index scans)

Pragmatic expectations:

* Increasing `@MaxRecords` from 12 to 16 often does **not** change the heavy part (scoring + ordering).
* Removing count sometimes helps, but only if count was forcing a second expensive pass.

---

## 9) Current State Summary

* Correct separation of stages via CTEs.
* **Early filter enforcement** in `eligible_consultant` using NOT EXISTS pattern.
* **Pre-materialized filter check** in `has_filtered_requirements` CTE (evaluated once, not per consultant).
* Prefilter stage limits candidates before expensive scoring joins.
* Location filter uses `EXISTS` to avoid score multiplication from multiple consultant locations.
* Count uses `COUNT(*) OVER()` window function for efficient single-pass computation.
* Cleaned start date computed once and reused.
* Uses `DOUBLE PRECISION` to reduce cast overhead and keep numeric stability for scoring.
* Descriptive CTE and alias names for maintainability.

---

## Query Parameters Reference

| Parameter | Description |
|-----------|-------------|
| `@DemandId` | ID of the demand to match against |
| `@TenantId` | Tenant context for multi-tenancy (security: validates demand access) |
| `@Nulldate` | Sentinel value for "no date" (typically 1900-01-01) |
| `@Filter_Default` | Filter category ID for "Default" (no filtering) |
| `@Filter_Soft` | Filter category ID for "Soft" filter |
| `@Filter_Hard` | Filter category ID for "Hard" filter |
| `@AvailabilityCategory_Yes` | Category ID for "Available" (Boolean Yes) |
| `@AvailabilityCategory_No` | Category ID for "Not Available" (Boolean No) |
| `@IsInExternalFilterActive` | Whether internal/external filter is active |
| `@ShowInternal` | Show internal consultants flag |
| `@ShowExternal` | Show external consultants flag |
| `@Cat_RoleSkill` | Category ID for RoleSkill |
| `@Cat_Skill` | Category ID for Skill |
| `@Cat_Role` | Category ID for Role |
| `@Cat_CustomRoleSkill` | Category ID for CustomRoleSkill |
| `@Cat_CustomSkill` | Category ID for CustomSkill |
| `@Cat_CustomRole` | Category ID for CustomRole |
| `@Cat_Industry` | Category ID for Industry |
| `@Cat_FunctionalArea` | Category ID for FunctionalArea |
| `@Cat_Language` | Category ID for Language |
| `@UseCustomRoles` | Boolean (0/1): Switch between standard roles (0) and custom roles (1) |
| `@RoleSkillScoringModeId` | Category ID: selected role-skill scoring mode |
| `@ScoringMode_StrictRole` | Category ID constant for strict role mode |
| `@ScoringMode_GlobalSkill` | Category ID constant for global skill mode |
| `@ScoringMode_RoleFirstHybrid` | Category ID constant for role-first hybrid mode |
| `@MaxRecords` | Page size for pagination |
| `@StartIndex` | Offset for pagination |

---

## 10) GetMatchingScoreByConsultantIds (Query 3)

### Purpose

A lightweight scoring query that returns only `MatchingScore` for specific consultant(s) against a demand. Used when demand requirements or consultant experiences change and scores need recalculation.

### Input Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `@TenantId` | GUID | Tenant isolation |
| `@DemandId` | GUID | Target demand |
| `@ConsultantIds` | Text (Expand Inline) | Comma-separated consultant UUIDs for IN clause |
| `@Cat_RoleSkill` | Category ID | Category ID for RoleSkill |
| `@Cat_Skill` | Category ID | Category ID for Skill |
| `@Cat_Role` | Category ID | Category ID for Role |
| `@Cat_CustomRoleSkill` | Category ID | Category ID for CustomRoleSkill |
| `@Cat_CustomSkill` | Category ID | Category ID for CustomSkill |
| `@Cat_CustomRole` | Category ID | Category ID for CustomRole |
| `@Cat_Industry` | Category ID | Category ID for Industry |
| `@Cat_FunctionalArea` | Category ID | Category ID for FunctionalArea |
| `@Cat_Language` | Category ID | Category ID for Language |
| `@UseCustomRoles` | Boolean | Switch between standard and custom role categories |
| `@RoleSkillScoringModeId` | Category ID | Selected role-skill scoring mode |
| `@ScoringMode_StrictRole` | Category ID | Mode constant for strict role |
| `@ScoringMode_GlobalSkill` | Category ID | Mode constant for global skill |
| `@ScoringMode_RoleFirstHybrid` | Category ID | Mode constant for role-first hybrid |

### Output Columns

| Column | Type | Description |
|--------|------|-------------|
| `Id` | GUID | The consultant ID |
| `MatchingScore` | Decimal | Aggregated score from all matched requirements (0 if no matches) |

### Query Architecture

Streamlined pipeline with no filters, no sorting, no pagination:

```
input_consultant (SELECT from Consultant WHERE Id IN @ConsultantIds)
    ↓
requirement (active requirements for demand)
    ↓
5 category branches (join to Experience WHERE ConsultantId IN @ConsultantIds)
    ↓
partials (UNION ALL)
    ↓
scores (GROUP BY ConsultantId → SUM(partial_score))
    ↓
final SELECT (LEFT JOIN input_consultant to scores, COALESCE for 0)
```

### Key Differences from Query 1

| Removed | Reason |
|---------|--------|
| `demand` CTE | No filters needed |
| `eligible_consultant` CTE | Direct ConsultantId filtering via input |
| `filtered_requirement` CTE | No filter enforcement |
| `kept` CTE | Return all scores, even 0 |
| `price_performance` CTE | Not needed |
| Count window function | No pagination |
| ORDER BY / LIMIT / OFFSET | No pagination |
| MatchedRequirementsCount | Not needed |

### Scoring Logic

Identical to Query 1:
* **RoleSkill**:
  * Strict/Hybrid: `DynamicWeight * RoleWeight` (proportional if below required score)
  * Global Skill: redistributed + deduplicated `SkillWeightEffective` by `SkillId` (proportional if below required score)
* **Role**: `DynamicWeight * 100.0` (proportional if below required score, disabled in Global Skill mode)
* **Industry**: `DynamicWeight * 100.0` (proportional if below required score)
* **FunctionalArea**: `DynamicWeight * 100.0` (proportional if below required score)
* **Language**: `DynamicWeight * 100.0` (proportional if below required score)

### LEFT JOIN Guarantee

All input consultants appear in the output:
* Consultants with matching experience: actual calculated score
* Consultants with no matching experience: `MatchingScore = 0`

### Performance Characteristics

**Expected: Sub-millisecond to few milliseconds**

Why it's fast:
1. **Direct lookup** via ConsultantId IN (...) with no full table scan
2. **Experience table indexes** on (ConsultantId, CategoryId, TenantId)
3. **Simple aggregation** with just SUM, no window functions
4. **No sorting** as results returned as-is
5. **Bulk is efficient** as same query works for 1 or 100 consultants
