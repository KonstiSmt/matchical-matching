# Location Entities

For complete physical schema, see `docs/entities/modules/matching-core.json`.

## LocationTag

| Column (physical) | Type | Usage |
|---|---|---|
| `id` | `character varying` | Location node key |
| `namelocalekeyid` | `character varying` | Locale key for display name |
| `categoryid` | `integer` | Location category/type |
| `parentid` | `character varying` | Parent location node |
| `statusid` | `integer` | Status |
| `createdat` | `timestamp with time zone` | Created timestamp |

## LocationTagsClosure

| Column (physical) | Type | Usage |
|---|---|---|
| `id` | `character varying` | Row key |
| `ancestorid` | `character varying` | Ancestor location |
| `descendantid` | `character varying` | Descendant location |
| `depth` | `integer` | Hierarchy distance |

Usage in matching:
- Demand coverage: consultant location as descendant of demand location.
- Consultant coverage: consultant location as ancestor of demand location.

## ConsultantLocations

| Column (physical) | Type | Usage |
|---|---|---|
| `id` | `character varying` | Row key |
| `tenantid` | `character varying` | Tenant scope |
| `consultantid` | `character varying` | Linked consultant |
| `locationtagid` | `character varying` | Linked location |
| `createdat` | `timestamp with time zone` | Created timestamp |
| `updatedat` | `timestamp with time zone` | Updated timestamp |
