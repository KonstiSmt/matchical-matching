# Demand Entities

This file keeps query-relevant demand fields for matching.
For complete physical schemas, see `docs/entities/modules/matching-core.json`.

## Demand

| Column (physical) | Type | Usage |
|---|---|---|
| `id` | `character varying` | Demand primary key |
| `tenantid` | `character varying` | Tenant scope |
| `statusid` | `integer` | Demand status |
| `namelocalekeyid` | `character varying` | Demand name locale key |
| `descriptionlocalekeyid` | `character varying` | Demand description locale key |
| `descriptionkeyid` | `character varying` | Description key reference |
| `opportunityid` | `character varying` | Linked opportunity |
| `locationtagid` | `character varying` | Demand location |
| `locationfiltercategoryid` | `integer` | Location filter mode |
| `islocationfilteractive` | `numeric` | Location filter active flag |
| `availabilityfiltercategoryid` | `integer` | Availability filter mode |
| `iscapacityfilteractive` | `numeric` | Capacity filter active flag |
| `capacity` | `integer` | Required capacity |
| `startdate` | `timestamp with time zone` | Planned start |
| `enddate` | `timestamp with time zone` | Planned end |
| `clientoffsiterate` | `numeric` | Client offsite rate |
| `clientonsiterate` | `numeric` | Client onsite rate |
| `consultantoffsiterate` | `numeric` | Consultant offsite rate |
| `consultantonsiterate` | `numeric` | Consultant onsite rate |
| `contingentdays` | `numeric` | Contingent-day basis |
| `targetmargin` | `numeric` | Target margin |
| `marginrate` | `numeric` | Margin rate |
| `currencycategoryid` | `integer` | Currency category |
| `ratecurrencyid` | `character varying` | Currency reference |
| `createdat` | `timestamp with time zone` | Created timestamp |
| `updatedat` | `timestamp with time zone` | Updated timestamp |
| `deletionflag` | `timestamp with time zone` | Soft-delete marker |

## DemandRequirement

| Column (physical) | Type | Usage |
|---|---|---|
| `id` | `character varying` | Requirement primary key |
| `demandid` | `character varying` | Linked demand |
| `tenantid` | `character varying` | Tenant scope |
| `categoryid` | `integer` | Requirement category |
| `filtercategoryid` | `integer` | Filter mode (default/soft/hard) |
| `roleid` | `character varying` | Role key |
| `skillid` | `character varying` | Skill key |
| `customroleid` | `character varying` | Custom role key |
| `rolealiasid` | `character varying` | Role alias |
| `skillaliasid` | `character varying` | Skill alias |
| `industryid` | `character varying` | Industry key |
| `functionalareaid` | `character varying` | Functional area key |
| `languageid` | `character varying` | Language key |
| `languagelevelid` | `integer` | Required language level |
| `score` | `integer` | Required score |
| `dynamicweight` | `numeric` | Weight used in scoring |
| `roleweight` | `integer` | Role-skill multiplier |
| `isactive` | `numeric` | Active flag |
| `isnicetohave` | `numeric` | Nice-to-have flag |
| `hasmissingkeys` | `numeric` | Invalid/missing key flag |
| `createdat` | `timestamp with time zone` | Created timestamp |
| `updatedat` | `timestamp with time zone` | Updated timestamp |

## DemandConsultants

| Column (physical) | Type | Usage |
|---|---|---|
| `id` | `character varying` | Link row primary key |
| `demandid` | `character varying` | Linked demand |
| `consultantid` | `character varying` | Linked consultant |
| `tenantid` | `character varying` | Tenant scope |
| `statusid` | `integer` | Assignment status |
| `candidatestageid` | `integer` | Candidate stage |
| `rate` | `numeric` | Candidate rate |
| `matchingscore` | `numeric` | Matching score |
| `customrolesmatchingscore` | `numeric` | Custom-role score |
| `matchingscoreskills` | `numeric` | Skill-focused score |
| `matchingscorestrict` | `numeric` | Strict score mode |
| `matchingscorehybrid` | `numeric` | Hybrid score mode |
| `createdat` | `timestamp with time zone` | Created timestamp |
| `updatedat` | `timestamp with time zone` | Updated timestamp |
