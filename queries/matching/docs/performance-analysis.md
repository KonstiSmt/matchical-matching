# Matching Query Performance Analysis

Performance analysis and scalability documentation for matching queries.

---

## Query Architecture

```
demand (1 row)           →  requirement (~15 rows)
                              ↓
role_requirement (0-3 rows) → has_role_requirements (1 row, scalar)
                              ↓
filtered_requirement (0-5 rows) → has_filtered_requirements (1 row, scalar)
                              ↓
eligible_consultant (N consultants filtered)
    • Tenant filter
    • Status filter (IsReady, IsActive)
    • Internal/External visibility filter
    • Location filter (EXISTS checks)
    • Availability filter
    • Capacity filter
    • Mandatory role soft gate (EXISTS, Score > 0 in at least one required role)
    • Requirement filter enforcement (NOT EXISTS)
                              ↓
5 branch CTEs (Experience JOIN requirement JOIN eligible_consultant)
    • branch_roleskill
    • branch_role
    • branch_industry
    • branch_functional
    • branch_language
                              ↓
partials (UNION ALL) → scores (GROUP BY) → kept (WHERE > 0)
                              ↓
price_performance (JOIN Consultant for rate)
                              ↓
final (pagination: ORDER BY, LIMIT, OFFSET)
```

---

## Complexity Analysis

**Input parameters (typical):**
- Experiences per consultant: ~500
- Requirements per demand: ~15
- Filtered requirements (Hard/Soft): 0-5

**Complexity by stage:**

| Stage | Complexity | Notes |
|-------|------------|-------|
| demand | O(1) | Primary key lookup |
| requirement | O(R) | Index on (DemandId, TenantId), ~15 rows |
| role_requirement | O(Rr) | Subset of R by role category, usually tiny |
| has_role_requirements | O(1) | Scalar EXISTS check |
| filtered_requirement | O(F) | Subset of R, ~0-5 rows |
| has_filtered_requirements | O(1) | Scalar EXISTS check |
| eligible_consultant | O(N × (F + Rr) × log(E)) | With TenantId-first indexes |
| branch CTEs | O(R × matches) | Index-driven joins |
| scores aggregation | O(matches) | Hash aggregate |
| price_performance | O(kept) | Primary key join |
| final | O(kept × log(kept)) | Sort for pagination |

Where:
- N = consultants in tenant
- R = requirements (~15)
- Rr = role requirements in active role mode (usually 0-3)
- F = filtered requirements (~0-5)
- E = experiences per consultant (~500)

---

## Scalability Estimates

**Assumptions:**
- 15 requirements per demand
- 500 experiences per consultant
- 3 filtered requirements (Hard/Soft)
- ~30% of consultants pass eligibility filters
- ~60% of eligible consultants have MatchingScore > 0
- Aurora db.r6g.large (2 vCPU, 16GB RAM)
- Warm cache (indexes in memory)

| Consultants | Experience Rows | Eligible | Scored | No Filters | 3 Filters | Assessment |
|-------------|-----------------|----------|--------|------------|-----------|------------|
| 5,000 | 2.5M | 1,500 | 900 | 30-60ms | 50-100ms | Excellent |
| 10,000 | 5M | 3,000 | 1,800 | 50-100ms | 80-150ms | Excellent |
| 20,000 | 10M | 6,000 | 3,600 | 80-150ms | 120-250ms | Good |
| 30,000 | 15M | 9,000 | 5,400 | 100-200ms | 180-350ms | Good |
| 50,000 | 25M | 15,000 | 9,000 | 150-300ms | 280-550ms | Monitor |
| 100,000 | 50M | 30,000 | 18,000 | 250-500ms | 500-1000ms | Consider partitioning |

**Scaling factors:**
- Experience table size dominates performance
- Mandatory role soft gate adds one indexed EXISTS check per consultant
- Filter enforcement adds ~30-50% overhead when active
- Cold cache (first run): 2-3x slower
- Complex location hierarchies: +20-50ms
- High filter selectivity (many consultants excluded): faster

---

## Index Requirements

### Experience Table (Critical)

All indexes follow the **TenantId-first pattern** for multi-tenant optimization:

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
- Multi-tenant isolation: TenantId partitions data logically
- With 30k+ consultants per tenant, TenantId narrows search space immediately
- All query WHERE clauses filter by TenantId early
- Supports both filter enforcement (NOT EXISTS) and branch CTE joins

**Global skill mode requirement (`@UseGlobalSkillExperienceForRoleSkill = 1`):**
- RoleSkill/CustomRoleSkill requirements match `@Cat_Skill` / `@Cat_CustomSkill` using `SkillId` only.
- Missing the skill-level index can cause slower nested-loop plans in both filter enforcement and `branch_roleskill`.

Recommended DDL (apply in DBA/migration workflow before enabling the mode in production):
```sql
CREATE INDEX IF NOT EXISTS idx_experience_tenant_consultant_category_skill_score
ON <physical_experience_table_name> ("TenantId", "ConsultantId", "CategoryId", "SkillId", "Score")
```

### DemandRequirement Table (for Inverse Matching, Query 5)

Per-category composite indexes needed for Query 5 (GetMatchesByConsultantId), where scoring branches join `consultant_experience → {DemandRequirement}` on category-specific keys. Without these, PostgreSQL must sequential-scan DemandRequirement per branch.

| Category | Index Columns |
|----------|---------------|
| RoleSkill | `(TenantId, CategoryId, RoleId, SkillId)` |
| CustomRoleSkill | `(TenantId, CategoryId, CustomRoleId, SkillId)` |
| Role | `(TenantId, CategoryId, RoleId)` |
| CustomRole | `(TenantId, CategoryId, CustomRoleId)` |
| Industry | `(TenantId, CategoryId, IndustryId)` |
| FunctionalArea | `(TenantId, CategoryId, FunctionalAreaId)` |
| Language | `(TenantId, CategoryId, LanguageId)` |

**Why per-category:** Each scoring branch filters by a specific CategoryId then matches on that category's key columns. Per-category indexes avoid wasted entries from unrelated categories and keep index depth shallow.

**Impact without indexes:** With ~30K DemandRequirement rows per tenant, sequential scan per branch adds ~5-15ms each (~25-75ms total). Acceptable at current scale but degrades as demand count grows. The indexes are cheap (small table, low write frequency).

### Other Tables

| Table | Index | Purpose |
|-------|-------|---------|
| ConsultantLocations | `(ConsultantId, LocationTagId)` | Location filter |
| LocationTagsClosure | `(AncestorId, DescendantId)` | Location hierarchy (contained) |
| LocationTagsClosure | `(DescendantId, AncestorId)` | Location hierarchy (covers) |
| Consultant | `(TenantId, StatusId)` | Eligibility filter |
| DemandRequirement | `(DemandId, TenantId, IsActive)` | Forward requirements lookup (Query 1) |

---

## Optimization History

### Implemented Optimizations

1. **Pre-materialized filter check** (Jan 2026)
   - Added `has_filtered_requirements` CTE
   - Evaluates `EXISTS (SELECT 1 FROM filtered_requirement)` once globally
   - Previously: evaluated per-consultant in WHERE clause
   - Impact: Eliminates redundant CTE materialization when no filters active

2. **Early filter enforcement in eligible_consultant** (earlier)
   - Moved filter enforcement from aggregate-based to NOT EXISTS pattern
   - Consultants failing filters excluded before scoring joins
   - Impact: Reduces row volume through scoring pipeline

3. **TenantId-first indexes** (earlier)
   - All Experience indexes start with TenantId
   - Consistent with multi-tenant data model
   - Impact: ~30-50% faster queries across all scenarios

### Cannot Be Optimized Further

1. **Fundamental join pattern** - Experience must be joined to requirements for scoring
2. **Sorting for pagination** - ORDER BY MatchingScore DESC requires computing all scores
3. **Filter enforcement** - Must check all consultants against all filtered requirements

---

## Future Considerations (100k+ Consultants)

If tenant size grows beyond 100k consultants:

1. **Table partitioning** - Partition Experience table by TenantId
2. **Pre-computed materialized views** - Cache frequently accessed demand matches
3. **Async scoring** - Background job for score computation with cached results
4. **Sharding** - Distribute tenants across database instances

These are not needed until 100k+ consultants per tenant.

---

## Performance Testing Checklist

When validating changes:

1. Test with demand that has NO filtered requirements
2. Test with demand that has 3-5 Hard/Soft filtered requirements
3. Compare execution time before/after changes
4. Run EXPLAIN ANALYZE to verify index usage
5. Test with cold cache (restart connection pool)
6. Verify at target tenant size (30k consultants)
