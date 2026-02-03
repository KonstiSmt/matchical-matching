# Query Conventions (OutSystems ODC)

## Syntax
- Entity/attribute syntax: `{EntityName}.[AttributeName]`.
- Parameters: `@ParamName`.
- List parameters are expanded inline (use directly in `IN (@Param)` clauses).
- No trailing semicolons.
- No dash comments in SQL; use block comments instead.
- Use `@Nulldate` for null date sentinel values when applicable.

## Performance
- Optimize for index usage (TenantId-first composite indexes when relevant).
- Minimize row explosion in joins.

## Naming Conventions
- Use descriptive aliases (avoid one-letter aliases).
- Output columns should not be plain `Id`; use `ConsultantId`, `DemandId`, etc.

## JSON Output Conventions
- JSON output columns end with `Json`.
- Use `COALESCE(json_agg(...), NULL)` (do not use empty array defaults).
- Output order:
  1. Data columns
  2. JSON columns
  3. NULL placeholder columns (always at end)

## LocaleDict Pattern
- Join `LocaleDict` via `NameLocaleKeyId` and `@SystemLanguage` when needed:
  - `LEFT JOIN {LocaleDict} name_locale ON name_locale.[LocaleKeyId] = {Entity}.[NameLocaleKeyId] AND name_locale.[LanguageId] = @SystemLanguage`

## Editing Rules
- Provide full-length queries when editing.
- Changes must be surgical.
- Never change column order without explicit request.
- When output changes, update the corresponding output example file.
