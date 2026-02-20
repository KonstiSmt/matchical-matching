# Query Development Rules

## OutSystems ODC Advanced SQL Syntax

**Entity/attribute syntax:**
```sql
{EntityName}.[AttributeName]
-- Example: {Consultant}.[Id], {DemandRequirement}.[FilterCategoryId]
```

**Parameters:** `@ParamName`

**List parameters (Expand Inline):** Use directly in IN clause:
```sql
WHERE consultant.[Id] IN (@ConsultantIds)
```
Do NOT use `STRING_TO_ARRAY` or `UNNEST`. It's already expanded SQL.

**CRITICAL: No trailing semicolon.** ODC Advanced SQL fails with trailing `;`.

**CRITICAL: No dashes in comments.** Use underscores:
```sql
/* _____________ Good _____________ */
/* ------------- Bad ------------- */
```

**Booleans:** `0/1` integers. Use `= 1` and `<> 1`.

**Null dates:** Use standard SQL `IS NULL` / `IS NOT NULL` checks.

**ID typing contract (critical):**
- Business/entity IDs are GUIDs (text/varchar in SQL), not integers.
- Only static entity identifiers (for example Category, Status) are integer/long integer.
- In `UNION` branches, never force GUID key columns with `CAST(NULL AS INTEGER)`; use untyped `NULL` or cast to the matching GUID/text type.

---

## Performance

**Performance is critical for all queries.** Always consider:
- Index usage (TenantId-first composite indexes)
- Query plan efficiency
- Minimizing row explosion in JOINs

## Tenant Filtering Scope

- Apply tenant filtering once on the query root entity.
- Do not repeat tenant filters on downstream joins unless a specific use case explicitly requires it.

---

## Naming Conventions

**Always use descriptive aliases:**

| Bad | Good |
|-----|------|
| `r` | `requirement` |
| `c` | `consultant` |
| `d` | `demand` |
| `e` | `experience` |

**Output columns:** Never use plain `Id`. Use `ConsultantId`, `DemandId`, etc.

---

## JSON Output Conventions

**Column naming:** Suffix JSON columns with `Json` (e.g., `TopMatchesJson`).

**NULL placeholders:** For OutSystems structure definition, include NULL placeholder columns.

**Output order:**
1. Data columns
2. JSON columns
3. NULL placeholder columns (always at END)

**COALESCE:** Use `NULL` fallback, never empty array:
```sql
/* Correct */
SELECT COALESCE(json_agg(...), NULL) AS FieldJson

/* Wrong */
SELECT COALESCE(json_agg(...), '[]'::json) AS FieldJson
```

**Output examples:** Provide expanded (deserialized) examples for the placeholder columns, even if the SQL returns NULL.
This documents the intended output structure for future versions.

**Flattening rule:** Only flatten the first layer of nesting (use `FieldJson` + `Field` NULL placeholder).
Nested objects inside the JSON payload can remain nested; do not flatten sub objects.

---

## LocaleDict Pattern

Join directly to `{LocaleDict}` via `NameLocaleKeyId`:
```sql
LEFT JOIN {LocaleDict} name_locale
  ON name_locale.[LocaleKeyId] = {Entity}.[NameLocaleKeyId]
  AND name_locale.[LanguageId] = @SystemLanguage
```

---

## Editing Rules

1. Provide **full-length query** for copy/paste (no partial snippets)
2. Changes must be **surgical** - modify only what's required
3. Never change column order without explicit request
4. Never add trailing semicolon
5. When output changes, update the corresponding output example file

---

## Query Modules

| Module | Purpose |
|--------|---------|
| `matching/` | Consultant-to-demand matching queries |

See module-specific `AGENTS.md` for detailed contracts and regression checklists.
