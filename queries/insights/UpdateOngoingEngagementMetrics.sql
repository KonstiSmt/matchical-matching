/* UpdateOngoingEngagementMetrics : Advanced SQL (Aurora Postgres, ODC)
   Purpose: Recalculate AbsoluteMonth, ProjectDays, and IsOngoing for ongoing valid engagements.
   Behavior: Updates up to 10000 out_of_sync rows across all tenants per run and returns update progress.
*/

WITH
/* _____________ Consultancy_settings_per_tenant _____________ */
settings_ranked AS (
  SELECT
    settings.[TenantId] AS TenantId,
    settings.[ProjectDaysPerMonth] AS ProjectDaysPerMonth,
    ROW_NUMBER() OVER (
      PARTITION BY settings.[TenantId]
      ORDER BY settings.[Id] ASC
    ) AS RowNumber
  FROM {ConsultancySettingsEXT} settings
  WHERE settings.[ProjectDaysPerMonth] IS NOT NULL
),

settings_scope AS (
  SELECT
    ranked.TenantId,
    ranked.ProjectDaysPerMonth
  FROM settings_ranked ranked
  WHERE ranked.RowNumber = 1
),

/* _____________ Eligible_ongoing_engagements _____________ */
engagement_base AS (
  SELECT
    engagement.[Id] AS EngagementId,
    engagement.[CreatedAt] AS EngagementCreatedAt,
    engagement.[StartDate]::date AS StartDate,
    engagement.[AbsoluteMonth] AS StoredAbsoluteMonth,
    engagement.[ProjectDays] AS StoredProjectDays,
    engagement.[IsOngoing] AS StoredIsOngoing,
    engagement.[Capacity] AS Capacity,
    settings.ProjectDaysPerMonth AS ProjectDaysPerMonth,
    CASE
      WHEN engagement.[EndDate] IS NOT NULL
       AND engagement.[EndDate] > DATE '1900-01-01'
       AND engagement.[EndDate]::date <= CURRENT_DATE
      THEN engagement.[EndDate]::date
      ELSE CURRENT_DATE
    END AS EffectiveEndDate,
    CASE
      WHEN engagement.[EndDate] IS NOT NULL
       AND engagement.[EndDate] > DATE '1900-01-01'
       AND engagement.[EndDate]::date <= CURRENT_DATE
      THEN 0
      ELSE 1
    END AS CalculatedIsOngoing
  FROM {Engagement} engagement
  JOIN settings_scope settings
    ON settings.TenantId = engagement.[TenantId]
  WHERE engagement.[IsDateInvalid] = 0
    AND engagement.[IsOngoing] = 1
    AND engagement.[StartDate] IS NOT NULL
    AND engagement.[Capacity] IS NOT NULL
),

/* _____________ Recalculated_metrics _____________ */
engagement_calculated AS (
  SELECT
    base.EngagementId,
    base.EngagementCreatedAt,
    base.StartDate,
    base.EffectiveEndDate,
    base.StoredAbsoluteMonth,
    base.StoredProjectDays,
    base.StoredIsOngoing,
    base.CalculatedIsOngoing,
    GREATEST(
      1,
      ROUND(
        (
          (EXTRACT(YEAR FROM AGE(base.EffectiveEndDate, base.StartDate)) * 12)
          + EXTRACT(MONTH FROM AGE(base.EffectiveEndDate, base.StartDate))
          + (EXTRACT(DAY FROM AGE(base.EffectiveEndDate, base.StartDate)) / 30.0)
        )::NUMERIC
      )
    )::INTEGER AS CalculatedAbsoluteMonth,
    ROUND(
      (
        (
          (EXTRACT(YEAR FROM AGE(base.EffectiveEndDate, base.StartDate)) * 12)
          + EXTRACT(MONTH FROM AGE(base.EffectiveEndDate, base.StartDate))
          + (EXTRACT(DAY FROM AGE(base.EffectiveEndDate, base.StartDate)) / 30.4375)
        )
        * base.ProjectDaysPerMonth
        * (base.Capacity / 100.0)
      )
    )::INTEGER AS CalculatedProjectDays
  FROM engagement_base base
  WHERE base.EffectiveEndDate > base.StartDate
),

/* _____________ Only_rows_that_need_updates _____________ */
engagement_out_of_sync AS (
  SELECT
    calculated.EngagementId,
    calculated.EngagementCreatedAt,
    calculated.StartDate,
    calculated.EffectiveEndDate,
    calculated.CalculatedIsOngoing,
    calculated.CalculatedAbsoluteMonth,
    calculated.CalculatedProjectDays
  FROM engagement_calculated calculated
  WHERE COALESCE(calculated.StoredAbsoluteMonth, -1) <> calculated.CalculatedAbsoluteMonth
     OR COALESCE(calculated.StoredProjectDays, -1) <> calculated.CalculatedProjectDays
     OR COALESCE(calculated.StoredIsOngoing, -1) <> calculated.CalculatedIsOngoing
),

/* _____________ Batch_for_this_run _____________ */
rows_to_update AS (
  SELECT
    out_of_sync.EngagementId,
    out_of_sync.CalculatedAbsoluteMonth,
    out_of_sync.CalculatedProjectDays,
    out_of_sync.CalculatedIsOngoing
  FROM engagement_out_of_sync out_of_sync
  LIMIT 10000
),

/* _____________ Execute_batch_update _____________ */
updated_rows AS (
  UPDATE {Engagement}
  SET
    [AbsoluteMonth] = rows_to_update.CalculatedAbsoluteMonth,
    [ProjectDays] = rows_to_update.CalculatedProjectDays,
    [IsOngoing] = rows_to_update.CalculatedIsOngoing
  FROM rows_to_update
  WHERE {Engagement}.[Id] = rows_to_update.EngagementId
  RETURNING {Engagement}.[Id] AS EngagementId
)

SELECT
  COUNT(updated_rows.EngagementId)::INTEGER AS UpdatedRows,
  CASE
    WHEN EXISTS (
      SELECT 1
      FROM engagement_out_of_sync out_of_sync
      OFFSET 10000
      LIMIT 1
    ) THEN 1
    ELSE 0
  END::INTEGER AS HasMoreRows
FROM updated_rows
