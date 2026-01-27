# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Purpose

This repository is for iterating on the **GetMatchesByDemandId** SQL query—a consultant-to-demand matching query running on **OutSystems ODC** with **Aurora PostgreSQL**.

## Repository Structure

- `queries/GetMatchesByDemandId.sql` — The active matching query
- `docs/query-reference.md` — Full documentation (matching concepts, CTE walkthrough, performance notes, improvement directions)

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

## Query Architecture (CTE Pipeline)

```
d (demand context) → req (requirements) → ec (eligible consultants prefilter)
    ↓
b_roleskill, b_role, b_industry, b_functional, b_language (scoring branches)
    ↓
partials (union) → scores (aggregate) → kept (filter enforcement) → final SELECT
```

## Output Column Contract (DO NOT REORDER)

```
Id, MatchingScore, PricePerformanceScore, Email, Name, FirstName, LastName, PhotoUrl, EuroFixedRate, Count
```

Column order is contractual with the OutSystems output structure.

## Safe Modification Zones

| Change Type | Modify Here |
|-------------|-------------|
| Eligibility filters | `ec` CTE |
| Scoring logic | `b_*` category branches |
| Output fields | Final SELECT |
| Count behavior | Final SELECT's Count expression |
| Requirement selection | `req` CTE |

## Editing Rules

1. Provide **full-length query** for copy/paste (no partial snippets)
2. Changes must be **surgical**—modify only what's required, keep everything else verbatim
3. Never change column order without explicit request
4. Never add trailing semicolon

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
- Contract-type filter combinations
- "Not Available" status exclusion when availability filter is active
- Count accuracy with cap
- Internal vs external identity field resolution
