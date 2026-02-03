/* GetCompanyInternalConsultantEngagementSummary : Advanced SQL (Aurora Postgres, ODC)
   Purpose: Company summary of internal active consultants with engagement counts and months.
*/

SELECT
  company.[Id] AS CompanyId,
  company.[Name] AS CompanyName,
  COUNT(engagement.[Id]) AS EngagementCount,
  COUNT(DISTINCT consultant.[Id]) AS ConsultantCount,
  SUM(
    CASE
      WHEN engagement.[StartDate] IS NOT NULL
        AND engagement.[EndDate] IS NOT NULL
        AND engagement.[EndDate] >= engagement.[StartDate]
      THEN
        (EXTRACT(YEAR FROM AGE(engagement.[EndDate], engagement.[StartDate])) * 12)
        + EXTRACT(MONTH FROM AGE(engagement.[EndDate], engagement.[StartDate]))
        + (EXTRACT(DAY FROM AGE(engagement.[EndDate], engagement.[StartDate])) / 30.0)
      ELSE NULL
    END
  ) AS TotalMonths,
  COALESCE(
    CAST(
      json_agg(
        DISTINCT CONCAT_WS(' ', consultancy_user.[FirstName], consultancy_user.[LastName])
        ORDER BY CONCAT_WS(' ', consultancy_user.[FirstName], consultancy_user.[LastName])
      ) AS TEXT
    ),
    NULL
  ) AS ConsultantsJson,
  NULL AS Consultants
FROM {Company} company
/* _____________ Company_to_project_to_engagement _____________ */
JOIN {Project} project
  ON project.[ClientCompanyId] = company.[Id]
JOIN {Engagement} engagement
  ON engagement.[ProjectId] = project.[Id]
JOIN {Consultant} consultant
  ON consultant.[Id] = engagement.[ConsultantId]
  AND consultant.[IsInternal] = 1
JOIN {Status} consultant_status
  ON consultant_status.[Id] = consultant.[StatusId]
  AND consultant_status.[IsActive] = 1
JOIN {ConsultancyUser} consultancy_user
  ON consultancy_user.[Id] = consultant.[ConsultancyUserId]
JOIN {Status} employment_status
  ON employment_status.[Id] = consultancy_user.[EmploymentStatusId]
  AND employment_status.[IsActive] = 1
/* _____________ Tenant_filter_and_grouping _____________ */
WHERE company.[TenantId] = @TenantId
GROUP BY
  company.[Id],
  company.[Name]
ORDER BY
  company.[Name]
