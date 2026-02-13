# Experience Entity

## Experience
Pre-calculated skill/experience scores per consultant per category.

| Attribute | Type | Description |
|-----------|------|-------------|
| `Id` | GUID | Primary key |
| `ConsultantId` | GUID | FK to Consultant |
| `TenantId` | GUID | Tenant isolation |
| `CategoryId` | GUID | Category (see below) |
| `RoleId` | GUID | Key for RoleSkill/Role categories |
| `SkillId` | GUID | Key for RoleSkill, CustomRoleSkill, Skill, and CustomSkill categories |
| `CustomRoleId` | GUID | Key for CustomRoleSkill/CustomRole categories |
| `IndustryId` | GUID | Key for Industry category |
| `FunctionalAreaId` | GUID | Key for FunctionalArea category |
| `LanguageId` | GUID | Key for Language category |
| `Score` | Integer | Pre-calculated experience score (1-5, or 1-6 for languages) |

### Relationships
- → Consultant (via ConsultantId)
- → Category (via CategoryId)

---

## Experience Categories

The `CategoryId` determines which key fields are relevant:

| Category | Relevant Keys | Score Range |
|----------|---------------|-------------|
| RoleSkill | `RoleId`, `SkillId` | 1-5 |
| Role | `RoleId` | 1-5 |
| CustomRoleSkill | `CustomRoleId`, `SkillId` | 1-5 |
| CustomRole | `CustomRoleId` | 1-5 |
| Skill | `SkillId` | 1-5 |
| CustomSkill | `SkillId` | 1-5 |
| Industry | `IndustryId` | 1-5 |
| FunctionalArea | `FunctionalAreaId` | 1-5 |
| Language | `LanguageId` | 1-6 |

---

## Scoring Logic

Experience scores are matched against DemandRequirement scores:

- **Full score**: If `Experience.Score >= DemandRequirement.Score`
- **Partial score**: If below required, proportional: `(ExperienceScore / RequiredScore) * Weight`

### Weight Calculation by Category

| Category | Weight Formula |
|----------|----------------|
| RoleSkill | `DynamicWeight * RoleWeight` |
| All others | `DynamicWeight * 100.0` |

---

## Language Levels (Score 1-6)

| Score | Level |
|-------|-------|
| 1 | Beginner |
| 2 | Elementary |
| 3 | Intermediate |
| 4 | Advanced |
| 5 | Proficient |
| 6 | Native |
