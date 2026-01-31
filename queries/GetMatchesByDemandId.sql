/* GetMatchesByDemandId : Advanced SQL (Aurora Postgres, ODC)
   Purpose: return consultant matches for a demand with scoring, paging, and filters.

   This is the SCORING QUERY (Query 1). Returns only IDs and scores.
   Display data (names, photos, etc.) comes from GetConsultantMatchDetails (Query 2).

   Refactored version:
     • Early NOT EXISTS filter enforcement in ec CTE (consultants failing filters excluded before scoring)
     • Removed aggregate-based filter enforcement (excl_partial, has_filter_partial, IsExcludedMax, HasFilterSum)
     • Removed contract-type filter (OnlyShowFreelancer/Temporary/Permanent)
     • Removed ExperienceFilterCount dependency

   Output columns (ordered):
     ConsultantId, MatchingScore, PricePerformanceScore, MatchedRequirementsCount, Count, HasActiveFilters
*/

WITH
/* _____________ Demand context (single row) _____________ */
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
      WHEN NULLIF({Demand}.[StartDate], '1900-01-01') IS NULL THEN NULL
      WHEN {Demand}.[StartDate] < CURRENT_DATE THEN CURRENT_DATE
      ELSE {Demand}.[StartDate]
    END                                      AS CleanedStartDate,
    {Demand}.[ClientOffsiteRate]            AS ClientOffsiteRate
  FROM {Demand}
  WHERE {Demand}.[Id] = @DemandId
    AND {Demand}.[TenantId] = @TenantId
),

/* _____________ Requirements (valid only) _____________ */
requirement AS (
  SELECT
    req.[CategoryId],
    req.[RoleId],
    req.[CustomRoleId],
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

/* _____________ Filtered requirements (Hard/Soft only) _____________ */
filtered_requirement AS (
  SELECT
    freq.[CategoryId],
    freq.[RoleId],
    freq.[CustomRoleId],
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

/* _____________ Pre-materialized filter check (evaluated once, not per consultant) _____________ */
has_filtered_requirements AS (
  SELECT EXISTS (SELECT 1 FROM filtered_requirement) AS HasFilters
),

/* _____________ Eligible consultants (prefilter + filter enforcement) _____________ */
eligible_consultant AS (
  SELECT consultant.[Id] AS ConsultantId
  FROM {Consultant} consultant
  JOIN {Status} consultant_status
    ON consultant_status.[Id] = consultant.[StatusId]
  CROSS JOIN demand
  CROSS JOIN has_filtered_requirements has_filter
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
    /* Note: In PostgreSQL, DATE + INTEGER adds that many days (no INTERVAL needed) */
    AND (
          (demand.AvailabilityFilter = @Filter_Default)
          OR (consultant.[IsImmediatelyAvailable] = 1)
          OR (
               /* CleanedStartDate >= NextAvailabilityDate */
               demand.CleanedStartDate >= consultant.[NextAvailabiltyDate]
             AND consultant.[NextAvailabiltyDate] IS NOT NULL
             )
          OR (
               /* CleanedStartDate >= (today + noticePeriod days) when noticePeriod != 0 */
               demand.CleanedStartDate >= CURRENT_DATE + consultant.[NoticePeriod]
             AND consultant.[NoticePeriod] <> 0
             )
          OR (
               demand.AvailabilityFilter = @Filter_Soft
               AND (
                     (
                       /* (today + 60 days) >= NextAvailabilityDate */
                       CURRENT_DATE + 60 >= consultant.[NextAvailabiltyDate]
                       AND consultant.[NextAvailabiltyDate] IS NOT NULL
                     )
                     OR
                     (
                       /* CleanedStartDate >= (today + (noticePeriod - 60) days) when noticePeriod != 0 */
                       demand.CleanedStartDate >= CURRENT_DATE + (consultant.[NoticePeriod] - 60)
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
          /* Fast path: HasFilters is pre-materialized (evaluated once, not per consultant) */
          has_filter.HasFilters = FALSE
          OR
          /* Otherwise: no filtered requirement may be unsatisfied */
          NOT EXISTS (
            SELECT 1 FROM filtered_requirement filter_req
            WHERE NOT EXISTS (
              SELECT 1 FROM {Experience} experience
              WHERE experience.[ConsultantId] = consultant.[Id]
                AND experience.[TenantId] = filter_req.[TenantId]
                AND experience.[CategoryId] = filter_req.[CategoryId]
                /* Category-specific key matching (supports both standard and custom roles) */
                AND (
                  /* Standard RoleSkill */
                  (@UseCustomRoles <> 1
                   AND filter_req.[CategoryId] = @Cat_RoleSkill
                   AND experience.[RoleId] = filter_req.[RoleId]
                   AND experience.[SkillId] = filter_req.[SkillId])
                  /* Custom RoleSkill */
                  OR (@UseCustomRoles = 1
                      AND filter_req.[CategoryId] = @Cat_CustomRoleSkill
                      AND experience.[CustomRoleId] = filter_req.[CustomRoleId]
                      AND experience.[SkillId] = filter_req.[SkillId])
                  /* Standard Role */
                  OR (@UseCustomRoles <> 1
                      AND filter_req.[CategoryId] = @Cat_Role
                      AND experience.[RoleId] = filter_req.[RoleId]
                      AND experience.[SkillId] IS NULL)
                  /* Custom Role */
                  OR (@UseCustomRoles = 1
                      AND filter_req.[CategoryId] = @Cat_CustomRole
                      AND experience.[CustomRoleId] = filter_req.[CustomRoleId]
                      AND experience.[SkillId] IS NULL)
                  /* Industry (unchanged) */
                  OR (filter_req.[CategoryId] = @Cat_Industry
                      AND experience.[IndustryId] = filter_req.[IndustryId])
                  /* FunctionalArea (unchanged) */
                  OR (filter_req.[CategoryId] = @Cat_FunctionalArea
                      AND experience.[FunctionalAreaId] = filter_req.[FunctionalAreaId])
                  /* Language (unchanged) */
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

/* _____________ Category branches with computed partial_score (DOUBLE PRECISION) _____________ */

/* RoleSkill: match (RoleId, SkillId) or CustomRoleSkill: match (CustomRoleId, SkillId) */
branch_roleskill AS (
  SELECT
    experience.[ConsultantId] AS ConsultantId,
    CASE WHEN @UseCustomRoles = 1 THEN @Cat_CustomRoleSkill ELSE @Cat_RoleSkill END AS CategoryId,
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
   AND (
     /* Standard RoleSkill */
     (@UseCustomRoles <> 1
      AND experience.[CategoryId] = @Cat_RoleSkill
      AND req.[CategoryId] = @Cat_RoleSkill
      AND experience.[RoleId] = req.[RoleId]
      AND experience.[SkillId] = req.[SkillId])
     /* Custom RoleSkill */
     OR (@UseCustomRoles = 1
         AND experience.[CategoryId] = @Cat_CustomRoleSkill
         AND req.[CategoryId] = @Cat_CustomRoleSkill
         AND experience.[CustomRoleId] = req.[CustomRoleId]
         AND experience.[SkillId] = req.[SkillId])
   )
  JOIN eligible_consultant ec ON ec.ConsultantId = experience.[ConsultantId]
  WHERE req.ReqScore <> 0
    AND experience.[Score] > 0
),

/* Role: match RoleId or CustomRole: match CustomRoleId (SkillId IS NULL on experience) */
branch_role AS (
  SELECT
    experience.[ConsultantId] AS ConsultantId,
    CASE WHEN @UseCustomRoles = 1 THEN @Cat_CustomRole ELSE @Cat_Role END AS CategoryId,
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
   AND (
     /* Standard Role */
     (@UseCustomRoles <> 1
      AND experience.[CategoryId] = @Cat_Role
      AND req.[CategoryId] = @Cat_Role
      AND experience.[RoleId] = req.[RoleId]
      AND experience.[SkillId] IS NULL)
     /* Custom Role */
     OR (@UseCustomRoles = 1
         AND experience.[CategoryId] = @Cat_CustomRole
         AND req.[CategoryId] = @Cat_CustomRole
         AND experience.[CustomRoleId] = req.[CustomRoleId]
         AND experience.[SkillId] IS NULL)
   )
  JOIN eligible_consultant ec ON ec.ConsultantId = experience.[ConsultantId]
  WHERE req.ReqScore <> 0
    AND experience.[Score] > 0
),

/* Industry: match IndustryId */
branch_industry AS (
  SELECT
    experience.[ConsultantId] AS ConsultantId,
    @Cat_Industry AS CategoryId,
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
    @Cat_FunctionalArea AS CategoryId,
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
    @Cat_Language AS CategoryId,
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

/* _____________ Union of all category branches _____________ */
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

/* _____________ Aggregate per consultant _____________ */
scores AS (
  SELECT
    partial.ConsultantId,
    SUM(partial.partial_score) AS MatchingScore,
    COUNT(*) FILTER (WHERE partial.CategoryId <> @Cat_Language) AS MatchedRequirementsCount
  FROM partials partial
  GROUP BY partial.ConsultantId
),

/* _____________ Keep only consultants with positive score _____________ */
kept AS (
  SELECT
    score.ConsultantId,
    score.MatchingScore,
    score.MatchedRequirementsCount
  FROM scores score
  WHERE score.MatchingScore > 0
),

/* _____________ Price-performance calculation with window function _____________ */
price_performance AS (
  SELECT
    kept_consultant.ConsultantId,
    kept_consultant.MatchingScore,
    kept_consultant.MatchedRequirementsCount,
    CASE
      WHEN consultant.[EuroFixedRate] > 0
      THEN kept_consultant.MatchingScore / consultant.[EuroFixedRate]
      ELSE 0
    END AS Ratio,
    MAX(
      CASE
        WHEN consultant.[EuroFixedRate] > 0
        THEN kept_consultant.MatchingScore / consultant.[EuroFixedRate]
        ELSE 0
      END
    ) OVER () AS BestRatio
  FROM kept kept_consultant
  JOIN {Consultant} consultant ON consultant.[Id] = kept_consultant.ConsultantId
)

/* _____________ Final projection: scoring + price-performance _____________ */
SELECT
  final.ConsultantId,
  final.MatchingScore,
  final.PricePerformanceScore,
  final.MatchedRequirementsCount,
  final.Count,
  final.HasActiveFilters
FROM (
  SELECT
    /* 1) ConsultantId */
    pp.ConsultantId AS ConsultantId,

    /* 2) MatchingScore */
    pp.MatchingScore AS MatchingScore,

    /* 3) PricePerformanceScore (0-10 scale) */
    CASE
      WHEN pp.BestRatio > 0
      THEN (pp.Ratio / pp.BestRatio) * 10
      ELSE 0
    END AS PricePerformanceScore,

    /* 4) MatchedRequirementsCount (excludes Language) */
    pp.MatchedRequirementsCount AS MatchedRequirementsCount,

    /* 5) Total row count (computed once via window function) */
    COUNT(*) OVER() AS Count,

    /* 6) HasActiveFilters (true if any requirement has Hard/Soft filter) */
    (SELECT HasFilters FROM has_filtered_requirements) AS HasActiveFilters

  FROM price_performance pp
) final
ORDER BY final.MatchingScore DESC
LIMIT @MaxRecords
OFFSET @StartIndex
