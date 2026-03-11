# Frontend Database Access

This note captures the query conventions for the frontend database access layer used in Matchical UI tooling.
It is separate from OutSystems ODC Advanced SQL because the syntax and runtime behavior differ.

## Scope

- Use this guide when the user asks for a query for the frontend DB access layer, DBAccess, or RunSelect-style access.
- Do not save one-off inspection queries in the repository unless the user explicitly asks for a reusable documented example.
- Keep long-lived syntax notes and verified limitations here instead of `docs/knowledge-base/`.

## Syntax Differences vs Advanced SQL

### Entity and attribute access

Use `@Entity.attribute`:

```sql
SELECT @LocaleDict.textvalue
FROM @LocaleDict
WHERE @LocaleDict.localekeyid = 'e2805525-5ac3-4254-8ceb-9f22107305f4'
```

Do not use Advanced SQL entity syntax here:

```sql
{LocaleDict}.[TextValue]
```

### Joins

Join with `@Entity` names directly:

```sql
SELECT
  @Consultant.id AS ConsultantId,
  @LocaleDict.textvalue AS ManagementSummaryText
FROM @Consultant
INNER JOIN @LocaleDict
  ON @LocaleDict.localekeyid = @Consultant.excecsummaryhtmllocalekeyid
 AND @LocaleDict.tenantid = @Consultant.tenantid
```

### Derived output values

Keep expressions simple and explicit. For example, build consultant detail links with `concat(...)`:

```sql
concat(
  'https://app.matchical.com/Consulting/ConsultantDetail?ConsultantId=',
  @Consultant.id
) AS ConsultantLink
```

## Verified Limitation: Pattern Matching on Text

In this frontend access layer, pattern-matching operators such as `LIKE` can fail against text columns because of nondeterministic collations in the DBAccess / RunSelect runtime.

Runtime error example:

```text
The query uses a pattern-matching operator (LIKE, ILIKE, SIMILAR, ...)
with nondeterministic collations, in which these operators are not supported.
Use the caseaccent_normalize function provided by OutSystems to overcome this limitation.
```

### Workaround

When filtering localized text such as `@LocaleDict.textvalue`, normalize both sides and force the column side to `collate "default"`:

```sql
WHERE caseaccent_normalize(@LocaleDict.textvalue collate "default")
      LIKE caseaccent_normalize('%$$FULLNAME$$%')
```

### Practical rule

- Do not use raw `LIKE` / `ILIKE` directly on text columns in this layer when the runtime can apply nondeterministic collation.
- Prefer the `caseaccent_normalize(... collate "default")` pattern shown above for substring searches.

## Current Verified Example

This pattern worked for checking unresolved `$$FULLNAME$$` placeholders inside consultant management summaries:

```sql
SELECT
  @Consultant.id AS ConsultantId,
  @Consultant.tenantid AS TenantId,
  @Consultancy.name AS ConsultancyName,
  concat('https://app.matchical.com/Consulting/ConsultantDetail?ConsultantId=', @Consultant.id) AS ConsultantLink,
  @Consultant.excecsummaryhtmllocalekeyid AS ExcecSummaryHtmlLocaleKeyId,
  @LocaleDict.id AS LocaleDictId,
  @LocaleDict.languageid AS LanguageId,
  @LocaleDict.textvalue AS ManagementSummaryText
FROM @Consultant
LEFT JOIN @Consultancy
  ON @Consultancy.tenantid = @Consultant.tenantid
INNER JOIN @LocaleDict
  ON @LocaleDict.localekeyid = @Consultant.excecsummaryhtmllocalekeyid
 AND @LocaleDict.tenantid = @Consultant.tenantid
WHERE @Consultant.excecsummaryhtmllocalekeyid IS NOT NULL
  AND caseaccent_normalize(@LocaleDict.textvalue collate "default")
      LIKE caseaccent_normalize('%$$FULLNAME$$%')
ORDER BY @Consultancy.name, @Consultant.id, @LocaleDict.languageid
```

## Maintenance

- Add new verified syntax rules and runtime limitations here when they are discovered in real usage.
- Keep this file focused on frontend DB access behavior, not general business concepts or ad hoc result sets.
