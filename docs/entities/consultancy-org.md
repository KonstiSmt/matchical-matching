# Consultancy Org Entities

For complete physical schema, see:
- `docs/entities/modules/consultancy-org.json`
- `docs/entities/modules/matching-core.json`
- `docs/entities/modules/auth-permissions-privacy.json`

## ConsultancyUserClosure

| Column (physical) | Type | Usage |
|---|---|---|
| `id` | `character varying` | Row key |
| `tenantid` | `character varying` | Tenant scope |
| `ancestorid` | `character varying` | Led user in reporting relation |
| `descendantid` | `character varying` | Lead user in reporting relation |
| `depth` | `integer` | Hierarchy distance |
| `distance` | `integer` | Additional hierarchy distance field |
| `consultancyuserid` | `character varying` | Related consultancy user |
| `leadconsultancyuserid` | `character varying` | Lead marker reference |

Important semantics for permission checks:
- This closure uses nonstandard naming compared to typical tree terminology.
- `descendantid` is the lead or manager side.
- `ancestorid` is the led or report side.
- Self rows with `depth = 0` exist and represent user-to-self linkage.
- To verify `MyReports` for current user against affected user, use:
  - `closure.[AncestorId] = affected_user`
  - `closure.[DescendantId] = current_user`

## ConsultancyUserRoles

| Column (physical) | Type | Usage |
|---|---|---|
| `id` | `character varying` | Row key |
| `tenantid` | `character varying` | Tenant scope |
| `consultancyuserid` | `character varying` | Linked consultancy user |
| `userroleid` | `character varying` | Linked role |

## UserRole and UserRolePermissions

| Entity | Key Columns | Usage |
|---|---|---|
| `UserRole` | `id`, `tenantid`, `issuperadmin` | Role identity and super admin flag |
| `UserRolePermissions` | `userroleid`, `permissionid`, `permissionlevelid`, `permissionmethodid`, `tenantid` | Role permission assignments |

Permission evaluation reference:
- `issuperadmin = 1` grants immediately.
- `permissionlevelid` is the scope decision input for list or detail checks.
- `permissionmethodid` is relevant for data permissions and ignored for operation permissions.
