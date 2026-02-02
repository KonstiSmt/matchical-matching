# Location Entities

## LocationTag
Location hierarchy node (city, region, country, etc.).

| Attribute | Type | Description |
|-----------|------|-------------|
| `Id` | GUID | Primary key |
| `NameLocaleKeyId` | GUID | FK to LocaleDict for localized name |
| `CategoryId` | GUID | FK to Category (location type: city, region, country) |

### Relationships
- → LocaleDict (via NameLocaleKeyId) - for localized name
- → Category (via CategoryId) - for location type and color
- ← LocationTagsClosure (as Ancestor or Descendant)
- ← ConsultantLocations (via LocationTagId)

---

## LocationTagsClosure
Closure table for location hierarchy (ancestor/descendant relationships).

| Attribute | Type | Description |
|-----------|------|-------------|
| `AncestorId` | GUID | FK to LocationTag (parent in hierarchy) |
| `DescendantId` | GUID | FK to LocationTag (child in hierarchy) |

### Usage
Used to determine location containment:
- **Consultant within Demand**: Consultant location is descendant of demand location
- **Consultant covers Demand**: Consultant location is ancestor of demand location

```sql
/* Check if consultant location is within demand location */
JOIN {LocationTagsClosure} closure
  ON closure.[AncestorId] = demand.LocationTagId
  AND closure.[DescendantId] = consultant_location.[LocationTagId]
```

---

## ConsultantLocations
Junction table linking consultants to their available locations.

| Attribute | Type | Description |
|-----------|------|-------------|
| `ConsultantId` | GUID | FK to Consultant |
| `LocationTagId` | GUID | FK to LocationTag |

### Relationships
- → Consultant (via ConsultantId)
- → LocationTag (via LocationTagId)

### Usage
A consultant can have multiple locations. Location matching checks if any consultant location satisfies the demand location filter.
