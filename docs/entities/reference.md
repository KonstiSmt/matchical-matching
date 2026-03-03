# Reference Entities

This file keeps the reference entities most used in query work.
For full schemas, see:
- `docs/entities/modules/reference-taxonomy.json`
- `docs/entities/modules/localization-content.json`

## Status

| Column (physical) | Type |
|---|---|
| `id` | `integer` |
| `statuscategoryid` | `integer` |
| `label` | `character varying` |
| `labeltranslationsjson` | `character varying` |
| `isactive` | `numeric` |
| `isready` | `numeric` |
| `isresolved` | `numeric` |
| `order` | `integer` |
| `color` | `character varying` |
| `iconcode` | `character varying` |

## Category

| Column (physical) | Type |
|---|---|
| `id` | `integer` |
| `parentcategoryid` | `integer` |
| `label` | `character varying` |
| `labeltranslationsjson` | `character varying` |
| `order` | `integer` |
| `color` | `character varying` |
| `iconcode` | `character varying` |

## LanguageLevel

| Column (physical) | Type |
|---|---|
| `id` | `integer` |
| `label` | `character varying` |
| `labeltranslationsjson` | `character varying` |
| `order` | `integer` |

## Role and Skill Taxonomy

| Entity | Key columns |
|---|---|
| `Role` | `id`, `namelocalekeyid`, `statusid`, `descriptionlocalekeyid` |
| `RoleAlias` | `id`, `roleid`, `namelocalekeyid`, `statusid`, `mappedrolealiasid` |
| `RoleName` | `id`, `namelocalekeyid`, `localekeyid`, `customtenantid` |
| `CustomRole` | `id`, `rolenameid`, `tenantid`, `externalid` |
| `Skill` | `id`, `namelocalekeyid`, `statusid` |
| `SkillAlias` | `id`, `skillid`, `namelocalekeyid`, `statusid`, `mappedskillaliasid` |
| `Industry` | `id`, `namelocalekeyid` |
| `FunctionalArea` | `id`, `namelocalekeyid` |
| `Language` | `id`, `namelocalekeyid`, `statusid`, `order` |

## Localization Entities

| Entity | Key columns |
|---|---|
| `LocaleKey` | `id`, `tenantid`, `createdat` |
| `LocaleDict` | `id`, `localekeyid`, `languageid`, `textvalue`, `tenantid`, `isapproved` |
| `LongLocaleKey` | `id`, `tenantid`, `createdat` |
| `LongLocaleDict` | `id`, `longlocalekeyid`, `languageid`, `textvalue`, `tenantid` |
| `DescriptionKey` | `id`, `tenantid` |
| `DescriptionDict` | `id`, `descriptionkeyid`, `descriptionlocalekeyid`, `descriptioncategoryid`, `formatcategoryid` |
| `BulletKey` | `id`, `tenantid` |
| `BulletItem` | `id`, `bulletkeyid`, `descriptionlocalekeyid`, `descriptioncategoryid`, `formatcategoryid` |

## Join Reminder

Translatable names are mostly resolved with `*localekeyid -> LocaleDict.localekeyid`.
