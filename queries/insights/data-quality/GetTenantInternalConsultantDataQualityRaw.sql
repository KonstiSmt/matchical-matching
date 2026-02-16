/* GetTenantInternalConsultantDataQualityRaw : Advanced SQL (Aurora Postgres, ODC)
   Purpose: Tenant scoped raw data quality export for internal consultants.
   Input: @TenantId, @ConsultantUrlPrefix
*/

WITH
/* _____________ Internal_active_consultant_scope _____________ */
consultant_scope AS (
  SELECT
    consultant.[Id] AS ConsultantId,
    consultancy_user.[ExternalId] AS ExternalId,
    consultant.[MatId] AS MatId,
    consultancy_user.[FirstName] AS FirstName,
    consultancy_user.[LastName] AS LastName,
    consultancy_user.[Email] AS Email,
    consultancy_user.[DefaultPhotoUrl] AS DefaultPhotoUrl,
    consultancy_user.[EntryDate] AS EntryDate,
    consultant.[WorkExperienceSince] AS WorkExperienceSince,
    LEAST(
      COALESCE(
        NULLIF(consultancy_user.[ExitDate], DATE '1900-01-01'),
        CURRENT_DATE
      ),
      CURRENT_DATE
    ) AS EntryBaselineEndDate
  FROM {Consultant} consultant
  JOIN {ConsultancyUser} consultancy_user
    ON consultancy_user.[Id] = consultant.[ConsultancyUserId]
   AND consultancy_user.[TenantId] = @TenantId
  JOIN {Status} consultant_status
    ON consultant_status.[Id] = consultant.[StatusId]
   AND consultant_status.[IsActive] = 1
  LEFT JOIN {Status} employment_status
    ON employment_status.[Id] = consultancy_user.[EmploymentStatusId]
  WHERE consultant.[TenantId] = @TenantId
    AND consultant.[IsInternal] = 1
    AND (
      consultancy_user.[EmploymentStatusId] IS NULL
      OR employment_status.[IsActive] = 1
    )
),

/* _____________ Engagement_effective_dates_and_validity _____________ */
engagement_prepared AS (
  SELECT
    scope.ConsultantId,
    engagement.[Id] AS EngagementId,
    engagement.[StartDate] AS StartDate,
    engagement.[EndDate] AS EndDate,
    CASE
      WHEN engagement.[EndDate] IS NOT NULL THEN LEAST(engagement.[EndDate], CURRENT_DATE)
      WHEN engagement.[IsOngoing] = 1 THEN CURRENT_DATE
      ELSE NULL
    END AS EffectiveEndDate,
    engagement.[IsDateInvalid] AS IsDateInvalid,
    engagement.[IsOngoing] AS IsOngoing,
    COALESCE(engagement.[AbsoluteMonth], 0.0) AS AbsoluteMonth,
    COALESCE(engagement.[WeightedMonth], 0.0) AS WeightedMonth,
    CASE
      WHEN engagement.[Id] IS NOT NULL
       AND COALESCE(engagement.[IsDateInvalid], 0) <> 1
       AND engagement.[StartDate] IS NOT NULL
       AND (
         CASE
           WHEN engagement.[EndDate] IS NOT NULL THEN LEAST(engagement.[EndDate], CURRENT_DATE)
           WHEN engagement.[IsOngoing] = 1 THEN CURRENT_DATE
           ELSE NULL
         END
       ) IS NOT NULL
       AND (
         CASE
           WHEN engagement.[EndDate] IS NOT NULL THEN LEAST(engagement.[EndDate], CURRENT_DATE)
           WHEN engagement.[IsOngoing] = 1 THEN CURRENT_DATE
           ELSE NULL
         END
       ) > engagement.[StartDate]
      THEN
        (
          (
            CASE
              WHEN engagement.[EndDate] IS NOT NULL THEN LEAST(engagement.[EndDate], CURRENT_DATE)
              WHEN engagement.[IsOngoing] = 1 THEN CURRENT_DATE
              ELSE NULL
            END
          )::date
          - engagement.[StartDate]::date
        )::DOUBLE PRECISION
      ELSE NULL
    END AS EngagementDays
  FROM consultant_scope scope
  LEFT JOIN {Engagement} engagement
    ON engagement.[ConsultantId] = scope.ConsultantId
   AND engagement.[TenantId] = @TenantId
),

/* _____________ Since_entry_prorated_month_contributions _____________ */
engagement_contrib_since_entry AS (
  SELECT
    scope.ConsultantId,
    SUM(
      CASE
        WHEN engagement.EngagementDays IS NOT NULL
         AND scope.EntryDate IS NOT NULL
         AND scope.EntryBaselineEndDate > scope.EntryDate
        THEN
          engagement.AbsoluteMonth
          * (
              GREATEST(
                (
                  LEAST(engagement.EffectiveEndDate::date, scope.EntryBaselineEndDate::date)
                  - GREATEST(engagement.StartDate::date, scope.EntryDate::date)
                )::DOUBLE PRECISION,
                0.0
              )
              / NULLIF(engagement.EngagementDays, 0.0)
            )
        ELSE 0.0
      END
    ) AS AbsoluteMonthsSinceEntry,
    SUM(
      CASE
        WHEN engagement.EngagementDays IS NOT NULL
         AND scope.EntryDate IS NOT NULL
         AND scope.EntryBaselineEndDate > scope.EntryDate
        THEN
          engagement.WeightedMonth
          * (
              GREATEST(
                (
                  LEAST(engagement.EffectiveEndDate::date, scope.EntryBaselineEndDate::date)
                  - GREATEST(engagement.StartDate::date, scope.EntryDate::date)
                )::DOUBLE PRECISION,
                0.0
              )
              / NULLIF(engagement.EngagementDays, 0.0)
            )
        ELSE 0.0
      END
    ) AS WeightedMonthsSinceEntry
  FROM consultant_scope scope
  LEFT JOIN engagement_prepared engagement
    ON engagement.ConsultantId = scope.ConsultantId
  GROUP BY
    scope.ConsultantId
),

/* _____________ Before_entry_prorated_month_contributions _____________ */
engagement_contrib_before_entry AS (
  SELECT
    scope.ConsultantId,
    SUM(
      CASE
        WHEN engagement.EngagementDays IS NOT NULL
         AND scope.EntryDate IS NOT NULL
         AND scope.WorkExperienceSince IS NOT NULL
         AND scope.EntryDate > scope.WorkExperienceSince
        THEN
          engagement.AbsoluteMonth
          * (
              GREATEST(
                (
                  LEAST(engagement.EffectiveEndDate::date, scope.EntryDate::date)
                  - GREATEST(engagement.StartDate::date, scope.WorkExperienceSince::date)
                )::DOUBLE PRECISION,
                0.0
              )
              / NULLIF(engagement.EngagementDays, 0.0)
            )
        ELSE 0.0
      END
    ) AS AbsoluteMonthsBeforeEntry,
    SUM(
      CASE
        WHEN engagement.EngagementDays IS NOT NULL
         AND scope.EntryDate IS NOT NULL
         AND scope.WorkExperienceSince IS NOT NULL
         AND scope.EntryDate > scope.WorkExperienceSince
        THEN
          engagement.WeightedMonth
          * (
              GREATEST(
                (
                  LEAST(engagement.EffectiveEndDate::date, scope.EntryDate::date)
                  - GREATEST(engagement.StartDate::date, scope.WorkExperienceSince::date)
                )::DOUBLE PRECISION,
                0.0
              )
              / NULLIF(engagement.EngagementDays, 0.0)
            )
        ELSE 0.0
      END
    ) AS WeightedMonthsBeforeEntry
  FROM consultant_scope scope
  LEFT JOIN engagement_prepared engagement
    ON engagement.ConsultantId = scope.ConsultantId
  GROUP BY
    scope.ConsultantId
),

/* _____________ Engagement_counts_and_ongoing_stats _____________ */
engagement_stats AS (
  SELECT
    scope.ConsultantId,
    COUNT(engagement.EngagementId) AS TotalEngagements,
    SUM(CASE WHEN engagement.IsDateInvalid = 1 THEN 1 ELSE 0 END) AS EngagementsWithInvalidDates,
    SUM(CASE WHEN engagement.IsOngoing = 1 THEN 1 ELSE 0 END) AS OngoingEngagements,
    MIN(CASE WHEN engagement.IsOngoing = 1 THEN engagement.StartDate ELSE NULL END) AS OldestOngoingEngagementStartDate
  FROM consultant_scope scope
  LEFT JOIN engagement_prepared engagement
    ON engagement.ConsultantId = scope.ConsultantId
  GROUP BY
    scope.ConsultantId
),

/* _____________ Last_finished_engagement_per_consultant _____________ */
last_finished_ranked AS (
  SELECT
    engagement.ConsultantId,
    engagement.StartDate,
    engagement.EndDate,
    ROW_NUMBER() OVER (
      PARTITION BY engagement.ConsultantId
      ORDER BY
        engagement.EndDate DESC,
        engagement.StartDate DESC,
        engagement.EngagementId DESC
    ) AS RowNumber
  FROM engagement_prepared engagement
  WHERE engagement.EngagementId IS NOT NULL
    AND engagement.EndDate IS NOT NULL
    AND engagement.EndDate <= CURRENT_DATE
),

last_finished_engagement AS (
  SELECT
    ranked.ConsultantId,
    ranked.StartDate AS LastFinishedEngagementStartDate,
    ranked.EndDate AS LastFinishedEngagementEndDate
  FROM last_finished_ranked ranked
  WHERE ranked.RowNumber = 1
),

/* _____________ Baselines_and_data_quality_flags _____________ */
consultant_baselines AS (
  SELECT
    scope.ConsultantId,
    CASE
      WHEN scope.EntryDate IS NOT NULL
       AND scope.EntryBaselineEndDate > scope.EntryDate
      THEN
        (EXTRACT(YEAR FROM AGE(scope.EntryBaselineEndDate::date, scope.EntryDate::date)) * 12)
        + EXTRACT(MONTH FROM AGE(scope.EntryBaselineEndDate::date, scope.EntryDate::date))
      WHEN scope.EntryDate IS NOT NULL
      THEN 0.0
      ELSE NULL
    END AS MonthsSinceEntryBaseline,
    CASE
      WHEN scope.EntryDate IS NOT NULL
       AND scope.WorkExperienceSince IS NOT NULL
       AND scope.EntryDate > scope.WorkExperienceSince
      THEN
        (EXTRACT(YEAR FROM AGE(scope.EntryDate::date, scope.WorkExperienceSince::date)) * 12)
        + EXTRACT(MONTH FROM AGE(scope.EntryDate::date, scope.WorkExperienceSince::date))
      WHEN scope.EntryDate IS NOT NULL
       AND scope.WorkExperienceSince IS NOT NULL
      THEN 0.0
      ELSE NULL
    END AS MonthsBeforeEntryBaseline,
    (scope.EntryDate IS NULL) AS IsEntryDateMissing,
    (scope.WorkExperienceSince IS NULL) AS IsWorkExperienceSinceMissing,
    (
      scope.EntryDate IS NOT NULL
      AND scope.WorkExperienceSince IS NOT NULL
      AND scope.WorkExperienceSince > scope.EntryDate
    ) AS IsWorkExperienceSinceAfterEntryDate
  FROM consultant_scope scope
)

SELECT
  scope.ExternalId AS External_id,
  scope.MatId AS Mat_id,
  @ConsultantUrlPrefix::TEXT || scope.ConsultantId::TEXT AS Url,
  TRIM(CONCAT(COALESCE(scope.FirstName, ''), ' ', COALESCE(scope.LastName, ''))) AS Full_name,
  scope.Email AS Email,
  scope.EntryDate AS Entry_date,
  scope.WorkExperienceSince AS Work_experience_since,
  COALESCE(stats.TotalEngagements, 0) AS Total_engagements,
  COALESCE(stats.EngagementsWithInvalidDates, 0) AS Engagements_with_invalid_dates,
  COALESCE(stats.OngoingEngagements, 0) AS Ongoing_engagements,
  stats.OldestOngoingEngagementStartDate AS Oldest_ongoing_engagement_start_date,
  last_finished.LastFinishedEngagementStartDate AS Last_finished_engagement_start_date,
  last_finished.LastFinishedEngagementEndDate AS Last_finished_engagement_end_date,
  CASE
    WHEN NULLIF(TRIM(COALESCE(scope.DefaultPhotoUrl, '')), '') IS NULL THEN TRUE
    ELSE FALSE
  END AS Is_profile_photo_missing,
  ROUND(baselines.MonthsSinceEntryBaseline::NUMERIC, 2) AS Months_since_entry_baseline,
  ROUND(COALESCE(since_entry.AbsoluteMonthsSinceEntry, 0.0)::NUMERIC, 2) AS Absolute_months_since_entry,
  ROUND(COALESCE(since_entry.WeightedMonthsSinceEntry, 0.0)::NUMERIC, 2) AS Weighted_months_since_entry,
  CASE
    WHEN baselines.MonthsSinceEntryBaseline IS NOT NULL
    THEN ROUND((baselines.MonthsSinceEntryBaseline - COALESCE(since_entry.AbsoluteMonthsSinceEntry, 0.0))::NUMERIC, 2)
    ELSE NULL
  END AS Absolute_missing_months_since_entry,
  CASE
    WHEN baselines.MonthsSinceEntryBaseline IS NOT NULL
    THEN ROUND((baselines.MonthsSinceEntryBaseline - COALESCE(since_entry.WeightedMonthsSinceEntry, 0.0))::NUMERIC, 2)
    ELSE NULL
  END AS Weighted_missing_months_since_entry,
  CASE
    WHEN baselines.MonthsSinceEntryBaseline > 0
    THEN ROUND((COALESCE(since_entry.AbsoluteMonthsSinceEntry, 0.0) / baselines.MonthsSinceEntryBaseline)::NUMERIC, 2)
    ELSE NULL
  END AS Absolute_coverage_ratio_since_entry,
  CASE
    WHEN baselines.MonthsSinceEntryBaseline > 0
    THEN ROUND((COALESCE(since_entry.WeightedMonthsSinceEntry, 0.0) / baselines.MonthsSinceEntryBaseline)::NUMERIC, 2)
    ELSE NULL
  END AS Weighted_coverage_ratio_since_entry,
  ROUND(baselines.MonthsBeforeEntryBaseline::NUMERIC, 2) AS Months_before_entry_baseline,
  ROUND(COALESCE(before_entry.AbsoluteMonthsBeforeEntry, 0.0)::NUMERIC, 2) AS Absolute_months_before_entry,
  ROUND(COALESCE(before_entry.WeightedMonthsBeforeEntry, 0.0)::NUMERIC, 2) AS Weighted_months_before_entry,
  CASE
    WHEN baselines.MonthsBeforeEntryBaseline IS NOT NULL
    THEN ROUND((baselines.MonthsBeforeEntryBaseline - COALESCE(before_entry.AbsoluteMonthsBeforeEntry, 0.0))::NUMERIC, 2)
    ELSE NULL
  END AS Absolute_missing_months_before_entry,
  CASE
    WHEN baselines.MonthsBeforeEntryBaseline IS NOT NULL
    THEN ROUND((baselines.MonthsBeforeEntryBaseline - COALESCE(before_entry.WeightedMonthsBeforeEntry, 0.0))::NUMERIC, 2)
    ELSE NULL
  END AS Weighted_missing_months_before_entry,
  CASE
    WHEN baselines.MonthsBeforeEntryBaseline > 0
    THEN ROUND((COALESCE(before_entry.AbsoluteMonthsBeforeEntry, 0.0) / baselines.MonthsBeforeEntryBaseline)::NUMERIC, 2)
    ELSE NULL
  END AS Absolute_coverage_ratio_before_entry,
  CASE
    WHEN baselines.MonthsBeforeEntryBaseline > 0
    THEN ROUND((COALESCE(before_entry.WeightedMonthsBeforeEntry, 0.0) / baselines.MonthsBeforeEntryBaseline)::NUMERIC, 2)
    ELSE NULL
  END AS Weighted_coverage_ratio_before_entry,
  baselines.IsEntryDateMissing AS Is_entry_date_missing,
  baselines.IsWorkExperienceSinceMissing AS Is_work_experience_since_missing,
  baselines.IsWorkExperienceSinceAfterEntryDate AS Is_work_experience_since_after_entry_date
FROM consultant_scope scope
LEFT JOIN engagement_stats stats
  ON stats.ConsultantId = scope.ConsultantId
LEFT JOIN engagement_contrib_since_entry since_entry
  ON since_entry.ConsultantId = scope.ConsultantId
LEFT JOIN engagement_contrib_before_entry before_entry
  ON before_entry.ConsultantId = scope.ConsultantId
LEFT JOIN last_finished_engagement last_finished
  ON last_finished.ConsultantId = scope.ConsultantId
LEFT JOIN consultant_baselines baselines
  ON baselines.ConsultantId = scope.ConsultantId
ORDER BY
  Full_name,
  scope.ConsultantId
