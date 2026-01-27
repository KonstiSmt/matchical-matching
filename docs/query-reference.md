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
* Contract-type flags (Only show freelancer / temporary / permanent)
* Pricing context (client offsite rate)
* A computed/maintained number: `ExperienceFilterCount` (how many demand requirements have active filter semantics)

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

### 2.4 Scoring Model

For each demand requirement that matches an experience row, the query computes a partial contribution:

* If consultant score meets or exceeds required score, they get full weight.
* If it is below, they get proportional weight: `weight * (consultant_score / required_score)`.

Then:

* Partial scores are summed per consultant → `MatchingScore`.

Additionally:

* Soft/Hard filters are enforced using helper fields that detect whether a consultant fails any filtered requirement.

---

## 3) Query Structure (CTE by CTE)

The query is organized as a chain of **Common Table Expressions (CTEs)**. Treat each CTE as a named pipeline stage.

### 3.1 `d` CTE: Demand Context (Single Row)

Extracts demand fields once:

* `LocFilter`, `AvailFilter`, capacity flags, contract-type flags
* `CleanedStartDate` computed once:
  * If demand start date is sentinel, keep sentinel
  * If demand start date is earlier than today, clamp to today
  * Else use demand start date

This is a correctness + performance pattern: compute once, reuse.

### 3.2 `req` CTE: Active, Valid Demand Requirements

Pulls all requirement lines for this demand:

* Active only
* No missing keys
* Includes category identifiers and all matching keys needed to join to experience

### 3.3 `ec` CTE: Eligible Consultants (Prefilter)

The "cheap" filter stage. Returns only consultant identifiers that are eligible to even be considered.

Includes:

* Tenant constraint
* Internal/external visibility logic
* "Not available" exclusion when availability filter is not default
* Contract-type filters (only apply if at least one demand flag is set)
* Location filtering driven by demand's location filter category (Default / Soft / Hard)
* Availability window logic using `CleanedStartDate`, next availability date, notice period
* Capacity constraints

**Important**: This stage reduces the dataset before scoring joins happen.

The consultant's status is validated by joining `{Status}` and requiring `{Status}.[IsReady] = 1` and `{Status}.[IsActive] = 1`.

### 3.4 Category Branches: `b_roleskill`, `b_role`, `b_industry`, `b_functional`, `b_language`

These branches:

* Join `req` to `{Experience}` for one category using the correct keys.
* Join to `ec` to ensure only eligible consultants participate.
* Compute:
  * `partial_score` (using `DOUBLE PRECISION`)
  * `excl_partial` (whether this requirement fails a filter)
  * `has_filter_partial` (whether this requirement is a filter at all)

Role-skill differs from the others:

* It multiplies by `RoleWeight`.
* Others multiply by `100.0`.

Most branches prune `partial_score > 0` to reduce downstream data.

### 3.5 `partials` CTE: Union of Category Branches

Uses `UNION ALL` (avoids distinct-sort overhead) to combine everything.

### 3.6 `scores` CTE: Aggregate Per Consultant

Per consultant:

* `SUM(partial_score)` → `MatchingScore`
* `MAX(excl_partial)` → `IsExcludedMax` (if any filtered requirement excludes them)
* `SUM(has_filter_partial)` → `HasFilterSum` (how many filtered requirements were seen/satisfied)

### 3.7 `kept` CTE: Enforce "Must Satisfy All Filtered Requirements"

Removes consultants that:

* Have `IsExcludedMax = 1`, or
* Have `HasFilterSum <> d.ExperienceFilterCount`

Also requires:

* `MatchingScore > 0`

This is the "filter enforcement" strategy.

### 3.8 Final SELECT: Identity Fields + Price-Performance + Pagination + Capped Count

Final stage:

* Joins `{Consultant}` again (identity join after scoring)
* Joins `{ExternalUser}` and `{ConsultancyUser}` to produce Email/Name/Photo fields
* Computes `PricePerformanceScore` guarded against division by zero and rate thresholds
* Produces `Count` via a capped count subquery:
  * `(SELECT COUNT(*) FROM (SELECT 1 FROM kept LIMIT @CountCap) t)`

Pagination:

* `ORDER BY k.MatchingScore DESC`
* `LIMIT @MaxRecords`
* `OFFSET @StartIndex`

---

## 4) Pagination and Count

### 4.1 Pagination Mechanics

* `LIMIT @MaxRecords` returns page size.
* `OFFSET @StartIndex` skips the first N rows in the sorted result.

**Key implication:** With an `ORDER BY MatchingScore`, the database generally must compute enough of the ordering to know which rows are "top" after the offset. That can still be expensive even if you only return 12 rows.

### 4.2 Count Mechanics (Capped)

The current count:

* Counts up to `@CountCap` rows from `kept`.
* Avoids a full window count like `COUNT(*) OVER()` (which forces counting all rows).

**Performance reality:** Even capped count can still be expensive if `kept` itself is expensive to materialize. The count is not always the dominant cost; often the expensive part is producing and sorting scored rows.

---

## 5) Known Scalability Bottlenecks

### 5.1 Join Explosion in the Scoring Phase

The work scales roughly with:

* Number of eligible consultants (`ec`)
  × number of requirements (`req`)
  × density of experience rows per consultant per category

As the skill graph becomes richer (multi-parent), if you pre-calculate more "indirect" experience rows, you increase experience density, which increases join and aggregate load.

### 5.2 Sorting by MatchingScore

Sorting large candidate sets is expensive. Even if you only return 12 rows, if the database can't cheaply restrict to "top K" early, it can still sort a huge intermediate set.

### 5.3 Filter Enforcement Method (IsExcludedMax, HasFilterSum)

This method forces you to:

* Carry additional columns through the branch unions
* Aggregate them
* Then filter in `kept`

It works, but it can be heavier than necessary.

---

## 6) Open Improvement Direction: Replace IsExcludedMax/HasFilterSum with Early Rejection

### 6.1 Conceptual Change

Instead of:

* computing `excl_partial` + `has_filter_partial`
* aggregating them
* comparing to `ExperienceFilterCount`

You'd do something like:

* "Keep consultant only if there does not exist any filtered requirement that is not satisfied by an experience row."

That can eliminate:

* `IsExcludedMax`
* `HasFilterSum`
* `ExperienceFilterCount` usage (or at least reduce reliance on it)

### 6.2 Why It Can Be Faster

* `NOT EXISTS` allows the planner to short-circuit when it finds the first violation.
* It can also leverage indexes differently than "compute everything then aggregate."

### 6.3 Why It's Tricky

* Must replicate exactly the semantics of Soft vs Hard filters (score = 0 vs score < required score).
* Must ensure category-specific key matching is identical.
* Must ensure you're not changing scoring or inclusion behavior.

Needs careful implementation + regression testing.

---

## 7) Indexing Checklist

Beyond primary keys and foreign keys:

### 7.1 Closure and Mapping Tables

* `{LocationTagsClosure}`: composite index on
  * `(AncestorId, DescendantId)`
  * and (if you also query reversed direction frequently) `(DescendantId, AncestorId)`
* `{ConsultantLocations}`: composite index on
  * `(ConsultantId, LocationTagId)`

### 7.2 Experience Table (Biggest Win Candidate)

Category branches join `{Experience}` on combinations of:

* Tenant identifier
* Category identifier
* Consultant identifier
* One of: (RoleId, SkillId), RoleId, IndustryId, FunctionalAreaId, LanguageId

Typical composite indexes per category pattern:

* Role-skill branch: `(TenantId, CategoryId, RoleId, SkillId, ConsultantId)`
* Role branch: `(TenantId, CategoryId, RoleId, ConsultantId)`
* Industry branch: `(TenantId, CategoryId, IndustryId, ConsultantId)`
* Functional area branch: `(TenantId, CategoryId, FunctionalAreaId, ConsultantId)`
* Language branch: `(TenantId, CategoryId, LanguageId, ConsultantId)`

### 7.3 Boolean and Status Flags

* Ensure `{Consultant}.[StatusId]` is indexed (typically is as a foreign key).
* If the status table is tiny, `IsReady` and `IsActive` indexes are irrelevant.

---

## 8) Safe Workflow for Modifying This Query

### 8.1 Never Change Unless Explicitly Requested

* Output column list and order:
  * `Id, MatchingScore, PricePerformanceScore, Email, Name, FirstName, LastName, PhotoUrl, EuroFixedRate, Count`
* Sort order:
  * `ORDER BY k.MatchingScore DESC` (unless explicitly changing ranking)
* Pagination contract:
  * `LIMIT @MaxRecords`
  * `OFFSET @StartIndex`
* No trailing semicolon at the end

### 8.2 Where Changes Usually Belong

* Pure eligibility filters: **`ec` CTE**
* Pure scoring changes: **category branches** (`b_*`)
* Output field changes (adding/removing columns): **final SELECT**
* Count behavior: **final SELECT's Count expression**
* Requirements selection logic: **`req` CTE** or branch membership

### 8.3 Regression Checks After Changes

* Compare result set ordering (top 12) before vs after on a known demand
* Compare inclusion/exclusion of edge cases:
  * Location hard vs soft
  * Availability default vs soft
  * Contract type flags (none selected vs some selected)
  * Not-available status behavior when availability filter is not default
* Compare `Count` correctness (especially with cap)
* Validate that internal/external identity fields still resolve correctly

---

## 9) Performance Analysis

If you want to systematically find bottlenecks:

* Run `EXPLAIN (ANALYZE, BUFFERS)` on the query in a comparable environment (or log query plan on Aurora PostgreSQL).
* Look for:
  * Large row counts in intermediate steps (especially union/aggregate stages)
  * Sort nodes with big memory or disk spill
  * Nested loop joins with high loop counts

Pragmatic expectations:

* Increasing `@MaxRecords` from 12 to 16 often does **not** change the heavy part (scoring + ordering).
* Removing count sometimes helps, but only if count was forcing a second expensive pass.

---

## 10) Current State Summary (What the Query Gets Right)

* Correct separation of stages via CTEs.
* Prefilter stage (`ec`) limits candidates before expensive scoring joins.
* Location filter uses `EXISTS` to avoid score multiplication from multiple consultant locations.
* Count is capped (`@CountCap`) to avoid full-window count.
* Cleaned start date computed once and reused.
* Uses `DOUBLE PRECISION` to reduce cast overhead and keep numeric stability for scoring.

---

## Query Parameters Reference

| Parameter | Description |
|-----------|-------------|
| `@DemandId` | ID of the demand to match against |
| `@TenantId` | Tenant context for multi-tenancy |
| `@Nulldate` | Sentinel value for "no date" (typically 1900-01-01) |
| `@Filter_Default` | Filter category ID for "Default" (no filtering) |
| `@Filter_Soft` | Filter category ID for "Soft" filter |
| `@Filter_Hard` | Filter category ID for "Hard" filter |
| `@Status_NotAvailable` | Status ID for "Not Available" status |
| `@IsInExternalFilterActive` | Whether internal/external filter is active |
| `@ShowInternal` | Show internal consultants flag |
| `@ShowExternal` | Show external consultants flag |
| `@Cat_RoleSkill` | Category ID for RoleSkill |
| `@Cat_Role` | Category ID for Role |
| `@Cat_Industry` | Category ID for Industry |
| `@Cat_FunctionalArea` | Category ID for FunctionalArea |
| `@Cat_Language` | Category ID for Language |
| `@PricePerformanceRatio` | Divisor for price-performance calculation |
| `@CountCap` | Maximum count to return (avoids full count) |
| `@MaxRecords` | Page size for pagination |
| `@StartIndex` | Offset for pagination |
