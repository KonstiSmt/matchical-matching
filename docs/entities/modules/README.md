# Entity Modules

Chunked entity schema derived from `JSON.json` (2026-03-03).
Each file contains an array of entities with physical column names and PostgreSQL data types.

## Modules

- [`ai-processing.json`](./ai-processing.json) - 13 entities
- [`auth-permissions-privacy.json`](./auth-permissions-privacy.json) - 14 entities
- [`consultancy-org.json`](./consultancy-org.json) - 13 entities
- [`cv-export-documents.json`](./cv-export-documents.json) - 8 entities
- [`engagement-delivery.json`](./engagement-delivery.json) - 17 entities
- [`localization-content.json`](./localization-content.json) - 11 entities
- [`matching-core.json`](./matching-core.json) - 15 entities
- [`platform-ops.json`](./platform-ops.json) - 13 entities
- [`reference-taxonomy.json`](./reference-taxonomy.json) - 31 entities
- [`sales-opportunity.json`](./sales-opportunity.json) - 6 entities

## Notes

- Column names are stored as physical database column names (lowercase), matching the provided JSON source.
- `ODCEntity`, `ODCEntityColumn`, and `StoredQuery` appeared twice in source; they were deduplicated by entity name.
- Use [entity-index.md](./entity-index.md) to quickly locate the module file for any entity.
