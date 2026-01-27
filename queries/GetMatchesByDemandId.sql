/* GetMatchesByDemandId – Advanced SQL (Aurora Postgres, ODC)
   Purpose: return consultant matches for a demand with scoring, paging, and filters.

   Updates in this version:
     • Count is capped using @CountCap (no full window COUNT over all rows)
     • CleanedStartDate is computed once in CTE d and reused
     • Scoring uses DOUBLE PRECISION

   Output columns (ordered):
     Id, MatchingScore, PricePerformanceScore, Email, Name, FirstName, LastName, PhotoUrl, EuroFixedRate, Count
*/

WITH
/* ------------- Demand context (single row) ------------- */
d AS (
  SELECT
    {Demand}.[Id]                           AS DemandId,
    {Demand}.[TenantId]                     AS TenantId,
    {Demand}.[LocationTagId]                AS LocationTagId,
    {Demand}.[LocationFilterCategoryId]     AS LocFilter,         -- Default / Soft / Hard
    {Demand}.[AvailabilityFilterCategoryId] AS AvailFilter,       -- Default / Soft / Hard
    {Demand}.[IsCapacityFilterActive]       AS IsCapacityFilterActive,
    {Demand}.[Capacity]                     AS Capacity,
    {Demand}.[StartDate]                    AS StartDate,
    /* Clean once, reuse everywhere */
    CASE
      WHEN {Demand}.[StartDate] = @Nulldate THEN @Nulldate
      WHEN {Demand}.[StartDate] < CURRENT_DATE THEN CURRENT_DATE
      ELSE {Demand}.[StartDate]
    END                                      AS CleanedStartDate,
    {Demand}.[ExperienceFilterCount]        AS ExperienceFilterCount,
    {Demand}.[ClientOffsiteRate]            AS ClientOffsiteRate,
    {Demand}.[OnlyShowFreelancer]           AS OnlyShowFreelancer,
    {Demand}.[OnlyShowTemporary]            AS OnlyShowTemporary,
    {Demand}.[OnlyShowPermanent]            AS OnlyShowPermanent
  FROM {Demand}
  WHERE {Demand}.[Id] = @DemandId
    AND {Demand}.[TenantId] = @TenantId
),

/* ------------- Requirements (valid only) ------------- */
req AS (
  SELECT
    r.[CategoryId],
    r.[RoleId],
    r.[SkillId],
    r.[IndustryId],
    r.[FunctionalAreaId],
    r.[LanguageId],
    r.[Score]            AS ReqScore,
    r.[DynamicWeight],
    r.[RoleWeight],
    r.[FilterCategoryId] AS FilterCat,
    r.[TenantId]
  FROM {DemandRequirement} r
  WHERE r.[DemandId] = @DemandId
    AND r.[TenantId]  = @TenantId
    AND r.[IsActive]  = 1
    AND NOT (r.[HasMissingKeys] = 1)
),

/* ------------- Eligible consultants (prefilter) ------------- */
ec AS (
  SELECT c.[Id] AS ConsultantId
  FROM {Consultant} c
  JOIN {Status} s
    ON s.[Id] = c.[StatusId]
  CROSS JOIN d
  WHERE
    /* Tenant & status-based readiness/active */
    c.[TenantId] = d.TenantId
    AND s.[IsReady] = 1
    AND s.[IsActive] = 1

    /* Internal/External visibility selector */
    AND (
          (NOT (@IsInExternalFilterActive = 1))
          OR (@ShowInternal = c.[IsInternal])
          OR (@ShowExternal <> c.[IsInternal])
        )

    /* "Not Available" status: when availability filter is NOT Default, exclude such consultants */
    AND (
          d.AvailFilter = @Filter_Default
          OR c.[StatusId] <> @Status_NotAvailable
        )

    /* Contract-type filter (applies to everyone when any demand flag is true) */
    AND (
          /* No flags selected → ignore contract type entirely */
          (d.OnlyShowFreelancer <> 1 AND d.OnlyShowTemporary <> 1 AND d.OnlyShowPermanent <> 1)

          /* One or more flags selected → keep only externals matching at least one selected type.
             Internals have no types → will not satisfy this EXISTS and are excluded. */
          OR EXISTS (
               SELECT 1
               FROM {ExternalUser} eu_ct
               WHERE eu_ct.[Id] = c.[ExternalUserId]
                 AND (
                      (d.OnlyShowFreelancer = 1 AND eu_ct.[IsFreelancer] = 1) OR
                      (d.OnlyShowTemporary  = 1 AND eu_ct.[IsTemporary]  = 1) OR
                      (d.OnlyShowPermanent  = 1 AND eu_ct.[IsPermanent]  = 1)
                 )
          )
        )

    /* Location constraint driven by demand.LocationFilterCategoryId */
    AND (
          /* Default: no location filtering OR missing demand location */
          d.LocFilter = @Filter_Default
          OR d.LocationTagId IS NULL

          /* Hard: consultant contained in demand (demand ancestor/equal of consultant) */
          OR (
               d.LocFilter = @Filter_Hard
               AND EXISTS (
                     SELECT 1
                     FROM {ConsultantLocations} cl_h
                     JOIN {LocationTagsClosure} lc_h
                       ON lc_h.[AncestorId]   = d.LocationTagId       -- demand node
                      AND lc_h.[DescendantId] = cl_h.[LocationTagId]  -- consultant node (equal or more specific)
                     WHERE cl_h.[ConsultantId] = c.[Id]
                   )
             )

          /* Soft: contained OR covering (bidirectional) */
          OR (
               d.LocFilter = @Filter_Soft
               AND (
                    /* consultant contained in demand */
                    EXISTS (
                      SELECT 1
                      FROM {ConsultantLocations} cl_u
                      JOIN {LocationTagsClosure} lc_u
                        ON lc_u.[AncestorId]   = d.LocationTagId
                       AND lc_u.[DescendantId] = cl_u.[LocationTagId]
                      WHERE cl_u.[ConsultantId] = c.[Id]
                    )
                    OR
                    /* consultant covers demand */
                    EXISTS (
                      SELECT 1
                      FROM {ConsultantLocations} cl_d
                      JOIN {LocationTagsClosure} lc_d
                        ON lc_d.[AncestorId]   = cl_d.[LocationTagId]
                       AND lc_d.[DescendantId] = d.LocationTagId
                      WHERE cl_d.[ConsultantId] = c.[Id]
                    )
                  )
             )
        )

    /* Availability using d.CleanedStartDate + NullDate sentinel */
    AND (
          (d.AvailFilter = @Filter_Default)
          OR (c.[IsImmediatelyAvailable] = 1)
          OR (
               /* CleanedStartDate >= NextAvailabilityDate and NextAvailabilityDate != NullDate */
               d.CleanedStartDate >= c.[NextAvailabiltyDate]
             AND c.[NextAvailabiltyDate] <> @Nulldate
             )
          OR (
               /* CleanedStartDate >= (today + noticePeriod) when noticePeriod != 0 */
               d.CleanedStartDate >= (CURRENT_DATE + c.[NoticePeriod])::timestamptz
             AND c.[NoticePeriod] <> 0
             )
          OR (
               d.AvailFilter = @Filter_Soft
               AND (
                     (
                       /* (today + 60) >= NextAvailabilityDate and != NullDate */
                       (CURRENT_DATE + 60)::timestamptz >= c.[NextAvailabiltyDate]
                       AND c.[NextAvailabiltyDate] <> @Nulldate
                     )
                     OR
                     (
                       /* CleanedStartDate >= (today + (noticePeriod - 60)) when noticePeriod != 0 */
                       d.CleanedStartDate >= (CURRENT_DATE + (c.[NoticePeriod] - 60))::timestamptz
                       AND c.[NoticePeriod] <> 0
                     )
                   )
             )
        )

    /* Capacity (only when active) */
    AND (
          (NOT (d.IsCapacityFilterActive = 1))
          OR (d.Capacity >= c.[MinCapacity] AND d.Capacity <= c.[MaxCapacity])
        )
),

/* ------------- Category branches with computed partial_score (DOUBLE PRECISION) ------------- */

/* RoleSkill: match (RoleId, SkillId) */
b_roleskill AS (
  SELECT * FROM (
    SELECT
      e.[ConsultantId] AS ConsultantId,
      CAST(
        CASE
          WHEN r.ReqScore = 0 THEN 0
          ELSE
            (
              CASE
                WHEN e.[Score] >= r.ReqScore THEN r.[DynamicWeight]
                ELSE r.[DynamicWeight] * (CAST(e.[Score] AS DOUBLE PRECISION) / CAST(r.ReqScore AS DOUBLE PRECISION))
              END
            ) * CAST(r.[RoleWeight] AS DOUBLE PRECISION)
        END
      AS DOUBLE PRECISION) AS partial_score,
      CASE
        WHEN r.FilterCat = @Filter_Soft THEN CAST((e.[Score] = 0) AS INT)
        WHEN r.FilterCat = @Filter_Hard THEN CAST((e.[Score] < r.ReqScore) AS INT)
        ELSE 0
      END AS excl_partial,
      CAST((r.FilterCat IS NOT NULL AND r.FilterCat <> @Filter_Default) AS INT) AS has_filter_partial
    FROM req r
    JOIN {Experience} e
      ON e.[TenantId] = r.[TenantId]
     AND e.[CategoryId] = @Cat_RoleSkill
     AND r.[CategoryId] = @Cat_RoleSkill
     AND e.[RoleId]  = r.[RoleId]
     AND e.[SkillId] = r.[SkillId]
    JOIN ec ON ec.ConsultantId = e.[ConsultantId]
  ) x
  WHERE x.partial_score > 0
),

/* Role: match RoleId and SkillId IS NULL on experience */
b_role AS (
  SELECT * FROM (
    SELECT
      e.[ConsultantId] AS ConsultantId,
      CAST(
        CASE
          WHEN r.ReqScore = 0 THEN 0
          ELSE
            (
              CASE
                WHEN e.[Score] >= r.ReqScore THEN r.[DynamicWeight]
                ELSE r.[DynamicWeight] * (CAST(e.[Score] AS DOUBLE PRECISION) / CAST(r.ReqScore AS DOUBLE PRECISION))
              END
            ) * 100.0
        END
      AS DOUBLE PRECISION) AS partial_score,
      CASE
        WHEN r.FilterCat = @Filter_Soft THEN CAST((e.[Score] = 0) AS INT)
        WHEN r.FilterCat = @Filter_Hard THEN CAST((e.[Score] < r.ReqScore) AS INT)
        ELSE 0
      END AS excl_partial,
      CAST((r.FilterCat IS NOT NULL AND r.FilterCat <> @Filter_Default) AS INT) AS has_filter_partial
    FROM req r
    JOIN {Experience} e
      ON e.[TenantId] = r.[TenantId]
     AND e.[CategoryId] = @Cat_Role
     AND r.[CategoryId] = @Cat_Role
     AND e.[RoleId] = r.[RoleId]
     AND e.[SkillId] IS NULL
    JOIN ec ON ec.ConsultantId = e.[ConsultantId]
  ) x
  WHERE x.partial_score > 0
),

/* Industry: match IndustryId */
b_industry AS (
  SELECT * FROM (
    SELECT
      e.[ConsultantId] AS ConsultantId,
      CAST(
        CASE
          WHEN r.ReqScore = 0 THEN 0
          ELSE
            (
              CASE
                WHEN e.[Score] >= r.ReqScore THEN r.[DynamicWeight]
                ELSE r.[DynamicWeight] * (CAST(e.[Score] AS DOUBLE PRECISION) / CAST(r.ReqScore AS DOUBLE PRECISION))
              END
            ) * 100.0
        END
      AS DOUBLE PRECISION) AS partial_score,
      CASE
        WHEN r.FilterCat = @Filter_Soft THEN CAST((e.[Score] = 0) AS INT)
        WHEN r.FilterCat = @Filter_Hard THEN CAST((e.[Score] < r.ReqScore) AS INT)
        ELSE 0
      END AS excl_partial,
      CAST((r.FilterCat IS NOT NULL AND r.FilterCat <> @Filter_Default) AS INT) AS has_filter_partial
    FROM req r
    JOIN {Experience} e
      ON e.[TenantId] = r.[TenantId]
     AND e.[CategoryId] = @Cat_Industry
     AND r.[CategoryId] = @Cat_Industry
     AND e.[IndustryId] = r.[IndustryId]
    JOIN ec ON ec.ConsultantId = e.[ConsultantId]
  ) x
  WHERE x.partial_score > 0
),

/* FunctionalArea: match FunctionalAreaId */
b_functional AS (
  SELECT * FROM (
    SELECT
      e.[ConsultantId] AS ConsultantId,
      CAST(
        CASE
          WHEN r.ReqScore = 0 THEN 0
          ELSE
            (
              CASE
                WHEN e.[Score] >= r.ReqScore THEN r.[DynamicWeight]
                ELSE r.[DynamicWeight] * (CAST(e.[Score] AS DOUBLE PRECISION) / CAST(r.ReqScore AS DOUBLE PRECISION))
              END
            ) * 100.0
        END
      AS DOUBLE PRECISION) AS partial_score,
      CASE
        WHEN r.FilterCat = @Filter_Soft THEN CAST((e.[Score] = 0) AS INT)
        WHEN r.FilterCat = @Filter_Hard THEN CAST((e.[Score] < r.ReqScore) AS INT)
        ELSE 0
      END AS excl_partial,
      CAST((r.FilterCat IS NOT NULL AND r.FilterCat <> @Filter_Default) AS INT) AS has_filter_partial
    FROM req r
    JOIN {Experience} e
      ON e.[TenantId] = r.[TenantId]
     AND e.[CategoryId] = @Cat_FunctionalArea
     AND r.[CategoryId] = @Cat_FunctionalArea
     AND e.[FunctionalAreaId] = r.[FunctionalAreaId]
    JOIN ec ON ec.ConsultantId = e.[ConsultantId]
  ) x
  WHERE x.partial_score > 0
),

/* Language: match LanguageId (no pruning by partial_score; presence-only allowed) */
b_language AS (
  SELECT
    e.[ConsultantId] AS ConsultantId,
    CAST(
      CASE
        WHEN r.ReqScore = 0 THEN 0
        ELSE
          (
            CASE
              WHEN e.[Score] >= r.ReqScore THEN r.[DynamicWeight]
              ELSE r.[DynamicWeight] * (CAST(e.[Score] AS DOUBLE PRECISION) / CAST(r.ReqScore AS DOUBLE PRECISION))
            END
          ) * 100.0
      END
    AS DOUBLE PRECISION) AS partial_score,
    CASE
      WHEN r.FilterCat = @Filter_Soft THEN CAST((e.[Score] = 0) AS INT)
      WHEN r.FilterCat = @Filter_Hard THEN CAST((e.[Score] < r.ReqScore) AS INT)
      ELSE 0
    END AS excl_partial,
    CAST((r.FilterCat IS NOT NULL AND r.FilterCat <> @Filter_Default) AS INT) AS has_filter_partial
  FROM req r
  JOIN {Experience} e
    ON e.[TenantId] = r.[TenantId]
   AND e.[CategoryId] = @Cat_Language
   AND r.[CategoryId] = @Cat_Language
   AND e.[LanguageId] = r.[LanguageId]
  JOIN ec ON ec.ConsultantId = e.[ConsultantId]
),

/* ------------- Union of all category branches ------------- */
partials AS (
  SELECT * FROM b_roleskill
  UNION ALL
  SELECT * FROM b_role
  UNION ALL
  SELECT * FROM b_industry
  UNION ALL
  SELECT * FROM b_functional
  UNION ALL
  SELECT * FROM b_language
),

/* ------------- Aggregate per consultant (no identity fields here) ------------- */
scores AS (
  SELECT
    p.ConsultantId,
    SUM(p.partial_score)        AS MatchingScore,
    MAX(p.excl_partial)         AS IsExcludedMax,
    SUM(p.has_filter_partial)   AS HasFilterSum
  FROM partials p
  GROUP BY p.ConsultantId
),

/* ------------- Keep only consultants that pass aggregate rules ------------- */
kept AS (
  SELECT s.*
  FROM scores s
  CROSS JOIN d
  WHERE NOT (
      s.IsExcludedMax = 1
      OR s.HasFilterSum <> d.ExperienceFilterCount
    )
    AND s.MatchingScore > 0
)

/* ------------- Final projection: join identity & compute price-performance ------------- */
SELECT
  /* 1) Id */
  k.ConsultantId                                                                                       AS Id,

  /* 2) MatchingScore */
  k.MatchingScore                                                                                      AS MatchingScore,

  /* 3) PricePerformanceScore (guards preserved; math in DOUBLE PRECISION) */
  (CASE
     WHEN (CAST(c.[EuroFixedRate] AS DOUBLE PRECISION) = 0.0)
          OR ((CAST(d.ClientOffsiteRate AS DOUBLE PRECISION) <> 0.0)
              AND (CAST(c.[EuroFixedRate] AS DOUBLE PRECISION) > CAST(d.ClientOffsiteRate AS DOUBLE PRECISION)))
          OR (CAST(@PricePerformanceRatio AS DOUBLE PRECISION) = 0.0)
       THEN 0
     ELSE (k.MatchingScore / NULLIF(CAST(c.[EuroFixedRate] AS DOUBLE PRECISION), 0.0))
            / NULLIF(CAST(@PricePerformanceRatio AS DOUBLE PRECISION), 0.0)
   END)                                                                                                  AS PricePerformanceScore,

  /* 4) Email */
  (CASE WHEN c.[IsInternal] = 1 THEN cu.[Email]     ELSE eu.[Email]     END)                            AS Email,

  /* 5) Name */
  ((CASE WHEN c.[IsInternal] = 1 THEN cu.[FirstName] ELSE eu.[FirstName] END)
    || ' ' ||
   (CASE WHEN c.[IsInternal] = 1 THEN cu.[LastName]  ELSE eu.[LastName]  END))                          AS Name,

  /* 6) FirstName */
  (CASE WHEN c.[IsInternal] = 1 THEN cu.[FirstName] ELSE eu.[FirstName] END)                            AS FirstName,

  /* 7) LastName */
  (CASE WHEN c.[IsInternal] = 1 THEN cu.[LastName]  ELSE eu.[LastName]  END)                            AS LastName,

  /* 8) PhotoUrl */
  (CASE WHEN c.[IsInternal] = 1 THEN COALESCE(NULLIF(cu.[DefaultPhotoUrlRound], ''), cu.[DefaultPhotoUrl])  ELSE COALESCE(NULLIF(eu.[DefaultPhotoUrlRound], ''), eu.[DefaultPhotoUrl])  END)                            AS PhotoUrl,

  /* 9) EuroFixedRate */
  c.[EuroFixedRate]                                                                                     AS EuroFixedRate,

  /* 10) Total row count, capped at @CountCap */
  (SELECT COUNT(*) FROM (SELECT 1 FROM kept LIMIT @CountCap) t)                                         AS Count

FROM kept k
JOIN {Consultant} c
  ON c.[Id] = k.ConsultantId
  AND c.[TenantId] = @TenantId
LEFT JOIN {ExternalUser} eu
  ON c.[ExternalUserId] = eu.[Id]
  AND NOT (c.[IsInternal] = 1)
LEFT JOIN {ConsultancyUser} cu
  ON c.[ConsultancyUserId] = cu.[Id]
  AND c.[IsInternal] = 1
CROSS JOIN d

ORDER BY k.MatchingScore DESC
LIMIT @MaxRecords
OFFSET @StartIndex
