# Consultant Entities

This file keeps query-relevant fields for consultant matching.
For complete physical schemas, see:
- `docs/entities/modules/matching-core.json`
- `docs/entities/modules/consultancy-org.json`

## Consultant

| Column (physical) | Type | Usage |
|---|---|---|
| `id` | `character varying` | Consultant primary key |
| `tenantid` | `character varying` | Tenant scope |
| `consultancyuserid` | `character varying` | Internal identity link |
| `externaluserid` | `character varying` | External identity link |
| `isinternal` | `numeric` | Internal vs external consultant |
| `isactive` | `numeric` | Active record flag |
| `isready` | `numeric` | Matching-ready flag |
| `statusid` | `integer` | Consultant status |
| `toproleid` | `character varying` | Top role |
| `topcustomroleid` | `character varying` | Top custom role |
| `eurofixedrate` | `numeric` | Rate for margin/score calculations |
| `ratecurrencyid` | `character varying` | Currency reference |
| `availabilitycategoryid` | `integer` | Availability category |
| `availablefrom` | `timestamp with time zone` | Availability start |
| `availableto` | `timestamp with time zone` | Availability end |
| `availabledaysperweek` | `numeric` | Availability capacity per week |
| `mincapacity` | `integer` | Minimum assignable capacity |
| `maxcapacity` | `integer` | Maximum assignable capacity |
| `iswillingtotravel` | `numeric` | Travel preference |
| `worksonlyremote` | `numeric` | Remote-only preference |
| `nextavailabiltydate` | `timestamp with time zone` | Next availability date |
| `createdat` | `timestamp with time zone` | Created timestamp |
| `updatedat` | `timestamp with time zone` | Last update timestamp |

## ConsultancyUser

| Column (physical) | Type | Usage |
|---|---|---|
| `id` | `character varying` | Internal user key |
| `tenantid` | `character varying` | Tenant scope |
| `consultancyid` | `character varying` | Consultancy membership |
| `email` | `character varying` | Email |
| `firstname` | `character varying` | First name |
| `lastname` | `character varying` | Last name |
| `employmentstatusid` | `integer` | Employment status |
| `departmentid` | `character varying` | Department |
| `teamid` | `character varying` | Team |
| `legalentityid` | `character varying` | Legal entity |
| `unitid` | `character varying` | Unit |
| `defaultphotourl` | `character varying` | Default photo |
| `defaultphotourlround` | `character varying` | Default round photo |
| `photourl` | `character varying` | Profile photo |
| `photourlround` | `character varying` | Round profile photo |
| `isactive` | `numeric` | Active flag |
| `lastlogin` | `timestamp with time zone` | Last login timestamp |
| `createdat` | `timestamp with time zone` | Created timestamp |
| `updatedat` | `timestamp with time zone` | Updated timestamp |

## ExternalUser

| Column (physical) | Type | Usage |
|---|---|---|
| `id` | `character varying` | External user key |
| `tenantid` | `character varying` | Tenant scope |
| `email` | `character varying` | Email |
| `firstname` | `character varying` | First name |
| `lastname` | `character varying` | Last name |
| `statusid` | `integer` | External user status |
| `companyid` | `character varying` | Linked company |
| `partnerid` | `character varying` | Linked partner |
| `isactive` | `numeric` | Active flag |
| `isfreelancer` | `numeric` | Freelancer flag |
| `ispermanent` | `numeric` | Permanent flag |
| `istemporary` | `numeric` | Temporary flag |
| `defaultphotourl` | `character varying` | Default photo |
| `defaultphotourlround` | `character varying` | Default round photo |
| `createdat` | `timestamp with time zone` | Created timestamp |
| `updatedat` | `timestamp with time zone` | Updated timestamp |
