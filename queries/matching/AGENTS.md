# Matching Queries

## Query Architecture

| Query Name | Purpose | Output |
|-------|---------|--------|
| GetMatchesByDemandId | Scoring | ConsultantId, MatchingScore, PricePerformanceScore, MatchedRequirementsCount, Count, HasActiveFilters |
| GetConsultantMatchPreview | Preview | Display data for match cards (nested JSON) |
| GetMatchingScoreByConsultantIds | Lightweight scoring | DemandId, ConsultantId, MatchingScoreStrict, MatchingScoreHybrid, MatchingScoreSkills, CustomRolesMatchingScoreStrict, CustomRolesMatchingScoreHybrid, CustomRolesMatchingScoreSkills |
| GetConsultantFullDetails | Full details | Complete matching breakdown with all categories |

## Output Column Contracts (DO NOT REORDER)

**GetMatchesByDemandId:**
```
ConsultantId, MatchingScore, PricePerformanceScore, MatchedRequirementsCount, Count, HasActiveFilters
```

**GetConsultantMatchPreview:**
```
ConsultantId, IsPinned, MatchingScore, PricePerformanceScore, FirstName, LastName, PhotoUrl, TopRoleName, EuroFixedRate, AvailabilityCategoryId, EmploymentStatusId, EmploymentStatusLabelTranslationsJSON, TotalMatchingRequirements, TopMatchesJson, TopMatches
```

**GetMatchingScoreByConsultantIds:**
```
DemandId, ConsultantId, MatchingScoreStrict, MatchingScoreHybrid, MatchingScoreSkills, CustomRolesMatchingScoreStrict, CustomRolesMatchingScoreHybrid, CustomRolesMatchingScoreSkills
```

**GetConsultantFullDetails:**
```
ConsultantId, IsPinned, MatchingScore, PricePerformanceScore, FirstName, LastName, PhotoUrl, TopRoleName, EuroFixedRate, ClientOffsiteRate, ContingentDays, AvailabilityCategoryId, AvailableFrom, AvailableTo, AvailableDaysPerWeek, IsWillingToTravel, RequiredLocationName, RequiredLocationColor, MatchingConsultantLocationName, MatchingConsultantLocationColor, RoleSkillsJson, IndustriesJson, FunctionalAreasJson, LanguagesJson, RoleSkills, Industries, FunctionalAreas, Languages
```

---

## CTE Pipeline (GetMatchesByDemandId)

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

## Performance: Inline Permission Gating

**Status:** Enabled in the hot matching queries.

Rules:
- Refer to matching queries by query name, not ordinal numbers.
- Resolve matching visibility inline in the same SQL call; do not call generic permission queries from hot matching paths.
- Matching visibility permissions are operation/feature permissions; do not filter them by `PermissionMethodId`.
- Treat `@IsMatchicalAdmin = 1` as a hard bypass and skip tenant-user permission resolution.
- Check grant paths in this order:
  1. Matchical admin
  2. Super admin
  3. Global grant (`All` / `On`)
  4. `Own`
  5. `MyReports`
- Do not touch `Opportunity`, `CoOwner`, `ExternalUser`, or `ConsultancyUserClosure` on the admin / super-admin / global-grant path.
- Only the `MyReports` path may hit `ConsultancyUserClosure`.
- Keep permission target resolution inside the hottest pruning CTE:
  - GetMatchesByDemandId: `eligible_consultant`
  - GetMatchesByConsultantId: consultant root and visible-demand gating

---

## Documentation

- `docs/query-reference.md` - Full technical documentation
- `docs/performance-analysis.md` - Performance notes
- `docs/output-examples/` - Example outputs for each query
