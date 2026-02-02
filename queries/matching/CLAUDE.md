# Matching Queries

## Query Architecture

| Query | Purpose | Output |
|-------|---------|--------|
| Query 1 | Scoring | ConsultantId, MatchingScore, PricePerformanceScore, MatchedRequirementsCount, Count, HasActiveFilters |
| Query 2 | Preview | Display data for match cards (nested JSON) |
| Query 3 | Lightweight scoring | ConsultantId, MatchingScore (for recalculation) |
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
ConsultantId, MatchingScore
```

**Query 4 (GetConsultantFullDetails):**
```
ConsultantId, IsPinned, MatchingScore, PricePerformanceScore, FirstName, LastName, PhotoUrl, TopRoleName, EuroFixedRate, ClientOffsiteRate, ContingentDays, AvailabilityCategoryId, AvailableFrom, AvailableTo, AvailableDaysPerWeek, IsWillingToTravel, RequiredLocationName, RequiredLocationColor, MatchingConsultantLocationName, MatchingConsultantLocationColor, RoleSkillsJson, IndustriesJson, FunctionalAreasJson, LanguagesJson, RoleSkills, Industries, FunctionalAreas, Languages
```

---

## CTE Pipeline (Query 1)

```
demand → requirements → eligible_consultants → scoring branches → partials → scores → kept → price_performance → final SELECT
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
- TopMatches JSON contains top 2 ranked by partial_score
- ConsultantScore is raw Experience.Score (1-5, or 1-6 for languages)

**Custom Roles (when @UseCustomRoles = 1):**
- Scoring uses CustomRoleId for matching
- Name resolution uses CustomRole → RoleName path
- RoleSkillsJson groups by CustomRoleId
- Standard mode (@UseCustomRoles = 0) unchanged

---

## Documentation

- `docs/query-reference.md` - Full technical documentation
- `docs/performance-analysis.md` - Performance notes
- `docs/output-examples/` - Example outputs for each query
