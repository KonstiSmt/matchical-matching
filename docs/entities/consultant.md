# Consultant Entities

## Consultant
Primary entity representing a consultant (internal or external).

| Attribute | Type | Description |
|-----------|------|-------------|
| `Id` | GUID | Primary key |
| `TenantId` | GUID | Tenant isolation |
| `IsInternal` | Boolean | Internal (ConsultancyUser) vs external (ExternalUser) |
| `ConsultancyUserId` | GUID | FK to ConsultancyUser (when IsInternal=1) |
| `ExternalUserId` | GUID | FK to ExternalUser (when IsInternal=0) |
| `StatusId` | GUID | FK to Status (for matching eligibility: IsReady, IsActive) |
| `TopRoleId` | GUID | FK to Role (consultant's primary role, for display) |
| `TopCustomRoleId` | GUID | FK to CustomRole (when custom roles active) |
| `EuroFixedRate` | Decimal | Rate for price-performance calculation |
| `AvailabilityCategoryId` | GUID | FK to Category for availability status (Yes/No/Unknown) |
| `AvailableFrom` | Date | Start date of availability period |
| `AvailableTo` | Date | End date of availability period |
| `AvailableDaysPerWeek` | Decimal | Days available per week (e.g., 4.5) |
| `IsWillingToTravel` | Boolean | Willingness to travel |
| `MinCapacity`, `MaxCapacity` | Decimal | Capacity range |

### Relationships
- → ConsultancyUser (via ConsultancyUserId, when IsInternal=1)
- → ExternalUser (via ExternalUserId, when IsInternal=0)
- → Status (via StatusId)
- → Role (via TopRoleId)
- → CustomRole (via TopCustomRoleId)
- → Category (via AvailabilityCategoryId)

---

## ConsultancyUser
Identity fields for internal consultants.

| Attribute | Type | Description |
|-----------|------|-------------|
| `Id` | GUID | Primary key |
| `Email` | Text | Email address |
| `FirstName` | Text | First name |
| `LastName` | Text | Last name |
| `DefaultPhotoUrl` | Text | Photo URL |
| `DefaultPhotoUrlRound` | Text | Round photo URL (preferred) |
| `EmploymentStatusId` | GUID | FK to Status (for display: employment status label) |

### Relationships
- ← Consultant (via ConsultancyUserId)
- → Status (via EmploymentStatusId)

---

## ExternalUser
Identity fields for external consultants.

| Attribute | Type | Description |
|-----------|------|-------------|
| `Id` | GUID | Primary key |
| `Email` | Text | Email address |
| `FirstName` | Text | First name |
| `LastName` | Text | Last name |
| `DefaultPhotoUrl` | Text | Photo URL |
| `DefaultPhotoUrlRound` | Text | Round photo URL (preferred) |

### Relationships
- ← Consultant (via ExternalUserId)

**Note:** ExternalUser does NOT have EmploymentStatusId (only internal consultants have employment status).
