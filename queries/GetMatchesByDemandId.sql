/* GetMatchesByDemandId – Advanced SQL (Aurora Postgres, ODC)
   Purpose: return consultant matches for a demand with scoring, paging, and filters.

   Refactored version:
     • Early NOT EXISTS filter enforcement in ec CTE (consultants failing filters excluded before scoring)
     • Removed aggregate-based filter enforcement (excl_partial, has_filter_partial, IsExcludedMax, HasFilterSum)
     • Removed contract-type filter (OnlyShowFreelancer/Temporary/Permanent)
     • Removed ExperienceFilterCount dependency

   Output columns (ordered):
     Id, MatchingScore, PricePerformanceScore, Email, Name, FirstName, LastName, PhotoUrl, EuroFixedRate, Count
*/

WITH
/* ------------- Demand context (single row) ------------- */
demand AS (
  SELECT
    {Demand}.[Id]                           AS DemandId,
    {Demand}.[TenantId]                     AS TenantId,
    {Demand}.[LocationTagId]                AS LocationTagId,
    {Demand}.[LocationFilterCategoryId]     AS LocationFilter,
    {Demand}.[AvailabilityFilterCategoryId] AS AvailabilityFilter,
    {Demand}.[IsCapacityFilterActive]       AS IsCapacityFilterActive,
    {Demand}.[Capacity]                     AS Capacity,
    {Demand}.[StartDate]                    AS StartDate,
    /* Clean once, reuse everywhere */
    CASE
      WHEN {Demand}.[StartDate] = @Nulldate THEN @Nulldate
      WHEN {Demand}.[StartDate] < CURRENT_DATE THEN CURRENT_DATE
      ELSE {Demand}.[StartDate]
    END                                      AS CleanedStartDate,
    {Demand}.[ClientOffsiteRate]            AS ClientOffsiteRate
  FROM {Demand}
  WHERE {Demand}.[Id] = @DemandId
    AND {Demand}.[TenantId] = @TenantId
),

/* ------------- Requirements (valid only) ------------- */
requirement AS (
  SELECT
    req.[CategoryId],
    req.[RoleId],
    req.[SkillId],
    req.[IndustryId],
    req.[FunctionalAreaId],
    req.[LanguageId],
    req.[Score]            AS ReqScore,
    req.[DynamicWeight],
    req.[RoleWeight],
    req.[FilterCategoryId] AS FilterCategory,
    req.[TenantId]
  FROM {DemandRequirement} req
  WHERE req.[DemandId] = @DemandId
    AND req.[TenantId]  = @TenantId
    AND req.[IsActive]  = 1
    AND NOT (req.[HasMissingKeys] = 1)
),

/* ------------- Filtered requirements (Hard/Soft only) ------------- */
filtered_requirement AS (
  SELECT
    freq.[CategoryId],
    freq.[RoleId],
    freq.[SkillId],
    freq.[IndustryId],
    freq.[FunctionalAreaId],
    freq.[LanguageId],
    freq.[Score]            AS ReqScore,
    freq.[FilterCategoryId] AS FilterCategory,
    freq.[TenantId]
  FROM {DemandRequirement} freq
  WHERE freq.[DemandId] = @DemandId
    AND freq.[TenantId]  = @TenantId
    AND freq.[IsActive]  = 1
    AND NOT (freq.[HasMissingKeys] = 1)
    AND freq.[FilterCategoryId] <> @Filter_Default
),

/* ------------- Eligible consultants (prefilter + filter enforcement) ------------- */
eligible_consultant AS (
  SELECT consultant.[Id] AS ConsultantId
  FROM {Consultant} consultant
  JOIN {Status} consultant_status
    ON consultant_status.[Id] = consultant.[StatusId]
  CROSS JOIN demand
  WHERE
    /* Tenant & status-based readiness/active */
    consultant.[TenantId] = demand.TenantId
    AND consultant_status.[IsReady] = 1
    AND consultant_status.[IsActive] = 1

    /* Internal/External visibility selector */
    AND (
          (NOT (@IsInExternalFilterActive = 1))
          OR (@ShowInternal = consultant.[IsInternal])
          OR (@ShowExternal <> consultant.[IsInternal])
        )

    /* "Not Available" status: when availability filter is NOT Default, exclude such consultants */
    AND (
          demand.AvailabilityFilter = @Filter_Default
          OR consultant.[StatusId] <> @Status_NotAvailable
        )

    /* Location constraint driven by demand.LocationFilterCategoryId */
    AND (
          /* Default: no location filtering OR missing demand location */
          demand.LocationFilter = @Filter_Default
          OR demand.LocationTagId IS NULL

          /* Hard: consultant contained in demand (demand ancestor/equal of consultant) */
          OR (
               demand.LocationFilter = @Filter_Hard
               AND EXISTS (
                     SELECT 1
                     FROM {ConsultantLocations} consultant_location
                     JOIN {LocationTagsClosure} location_closure
                       ON location_closure.[AncestorId]   = demand.LocationTagId
                      AND location_closure.[DescendantId] = consultant_location.[LocationTagId]
                     WHERE consultant_location.[ConsultantId] = consultant.[Id]
                   )
             )

          /* Soft: contained OR covering (bidirectional) */
          OR (
               demand.LocationFilter = @Filter_Soft
               AND (
                    /* consultant contained in demand */
                    EXISTS (
                      SELECT 1
                      FROM {ConsultantLocations} consultant_location
                      JOIN {LocationTagsClosure} location_closure
                        ON location_closure.[AncestorId]   = demand.LocationTagId
                       AND location_closure.[DescendantId] = consultant_location.[LocationTagId]
                      WHERE consultant_location.[ConsultantId] = consultant.[Id]
                    )
                    OR
                    /* consultant covers demand */
                    EXISTS (
                      SELECT 1
                      FROM {ConsultantLocations} consultant_location
                      JOIN {LocationTagsClosure} location_closure
                        ON location_closure.[AncestorId]   = consultant_location.[LocationTagId]
                       AND location_closure.[DescendantId] = demand.LocationTagId
                      WHERE consultant_location.[ConsultantId] = consultant.[Id]
                    )
                  )
             )
        )

    /* Availability using demand.CleanedStartDate + NullDate sentinel */
    AND (
          (demand.AvailabilityFilter = @Filter_Default)
          OR (consultant.[IsImmediatelyAvailable] = 1)
          OR (
               /* CleanedStartDate >= NextAvailabilityDate and NextAvailabilityDate != NullDate */
               demand.CleanedStartDate >= consultant.[NextAvailabiltyDate]
             AND consultant.[NextAvailabiltyDate] <> @Nulldate
             )
          OR (
               /* CleanedStartDate >= (today + noticePeriod) when noticePeriod != 0 */
               demand.CleanedStartDate >= (CURRENT_DATE + consultant.[NoticePeriod])::timestamptz
             AND consultant.[NoticePeriod] <> 0
             )
          OR (
               demand.AvailabilityFilter = @Filter_Soft
               AND (
                     (
                       /* (today + 60) >= NextAvailabilityDate and != NullDate */
                       (CURRENT_DATE + 60)::timestamptz >= consultant.[NextAvailabiltyDate]
                       AND consultant.[NextAvailabiltyDate] <> @Nulldate
                     )
                     OR
                     (
                       /* CleanedStartDate >= (today + (noticePeriod - 60)) when noticePeriod != 0 */
                       demand.CleanedStartDate >= (CURRENT_DATE + (consultant.[NoticePeriod] - 60))::timestamptz
                       AND consultant.[NoticePeriod] <> 0
                     )
                   )
             )
        )

    /* Capacity (only when active) */
    AND (
          (NOT (demand.IsCapacityFilterActive = 1))
          OR (demand.Capacity >= consultant.[MinCapacity] AND demand.Capacity <= consultant.[MaxCapacity])
        )

    /* Filter requirement enforcement: consultant must satisfy ALL filtered requirements */
    AND (
          /* Fast path: if no filtered requirements exist, skip the check */
          NOT EXISTS (SELECT 1 FROM filtered_requirement)
          OR
          /* Otherwise: no filtered requirement may be unsatisfied */
          NOT EXISTS (
            SELECT 1 FROM filtered_requirement filter_req
            WHERE NOT EXISTS (
              SELECT 1 FROM {Experience} experience
              WHERE experience.[ConsultantId] = consultant.[Id]
                AND experience.[TenantId] = filter_req.[TenantId]
                AND experience.[CategoryId] = filter_req.[CategoryId]
                /* Category-specific key matching */
                AND (
                  (filter_req.[CategoryId] = @Cat_RoleSkill
                   AND experience.[RoleId] = filter_req.[RoleId]
                   AND experience.[SkillId] = filter_req.[SkillId])
                  OR (filter_req.[CategoryId] = @Cat_Role
                      AND experience.[RoleId] = filter_req.[RoleId]
                      AND experience.[SkillId] IS NULL)
                  OR (filter_req.[CategoryId] = @Cat_Industry
                      AND experience.[IndustryId] = filter_req.[IndustryId])
                  OR (filter_req.[CategoryId] = @Cat_FunctionalArea
                      AND experience.[FunctionalAreaId] = filter_req.[FunctionalAreaId])
                  OR (filter_req.[CategoryId] = @Cat_Language
                      AND experience.[LanguageId] = filter_req.[LanguageId])
                )
                /* Score condition based on filter type */
                AND (
                  (filter_req.FilterCategory = @Filter_Hard AND experience.[Score] >= filter_req.ReqScore)
                  OR (filter_req.FilterCategory = @Filter_Soft AND experience.[Score] > 0)
                )
            )
          )
        )
),

/* ------------- Category branches with computed partial_score (DOUBLE PRECISION) ------------- */

/* RoleSkill: match (RoleId, SkillId) */
branch_roleskill AS (
  SELECT
    experience.[ConsultantId] AS ConsultantId,
    CAST(
      CASE
        WHEN req.ReqScore = 0 THEN 0
        ELSE
          (
            CASE
              WHEN experience.[Score] >= req.ReqScore THEN req.[DynamicWeight]
              ELSE req.[DynamicWeight] * (CAST(experience.[Score] AS DOUBLE PRECISION) / CAST(req.ReqScore AS DOUBLE PRECISION))
            END
          ) * CAST(req.[RoleWeight] AS DOUBLE PRECISION)
      END
    AS DOUBLE PRECISION) AS partial_score
  FROM requirement req
  JOIN {Experience} experience
    ON experience.[TenantId] = req.[TenantId]
   AND experience.[CategoryId] = @Cat_RoleSkill
   AND req.[CategoryId] = @Cat_RoleSkill
   AND experience.[RoleId]  = req.[RoleId]
   AND experience.[SkillId] = req.[SkillId]
  JOIN eligible_consultant ec ON ec.ConsultantId = experience.[ConsultantId]
  WHERE req.ReqScore <> 0
    AND experience.[Score] > 0
),

/* Role: match RoleId and SkillId IS NULL on experience */
branch_role AS (
  SELECT
    experience.[ConsultantId] AS ConsultantId,
    CAST(
      CASE
        WHEN req.ReqScore = 0 THEN 0
        ELSE
          (
            CASE
              WHEN experience.[Score] >= req.ReqScore THEN req.[DynamicWeight]
              ELSE req.[DynamicWeight] * (CAST(experience.[Score] AS DOUBLE PRECISION) / CAST(req.ReqScore AS DOUBLE PRECISION))
            END
          ) * 100.0
      END
    AS DOUBLE PRECISION) AS partial_score
  FROM requirement req
  JOIN {Experience} experience
    ON experience.[TenantId] = req.[TenantId]
   AND experience.[CategoryId] = @Cat_Role
   AND req.[CategoryId] = @Cat_Role
   AND experience.[RoleId] = req.[RoleId]
   AND experience.[SkillId] IS NULL
  JOIN eligible_consultant ec ON ec.ConsultantId = experience.[ConsultantId]
  WHERE req.ReqScore <> 0
    AND experience.[Score] > 0
),

/* Industry: match IndustryId */
branch_industry AS (
  SELECT
    experience.[ConsultantId] AS ConsultantId,
    CAST(
      CASE
        WHEN req.ReqScore = 0 THEN 0
        ELSE
          (
            CASE
              WHEN experience.[Score] >= req.ReqScore THEN req.[DynamicWeight]
              ELSE req.[DynamicWeight] * (CAST(experience.[Score] AS DOUBLE PRECISION) / CAST(req.ReqScore AS DOUBLE PRECISION))
            END
          ) * 100.0
      END
    AS DOUBLE PRECISION) AS partial_score
  FROM requirement req
  JOIN {Experience} experience
    ON experience.[TenantId] = req.[TenantId]
   AND experience.[CategoryId] = @Cat_Industry
   AND req.[CategoryId] = @Cat_Industry
   AND experience.[IndustryId] = req.[IndustryId]
  JOIN eligible_consultant ec ON ec.ConsultantId = experience.[ConsultantId]
  WHERE req.ReqScore <> 0
    AND experience.[Score] > 0
),

/* FunctionalArea: match FunctionalAreaId */
branch_functional AS (
  SELECT
    experience.[ConsultantId] AS ConsultantId,
    CAST(
      CASE
        WHEN req.ReqScore = 0 THEN 0
        ELSE
          (
            CASE
              WHEN experience.[Score] >= req.ReqScore THEN req.[DynamicWeight]
              ELSE req.[DynamicWeight] * (CAST(experience.[Score] AS DOUBLE PRECISION) / CAST(req.ReqScore AS DOUBLE PRECISION))
            END
          ) * 100.0
      END
    AS DOUBLE PRECISION) AS partial_score
  FROM requirement req
  JOIN {Experience} experience
    ON experience.[TenantId] = req.[TenantId]
   AND experience.[CategoryId] = @Cat_FunctionalArea
   AND req.[CategoryId] = @Cat_FunctionalArea
   AND experience.[FunctionalAreaId] = req.[FunctionalAreaId]
  JOIN eligible_consultant ec ON ec.ConsultantId = experience.[ConsultantId]
  WHERE req.ReqScore <> 0
    AND experience.[Score] > 0
),

/* Language: match LanguageId */
branch_language AS (
  SELECT
    experience.[ConsultantId] AS ConsultantId,
    CAST(
      CASE
        WHEN req.ReqScore = 0 THEN 0
        ELSE
          (
            CASE
              WHEN experience.[Score] >= req.ReqScore THEN req.[DynamicWeight]
              ELSE req.[DynamicWeight] * (CAST(experience.[Score] AS DOUBLE PRECISION) / CAST(req.ReqScore AS DOUBLE PRECISION))
            END
          ) * 100.0
      END
    AS DOUBLE PRECISION) AS partial_score
  FROM requirement req
  JOIN {Experience} experience
    ON experience.[TenantId] = req.[TenantId]
   AND experience.[CategoryId] = @Cat_Language
   AND req.[CategoryId] = @Cat_Language
   AND experience.[LanguageId] = req.[LanguageId]
  JOIN eligible_consultant ec ON ec.ConsultantId = experience.[ConsultantId]
),

/* ------------- Union of all category branches ------------- */
partials AS (
  SELECT * FROM branch_roleskill
  UNION ALL
  SELECT * FROM branch_role
  UNION ALL
  SELECT * FROM branch_industry
  UNION ALL
  SELECT * FROM branch_functional
  UNION ALL
  SELECT * FROM branch_language
),

/* ------------- Aggregate per consultant ------------- */
scores AS (
  SELECT
    partial.ConsultantId,
    SUM(partial.partial_score) AS MatchingScore
  FROM partials partial
  GROUP BY partial.ConsultantId
),

/* ------------- Keep only consultants with positive score ------------- */
kept AS (
  SELECT score.*
  FROM scores score
  WHERE score.MatchingScore > 0
)

/* ------------- Final projection: join identity & compute price-performance ------------- */
SELECT
  /* 1) Id */
  kept_consultant.ConsultantId                                                                           AS Id,

  /* 2) MatchingScore */
  kept_consultant.MatchingScore                                                                          AS MatchingScore,

  /* 3) PricePerformanceScore (guards preserved; math in DOUBLE PRECISION) */
  (CASE
     WHEN (CAST(consultant.[EuroFixedRate] AS DOUBLE PRECISION) = 0.0)
          OR ((CAST(demand.ClientOffsiteRate AS DOUBLE PRECISION) <> 0.0)
              AND (CAST(consultant.[EuroFixedRate] AS DOUBLE PRECISION) > CAST(demand.ClientOffsiteRate AS DOUBLE PRECISION)))
          OR (CAST(@PricePerformanceRatio AS DOUBLE PRECISION) = 0.0)
       THEN 0
     ELSE (kept_consultant.MatchingScore / NULLIF(CAST(consultant.[EuroFixedRate] AS DOUBLE PRECISION), 0.0))
            / NULLIF(CAST(@PricePerformanceRatio AS DOUBLE PRECISION), 0.0)
   END)                                                                                                  AS PricePerformanceScore,

  /* 4) Email */
  (CASE WHEN consultant.[IsInternal] = 1 THEN consultancy_user.[Email]     ELSE external_user.[Email]     END) AS Email,

  /* 5) Name */
  ((CASE WHEN consultant.[IsInternal] = 1 THEN consultancy_user.[FirstName] ELSE external_user.[FirstName] END)
    || ' ' ||
   (CASE WHEN consultant.[IsInternal] = 1 THEN consultancy_user.[LastName]  ELSE external_user.[LastName]  END)) AS Name,

  /* 6) FirstName */
  (CASE WHEN consultant.[IsInternal] = 1 THEN consultancy_user.[FirstName] ELSE external_user.[FirstName] END) AS FirstName,

  /* 7) LastName */
  (CASE WHEN consultant.[IsInternal] = 1 THEN consultancy_user.[LastName]  ELSE external_user.[LastName]  END) AS LastName,

  /* 8) PhotoUrl */
  (CASE WHEN consultant.[IsInternal] = 1
        THEN COALESCE(NULLIF(consultancy_user.[DefaultPhotoUrlRound], ''), consultancy_user.[DefaultPhotoUrl])
        ELSE COALESCE(NULLIF(external_user.[DefaultPhotoUrlRound], ''), external_user.[DefaultPhotoUrl])
   END) AS PhotoUrl,

  /* 9) EuroFixedRate */
  consultant.[EuroFixedRate]                                                                             AS EuroFixedRate,

  /* 10) Total row count, capped at @CountCap */
  (SELECT COUNT(*) FROM (SELECT 1 FROM kept LIMIT @CountCap) count_subquery)                             AS Count

FROM kept kept_consultant
JOIN {Consultant} consultant
  ON consultant.[Id] = kept_consultant.ConsultantId
  AND consultant.[TenantId] = @TenantId
LEFT JOIN {ExternalUser} external_user
  ON consultant.[ExternalUserId] = external_user.[Id]
  AND NOT (consultant.[IsInternal] = 1)
LEFT JOIN {ConsultancyUser} consultancy_user
  ON consultant.[ConsultancyUserId] = consultancy_user.[Id]
  AND consultant.[IsInternal] = 1
CROSS JOIN demand

ORDER BY kept_consultant.MatchingScore DESC
LIMIT @MaxRecords
OFFSET @StartIndex
