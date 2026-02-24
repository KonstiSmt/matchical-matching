# Matching Queries

## Query Architecture

| Query | Purpose | Output |
|-------|---------|--------|
| Query 1 | Scoring | ConsultantId, MatchingScore, PricePerformanceScore, MatchedRequirementsCount, Count, HasActiveFilters |
| Query 2 | Preview | Display data for match cards (nested JSON) |
| Query 3 | Lightweight scoring | DemandId, ConsultantId, MatchingScoreStrict, MatchingScoreHybrid, MatchingScoreSkills, CustomRolesMatchingScoreStrict, CustomRolesMatchingScoreHybrid, CustomRolesMatchingScoreSkills |
| Query 4 | Full details | Complete matching breakdown with all categories |

## Output Column Contracts (DO NOT REORDER)

**Query 1 (GetMatchesByDemandId):**
```
ConsultantId, MatchingScore, PricePerformanceScore, MatchedRequirementsCount, Count, HasActiveFilters
```

**Query 2 (GetConsultantMatchPreview):**
```
ConsultantId, IsPinned, MatchingScore, PricePerformanceScore, FirstName, LastName, PhotoUrl, TopRoleName, EuroFixedRate, AvailabilityCategoryId, EmploymentStatusId, EmploymentStatusLabelTranslationsJSON, TotalMatchingRequirements, TopMatchesJson, TopMatches
```

**Query 3 (GetMatchingScoreByConsultantIds):**
```
DemandId, ConsultantId, MatchingScoreStrict, MatchingScoreHybrid, MatchingScoreSkills, CustomRolesMatchingScoreStrict, CustomRolesMatchingScoreHybrid, CustomRolesMatchingScoreSkills
```

**Query 4 (GetConsultantFullDetails):**
```
ConsultantId, IsPinned, MatchingScore, PricePerformanceScore, FirstName, LastName, PhotoUrl, TopRoleName, EuroFixedRate, ClientOffsiteRate, ContingentDays, AvailabilityCategoryId, AvailableFrom, AvailableTo, AvailableDaysPerWeek, IsWillingToTravel, RequiredLocationName, RequiredLocationColor, MatchingConsultantLocationName, MatchingConsultantLocationColor, RoleSkillsJson, IndustriesJson, FunctionalAreasJson, LanguagesJson, RoleSkills, Industries, FunctionalAreas, Languages
```

---

## CTE Pipeline (Query 1)

```
demand -> requirements -> eligible_consultants -> scoring branches -> partials -> scores -> kept -> price_performance -> final SELECT
```

---

## Safe Modification Zones

| Change Type | Modify Here |
|-------------|-------------|
| Eligibility filters | `eligible_consultant` CTE |
| Scoring logic | `branch_*` CTEs |
| Price-performance | `price_performance` CTE |
| Output fields | Final SELECT |
| Count behavior | Final SELECT's Count expression |
| Requirement selection | `requirement` CTE |

---

## Regression Checklist

After any change, verify:
- Top 12 ordering matches expected behavior
- Location filter edge cases (Default/Soft/Hard)
- Availability filter edge cases (Default=all, Soft=No only, Hard=Yes only)
- Count accuracy
- PricePerformanceScore: best ratio = 10, others scaled
- PricePerformanceScore: EuroFixedRate = 0 results in score = 0
- Internal vs external identity field resolution
- Mandatory role soft gate: consultant has `Score > 0` in at least one required role (Role/CustomRole by mode)
- RoleSkill scoring mode parity: Strict Role and Global Skill match their expected baseline outputs
- RoleSkill hybrid correctness: `effective_score = max(role_score, max(global_score - 1, 0))` in scoring and filter checks
- Global Skill mode: mandatory role soft gate and role/category filter enforcement are bypassed
- Global Skill mode: role requirement contribution is redistributed to same-role skills, then deduplicated by `SkillId`
- Global Skill mode dedup merge: `ReqScore = MAX`, `SkillWeightEffective = SUM`, must-have = any must-have
- Global Skill mode filtered role-skill merge uses Hard > Soft > Default precedence
- TopMatches JSON contains top 2 ranked by partial_score
- ConsultantScore is effective score for role-skill categories and raw Experience.Score for non role-skill categories
- Full details Global Skill mode: one wrapper role object is returned; wrapper role scoring fields are `NULL`; nested skills are distinct deduplicated skills
- Wrapper role selection in Global Skill mode is deterministic: highest role requirement DynamicWeight, tie-break by RequirementId ascending

**Custom Roles (when @UseCustomRoles = 1):**
- Scoring uses CustomRoleId for matching
- Name resolution uses CustomRole -> RoleName path
- RoleSkillsJson groups by CustomRoleId
- Standard mode (@UseCustomRoles = 0) unchanged

---

## Performance: MATERIALIZED CTEs

**Status:** Enabled in Query 1 (GetMatchesByDemandId)

### What It Does
The `MATERIALIZED` keyword on CTEs forces PostgreSQL to compute and store the CTE result once, preventing the planner from inlining it. This creates an "optimization fence" that stabilizes query execution plans.

### Why It Was Added
Without MATERIALIZED, PostgreSQL's planner can choose different execution plans on different runs of the same query, causing:
- **Fast runs:** <100ms (good plan: Hash Anti-Join + Index Seek)
- **Slow runs:** 5-10s (bad plan: Nested Loop + Seq Scan)

This 100x variance was caused by planner instability, not data issues.

### CTEs with MATERIALIZED
- `demand` (1 row) - negligible cost
- `requirement` (5-20 rows) - negligible cost
- `filtered_requirement` (0-10 rows) - negligible cost
- `has_filtered_requirements` (1 row) - negligible cost
- `eligible_consultant` (100-1000+ rows) - small cost, monitor this one

### Troubleshooting Performance Issues

**If query performance degrades after this change:**
1. Try removing MATERIALIZED from `eligible_consultant` first (largest CTE)
2. Keep MATERIALIZED on the smaller CTEs (demand, requirement, filtered_requirement, has_filtered_requirements)
3. If still slow, check if database statistics are stale (request DBA to run ANALYZE)

**If random slowdowns return:**
- MATERIALIZED may have been accidentally removed
- Database statistics may be severely stale
- Consider requesting Aurora Query Plan Management (QPM) from DBA

### Trade-offs
| Benefit | Cost |
|---------|------|
| Consistent execution plans | Prevents predicate pushdown into CTEs |
| No more 10s outliers | Small memory overhead for storing CTE results |
| Predictable performance | Planner has fewer optimization options |

---

## Documentation

- `docs/query-reference.md` - Full technical documentation
- `docs/performance-analysis.md` - Performance notes
- `docs/output-examples/` - Example outputs for each query
