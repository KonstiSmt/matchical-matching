# Experience Entity

For complete physical schema, see `docs/entities/modules/matching-core.json`.
Reference taxonomy details are in `docs/entities/modules/reference-taxonomy.json`.

## Experience

| Column (physical) | Type | Usage |
|---|---|---|
| `id` | `character varying` | Experience row key |
| `tenantid` | `character varying` | Tenant scope |
| `consultantid` | `character varying` | Linked consultant |
| `categoryid` | `integer` | Experience category |
| `roleid` | `character varying` | Role key |
| `skillid` | `character varying` | Skill key |
| `customroleid` | `character varying` | Custom role key |
| `industryid` | `character varying` | Industry key |
| `functionalareaid` | `character varying` | Functional area key |
| `languageid` | `character varying` | Language key |
| `score` | `integer` | Normalized score |
| `totalmonth` | `numeric` | Total months of experience |
| `absolutemonth` | `integer` | Absolute month count |
| `weightedmonth` | `numeric` | Weighted month metric |
| `lastused` | `timestamp with time zone` | Last usage timestamp |
| `lastthreeyearsusage` | `numeric` | Recent usage indicator |
| `isongoing` | `numeric` | Ongoing experience flag |
| `isindirect` | `numeric` | Indirect experience flag |
| `isactive` | `numeric` | Active flag |
| `createdat` | `timestamp with time zone` | Created timestamp |

## Query Matching Notes

- `DemandRequirement.categoryid` and `Experience.categoryid` must align.
- Score comparison still follows requirement-threshold logic (`experience.score` vs `demandrequirement.score`).
- `roleweight` and `dynamicweight` live on `DemandRequirement`, not `Experience`.
