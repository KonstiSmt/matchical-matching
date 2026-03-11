/* GetInternalConsultantRoleExperienceAggregated : Advanced SQL (Aurora Postgres, ODC)
   Purpose: Tenant scoped aggregated role experience export for internal consultants.
   Input: @TenantId, @SystemLanguage, @ConsultantUrlPrefix, @UseCustomRoles,
          @Cat_Role, @Cat_CustomRole, @BooleanCategory_Yes, @BooleanCategory_No
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
    consultancy_user.[EntryDate] AS EntryDate,
    consultant.[WorkExperienceSince] AS WorkExperienceSince,
    consultant.[AvailabilityCategoryId] AS AvailabilityCategoryId,
    consultant.[AvailableFrom] AS AvailableFrom,
    consultant.[AvailableTo] AS AvailableTo,
    consultant.[IsWillingToTravel] AS IsWillingToTravel,
    consultant.[AvailableDaysPerWeek] AS AvailableDaysPerWeek,
    consultant.[AvailabilityCommentLocaleKey] AS AvailabilityCommentLocaleKeyId,
    consultancy_user.[DepartmentId] AS DepartmentId,
    consultancy_user.[TeamId] AS TeamId,
    consultancy_user.[UnitId] AS UnitId,
    consultancy_user.[LegalEntityId] AS LegalEntityId,
    consultancy_user.[SeniorityLevelId] AS SeniorityLevelId,
    consultancy_user.[LocationId] AS LocationId,
    consultancy_user.[LeadId] AS LeadId,
    consultant.[TopRoleId] AS TopRoleId,
    consultant.[TopCustomRoleId] AS TopCustomRoleId,
    CASE
      WHEN @UseCustomRoles = 1 THEN consultant.[TopCustomRoleId]
      ELSE consultant.[TopRoleId]
    END AS TopRoleKey
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

/* _____________ Experience_rows_in_requested_role_mode _____________ */
role_experience_prepared AS (
  SELECT
    experience.[ConsultantId] AS ConsultantId,
    CASE
      WHEN @UseCustomRoles = 1 THEN experience.[CustomRoleId]
      ELSE experience.[RoleId]
    END AS RoleKey,
    CASE
      WHEN @UseCustomRoles = 1 THEN custom_role_locale.[TextValue]
      ELSE role_locale.[TextValue]
    END AS RoleName,
    COALESCE(experience.[WeightedMonth], 0.0) AS WeightedMonth,
    experience.[LastUsed] AS LastUsed,
    experience.[IsOngoing] AS IsOngoing
  FROM {Experience} experience
  JOIN consultant_scope scope
    ON scope.ConsultantId = experience.[ConsultantId]
  LEFT JOIN {Role} role_ref
    ON @UseCustomRoles <> 1
   AND role_ref.[Id] = experience.[RoleId]
  LEFT JOIN {LocaleDict} role_locale
    ON @UseCustomRoles <> 1
   AND role_locale.[LocaleKeyId] = role_ref.[NameLocaleKeyId]
   AND role_locale.[LanguageId] = @SystemLanguage
  LEFT JOIN {CustomRole} custom_role
    ON @UseCustomRoles = 1
   AND custom_role.[Id] = experience.[CustomRoleId]
   AND custom_role.[TenantId] = @TenantId
  LEFT JOIN {RoleName} custom_role_name
    ON @UseCustomRoles = 1
   AND custom_role_name.[Id] = custom_role.[RoleNameId]
  LEFT JOIN {LocaleDict} custom_role_locale
    ON @UseCustomRoles = 1
   AND custom_role_locale.[LocaleKeyId] = custom_role_name.[NameLocaleKeyId]
   AND custom_role_locale.[LanguageId] = @SystemLanguage
  WHERE experience.[TenantId] = @TenantId
    AND (
      (@UseCustomRoles <> 1 AND experience.[CategoryId] = @Cat_Role AND experience.[RoleId] IS NOT NULL)
      OR (@UseCustomRoles = 1 AND experience.[CategoryId] = @Cat_CustomRole AND experience.[CustomRoleId] IS NOT NULL)
    )
),

/* _____________ Aggregated_role_metrics_per_consultant _____________ */
role_experience_aggregate AS (
  SELECT
    prepared.ConsultantId,
    COUNT(DISTINCT prepared.RoleKey) AS RoleCount
  FROM role_experience_prepared prepared
  GROUP BY
    prepared.ConsultantId
),

/* _____________ Primary_role_experience_rows _____________ */
primary_role_experience AS (
  SELECT
    prepared.ConsultantId,
    prepared.WeightedMonth,
    prepared.LastUsed,
    prepared.IsOngoing
  FROM role_experience_prepared prepared
  JOIN consultant_scope scope
    ON scope.ConsultantId = prepared.ConsultantId
   AND scope.TopRoleKey IS NOT NULL
   AND prepared.RoleKey = scope.TopRoleKey
),

/* _____________ Primary_role_experience_metrics_per_consultant _____________ */
primary_role_experience_metrics AS (
  SELECT
    scope.ConsultantId,
    COUNT(primary_experience.ConsultantId) AS PrimaryRoleExperienceRowCount,
    SUM(primary_experience.WeightedMonth) AS PrimaryRoleWeightedMonths,
    MAX(primary_experience.LastUsed) AS PrimaryRoleLatestRecencyAtRaw,
    MAX(
      CASE
        WHEN primary_experience.IsOngoing = 1 THEN 1
        ELSE 0
      END
    ) AS PrimaryRoleHasOngoing
  FROM consultant_scope scope
  LEFT JOIN primary_role_experience primary_experience
    ON primary_experience.ConsultantId = scope.ConsultantId
  GROUP BY
    scope.ConsultantId
),

/* _____________ Primary_role_from_consultant_top_role _____________ */
primary_role_name AS (
  SELECT
    scope.ConsultantId,
    CASE
      WHEN @UseCustomRoles = 1 THEN top_custom_role_locale.[TextValue]
      ELSE top_role_locale.[TextValue]
    END AS PrimaryRole
  FROM consultant_scope scope
  LEFT JOIN {Role} top_role
    ON @UseCustomRoles <> 1
   AND top_role.[Id] = scope.TopRoleId
  LEFT JOIN {LocaleDict} top_role_locale
    ON @UseCustomRoles <> 1
   AND top_role_locale.[LocaleKeyId] = top_role.[NameLocaleKeyId]
   AND top_role_locale.[LanguageId] = @SystemLanguage
  LEFT JOIN {CustomRole} top_custom_role
    ON @UseCustomRoles = 1
   AND top_custom_role.[Id] = scope.TopCustomRoleId
   AND top_custom_role.[TenantId] = @TenantId
  LEFT JOIN {RoleName} top_custom_role_name
    ON @UseCustomRoles = 1
   AND top_custom_role_name.[Id] = top_custom_role.[RoleNameId]
  LEFT JOIN {LocaleDict} top_custom_role_locale
    ON @UseCustomRoles = 1
   AND top_custom_role_locale.[LocaleKeyId] = top_custom_role_name.[NameLocaleKeyId]
   AND top_custom_role_locale.[LanguageId] = @SystemLanguage
)

SELECT
  scope.ExternalId AS External_id,
  scope.MatId AS Mat_id,
  @ConsultantUrlPrefix::TEXT || scope.ConsultantId::TEXT AS Url,
  TRIM(CONCAT(COALESCE(scope.FirstName, ''), ' ', COALESCE(scope.LastName, ''))) AS Full_name,
  scope.Email AS Email,
  scope.EntryDate AS Entry_date,
  scope.WorkExperienceSince AS Work_experience_since,
  CASE
    WHEN scope.AvailabilityCategoryId = @BooleanCategory_Yes THEN 'Yes'
    WHEN scope.AvailabilityCategoryId = @BooleanCategory_No THEN 'No'
    ELSE '-'
  END AS Is_available,
  scope.AvailableFrom AS Available_from,
  scope.AvailableTo AS Available_to,
  CASE
    WHEN scope.IsWillingToTravel = 1 THEN TRUE
    WHEN scope.IsWillingToTravel = 0 THEN FALSE
    ELSE NULL
  END AS Is_willing_to_travel,
  ROUND(scope.AvailableDaysPerWeek::NUMERIC, 2) AS Available_days_per_week,
  availability_comment_locale.[TextValue] AS Availability_comment,
  department_locale.[TextValue] AS Department,
  team_locale.[TextValue] AS Team,
  unit_locale.[TextValue] AS Unit,
  legal_entity_locale.[TextValue] AS Legal_entity,
  seniority_level_locale.[TextValue] AS Seniority_level,
  location_locale.[TextValue] AS Location,
  NULLIF(TRIM(CONCAT(COALESCE(lead_user.[FirstName], ''), ' ', COALESCE(lead_user.[LastName], ''))), '') AS Lead,
  COALESCE(aggregate_metrics.RoleCount, 0) AS Role_count,
  primary_role.PrimaryRole AS Primary_role,
  ROUND(COALESCE(primary_metrics.PrimaryRoleWeightedMonths, 0.0)::NUMERIC, 2) AS Months_weighted,
  CASE
    WHEN primary_metrics.PrimaryRoleHasOngoing = 1 THEN CURRENT_DATE::timestamp
    ELSE primary_metrics.PrimaryRoleLatestRecencyAtRaw
  END AS Latest_recency_at,
  CASE
    WHEN primary_metrics.PrimaryRoleHasOngoing = 1 THEN TRUE
    WHEN primary_metrics.PrimaryRoleExperienceRowCount > 0 THEN FALSE
    ELSE NULL
  END AS Latest_recency_is_ongoing
FROM consultant_scope scope
LEFT JOIN role_experience_aggregate aggregate_metrics
  ON aggregate_metrics.ConsultantId = scope.ConsultantId
LEFT JOIN primary_role_experience_metrics primary_metrics
  ON primary_metrics.ConsultantId = scope.ConsultantId
LEFT JOIN primary_role_name primary_role
  ON primary_role.ConsultantId = scope.ConsultantId
LEFT JOIN {LocaleDict} availability_comment_locale
  ON availability_comment_locale.[LocaleKeyId] = scope.AvailabilityCommentLocaleKeyId
 AND availability_comment_locale.[LanguageId] = @SystemLanguage
LEFT JOIN {Department} department_ref
  ON department_ref.[Id] = scope.DepartmentId
 AND department_ref.[TenantId] = @TenantId
LEFT JOIN {LocaleDict} department_locale
  ON department_locale.[LocaleKeyId] = department_ref.[NameLocaleKeyId]
 AND department_locale.[LanguageId] = @SystemLanguage
LEFT JOIN {Department} team_ref
  ON team_ref.[Id] = scope.TeamId
 AND team_ref.[TenantId] = @TenantId
LEFT JOIN {LocaleDict} team_locale
  ON team_locale.[LocaleKeyId] = team_ref.[NameLocaleKeyId]
 AND team_locale.[LanguageId] = @SystemLanguage
LEFT JOIN {Department} unit_ref
  ON unit_ref.[Id] = scope.UnitId
 AND unit_ref.[TenantId] = @TenantId
LEFT JOIN {LocaleDict} unit_locale
  ON unit_locale.[LocaleKeyId] = unit_ref.[NameLocaleKeyId]
 AND unit_locale.[LanguageId] = @SystemLanguage
LEFT JOIN {Department} legal_entity_ref
  ON legal_entity_ref.[Id] = scope.LegalEntityId
 AND legal_entity_ref.[TenantId] = @TenantId
LEFT JOIN {LocaleDict} legal_entity_locale
  ON legal_entity_locale.[LocaleKeyId] = legal_entity_ref.[NameLocaleKeyId]
 AND legal_entity_locale.[LanguageId] = @SystemLanguage
LEFT JOIN {SeniorityLevel} seniority_level_ref
  ON seniority_level_ref.[Id] = scope.SeniorityLevelId
 AND seniority_level_ref.[TenantId] = @TenantId
LEFT JOIN {LocaleDict} seniority_level_locale
  ON seniority_level_locale.[LocaleKeyId] = seniority_level_ref.[NameLocaleKeyId]
 AND seniority_level_locale.[LanguageId] = @SystemLanguage
LEFT JOIN {OfficeLocation} office_location
  ON office_location.[Id] = scope.LocationId
 AND office_location.[TenantId] = @TenantId
LEFT JOIN {LocaleDict} location_locale
  ON location_locale.[LocaleKeyId] = office_location.[NameLocaleKeyId]
 AND location_locale.[LanguageId] = @SystemLanguage
LEFT JOIN {ConsultancyUser} lead_user
  ON lead_user.[Id] = scope.LeadId
 AND lead_user.[TenantId] = @TenantId
ORDER BY
  Full_name,
  scope.ConsultantId
