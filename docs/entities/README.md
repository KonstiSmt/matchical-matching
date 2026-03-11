# Entity Reference

This directory now has two documentation layers:

1. Curated query-facing docs (`consultant.md`, `consultancy-org.md`, `demand.md`, `experience.md`, `location.md`, `reference.md`)
2. Full physical schema chunks in `modules/*.json` (derived from the latest JSON snapshot)

Snapshot date for module files: `2026-03-03`.

## Curated Query Docs

- **[consultant.md](consultant.md)** - Consultant identities and availability fields
- **[consultancy-org.md](consultancy-org.md)** - Consultancy user hierarchy, role linkage, and permission join semantics
- **[demand.md](demand.md)** - Demand and requirement structure used in matching
- **[experience.md](experience.md)** - Experience score records and matching categories
- **[location.md](location.md)** - Location hierarchy and consultant-location mapping
- **[reference.md](reference.md)** - Status/category/taxonomy/reference entities

## Full Schema Modules

- **[modules/matching-core.json](modules/matching-core.json)** - matching runtime entities
- **[modules/reference-taxonomy.json](modules/reference-taxonomy.json)** - skills/roles/categories/reference taxonomy
- **[modules/localization-content.json](modules/localization-content.json)** - locale/dictionary/content keys
- **[modules/consultancy-org.json](modules/consultancy-org.json)** - consultancy org/user structures
- **[modules/engagement-delivery.json](modules/engagement-delivery.json)** - projects/engagement delivery entities
- **[modules/sales-opportunity.json](modules/sales-opportunity.json)** - sales pipeline entities
- **[modules/cv-export-documents.json](modules/cv-export-documents.json)** - CV and document entities
- **[modules/ai-processing.json](modules/ai-processing.json)** - AI usage/parsers/prompts
- **[modules/auth-permissions-privacy.json](modules/auth-permissions-privacy.json)** - auth/permission/privacy entities
- **[modules/platform-ops.json](modules/platform-ops.json)** - platform/feature/ops/meta entities

See **[modules/README.md](modules/README.md)** for the module index and entity counts.
Use **[modules/entity-index.md](modules/entity-index.md)** to find an entity's module quickly.

## Common Patterns

### Multi-Tenancy
Most business entities include `tenantid`. Always scope by tenant in query predicates.

### Localization
Localized text commonly joins by locale key IDs (`*localekeyid`) to `LocaleDict`.

### Boolean Storage
Flags are stored as numeric values (`0/1`) in the physical schema.
