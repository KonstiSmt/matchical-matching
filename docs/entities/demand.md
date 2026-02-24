# Demand Entities

## Demand
A staffing request to be matched against consultants.

| Attribute | Type | Description |
|-----------|------|-------------|
| `Id` | GUID | Primary key |
| `TenantId` | GUID | Tenant isolation |
| `NameLocaleKeyId` | GUID | FK to LocaleDict (demand name, translatable) |
| `OpportunityId` | GUID | FK to Opportunity (linked opportunity) |
| `LocationTagId` | GUID | FK to LocationTag (desired location) |
| `LocationFilterCategoryId` | GUID | Location filter: Default/Soft/Hard |
| `AvailabilityFilterCategoryId` | GUID | Availability filter: Default/Soft/Hard |
| `IsCapacityFilterActive` | Boolean | Capacity filtering enabled |
| `Capacity` | Decimal | Required capacity |
| `StartDate` | Date | Demand start date |
| `ClientOffsiteRate` | Decimal | Rate for price-performance threshold |
| `ContingentDays` | Integer | Contingent days for margin calculation |

### Relationships
- → LocaleDict (via NameLocaleKeyId)
- → Opportunity (via OpportunityId)
- → LocationTag (via LocationTagId)
- → Category (via LocationFilterCategoryId)
- → Category (via AvailabilityFilterCategoryId)
- ← DemandRequirement (via DemandId)
- ← DemandConsultants (via DemandId)

---

## DemandRequirement
Individual requirement line for a demand (skills, roles, industries, etc.).

| Attribute | Type | Description |
|-----------|------|-------------|
| `Id` | GUID | Primary key |
| `DemandId` | GUID | FK to Demand |
| `TenantId` | GUID | Tenant isolation |
| `CategoryId` | GUID | Category: RoleSkill, Role, CustomRoleSkill, CustomRole, Industry, FunctionalArea, Language |
| `RoleId` | GUID | Key for RoleSkill/Role categories (Experience matching) |
| `SkillId` | GUID | Key for RoleSkill categories (Experience matching) |
| `CustomRoleId` | GUID | Key for CustomRoleSkill/CustomRole categories |
| `SkillAliasId` | GUID | FK to SkillAlias (for RoleSkill category display name) |
| `RoleAliasId` | GUID | FK to RoleAlias (for Role category display name) |
| `IndustryId` | GUID | Key for Industry category |
| `FunctionalAreaId` | GUID | Key for FunctionalArea category |
| `LanguageId` | GUID | Key for Language category |
| `Score` | Integer | Required score (1-5) |
| `DynamicWeight` | Decimal | Weight for scoring |
| `RoleWeight` | Integer | Additional weight multiplier (RoleSkill only) |
| `FilterCategoryId` | GUID | Filter type: Default, Soft, Hard |
| `IsActive` | Boolean | Requirement is active |
| `HasMissingKeys` | Boolean | Requirement has invalid/missing keys |
| `IsNiceToHave` | Boolean | True if nice-to-have, false if must-have |

### Relationships
- → Demand (via DemandId)
- → Category (via CategoryId, FilterCategoryId)
- → SkillAlias (via SkillAliasId)
- → RoleAlias (via RoleAliasId)
- → CustomRole (via CustomRoleId)
- → Industry (via IndustryId)
- → FunctionalArea (via FunctionalAreaId)
- → Language (via LanguageId)

---

## DemandConsultants
Junction table linking consultants assigned to demands.

| Attribute | Type | Description |
|-----------|------|-------------|
| `Id` | GUID | Primary key |
| `DemandId` | GUID | FK to Demand |
| `ConsultantId` | GUID | FK to Consultant |
| `TenantId` | GUID | Tenant isolation |
| `CreatedAt` | DateTime | Timestamp when assigned |
| `UpdatedAt` | DateTime | Timestamp of last update |
| `MatchingScore` | Decimal | Score at time of assignment |
| `CustomRolesMatchingScore` | Decimal | Custom roles score |
| `Rate` | Decimal | Rate for this assignment |
| `CandidateStageId` | GUID | FK to CandidateStage |
| `StatusId` | GUID | FK to Status |

### Relationships
- → Demand (via DemandId)
- → Consultant (via ConsultantId)
- → Status (via StatusId)
- → CandidateStage (via CandidateStageId)
