/* GetUserPermissionCheck : Advanced SQL (Aurora Postgres, ODC)
   Purpose: Unified permission evaluation for detail actions and list views.

   Modes:
     Detail mode      : @IsListView = 0
       Uses affected target inputs and returns final HasPermission decision.
     List view mode   : @IsListView = 1
       Does not evaluate per row target in this query.
       Returns strongest granted PermissionLevelId for caller side filtering.

   Input:
     @UserId,
     @PermissionId,
     @PermissionMethodId,
     @IsListView,
     @AffectedConsultancyUserId,
     @AffectedConsultantId,
     @PermissionMethodViewId,
     @PermissionLevelOnId,
     @PermissionLevelAllId,
     @PermissionLevelOwnId,
     @PermissionLevelMyReportsId,
     @PermissionLevelOffId,
     @PermissionLevelUnavailableId

   Output columns (ordered):
     HasPermission,
     IsError,
     ErrorReason,
     PermissionLevelId

   Output contract:
     HasPermission is always FALSE when IsError is TRUE.
     ErrorReason is NULL when IsError is FALSE.
     PermissionLevelId is populated only for list view grants.
     Detail mode always returns PermissionLevelId as NULL.

   List mode strongest level precedence:
     All, MyReports, Own, On

   Super admin behavior:
     If current user has IsSuperAdmin role, query returns immediate grant
     and skips downstream permission and payload validation.

   Tenant behavior:
     Tenant scope is inferred from current ConsultancyUser resolved by @UserId.
     Affected target records must belong to the same inferred tenant.

   Boolean permission behavior:
     When Permission.IsBooleanPermission = 1, affected target input is optional.
     Missing affected target is not an error for boolean permissions.
*/
WITH
input_state AS (
  SELECT
    CASE
      WHEN @UserId IS NULL OR TRIM(CAST(@UserId AS TEXT)) = '' THEN 1
      ELSE 0
    END AS MissingUserId,
    CASE
      WHEN @PermissionId IS NULL OR @PermissionId <= 0 THEN 1
      ELSE 0
    END AS MissingPermissionId,
    CASE
      WHEN @IsListView IS NULL OR @IsListView NOT IN (0, 1) THEN 1
      ELSE 0
    END AS InvalidIsListView,
    CASE
      WHEN @PermissionMethodViewId IS NULL OR @PermissionMethodViewId <= 0 THEN 1
      ELSE 0
    END AS MissingPermissionMethodViewId,
    CASE
      WHEN @PermissionLevelOnId IS NULL
        OR @PermissionLevelAllId IS NULL
        OR @PermissionLevelOwnId IS NULL
        OR @PermissionLevelMyReportsId IS NULL
        OR @PermissionLevelOffId IS NULL
        OR @PermissionLevelUnavailableId IS NULL
      THEN 1
      ELSE 0
    END AS MissingPermissionLevelConfig,
    CASE
      WHEN @AffectedConsultancyUserId IS NOT NULL
       AND TRIM(CAST(@AffectedConsultancyUserId AS TEXT)) <> ''
      THEN 1
      ELSE 0
    END AS HasAffectedConsultancyUserInput,
    CASE
      WHEN @AffectedConsultantId IS NOT NULL
       AND TRIM(CAST(@AffectedConsultantId AS TEXT)) <> ''
      THEN 1
      ELSE 0
    END AS HasAffectedConsultantInput
),
current_user_scope AS (
  SELECT
    COUNT(*) AS MatchCount,
    MIN(consultancy_user.[Id]) AS CurrentConsultancyUserId,
    MIN(consultancy_user.[TenantId]) AS CurrentTenantId
  FROM {ConsultancyUser} consultancy_user
  WHERE consultancy_user.[UserId] = @UserId
),
current_user_roles AS (
  SELECT
    consultancy_user_role.[UserRoleId] AS UserRoleId
  FROM {ConsultancyUserRoles} consultancy_user_role
  CROSS JOIN current_user_scope current_user_ctx
  WHERE consultancy_user_role.[TenantId] = current_user_ctx.CurrentTenantId
    AND consultancy_user_role.[ConsultancyUserId] = current_user_ctx.CurrentConsultancyUserId
),
super_admin_state AS (
  SELECT
    CASE
      WHEN EXISTS (
        SELECT 1
        FROM current_user_roles user_role_ctx
        CROSS JOIN current_user_scope current_user_ctx
        JOIN {UserRole} user_role
          ON user_role.[Id] = user_role_ctx.UserRoleId
         AND user_role.[TenantId] = current_user_ctx.CurrentTenantId
        WHERE user_role.[IsSuperAdmin] = 1
      ) THEN 1
      ELSE 0
    END AS IsSuperAdmin
),
permission_scope AS (
  SELECT
    permission.[Id] AS PermissionId,
    permission.[IsOperation] AS IsOperation,
    permission.[IsBooleanPermission] AS IsBooleanPermission
  FROM {Permission} permission
  WHERE permission.[Id] = @PermissionId
),
permission_state AS (
  SELECT
    CASE
      WHEN EXISTS (SELECT 1 FROM permission_scope) THEN 1
      ELSE 0
    END AS PermissionExists,
    (
      SELECT permission_scope.IsOperation
      FROM permission_scope
      LIMIT 1
    ) AS IsOperation,
    (
      SELECT permission_scope.IsBooleanPermission
      FROM permission_scope
      LIMIT 1
    ) AS IsBooleanPermission
),
method_state AS (
  SELECT
    CASE
      WHEN @PermissionMethodId IS NOT NULL
       AND @PermissionMethodId > 0
      THEN 1
      ELSE 0
    END AS HasActivePermissionMethodInput,
    CASE
      WHEN @PermissionMethodId IS NOT NULL
       AND @PermissionMethodId > 0
       AND EXISTS (
        SELECT 1
        FROM {PermissionMethod} permission_method
        WHERE permission_method.[Id] = @PermissionMethodId
      ) THEN 1
      ELSE 0
    END AS MethodExists
),
affected_consultancy_user_state AS (
  SELECT
    input.HasAffectedConsultancyUserInput,
    CASE
      WHEN input.HasAffectedConsultancyUserInput = 0 THEN NULL
      WHEN EXISTS (
        SELECT 1
        FROM {ConsultancyUser} affected_consultancy_user
        CROSS JOIN current_user_scope current_user_ctx
        WHERE affected_consultancy_user.[TenantId] = current_user_ctx.CurrentTenantId
          AND affected_consultancy_user.[Id] = @AffectedConsultancyUserId
      ) THEN 1
      ELSE 0
    END AS AffectedConsultancyUserExists,
    CASE
      WHEN input.HasAffectedConsultancyUserInput = 1 THEN CAST(@AffectedConsultancyUserId AS TEXT)
      ELSE NULL
    END AS AffectedConsultancyUserIdResolved
  FROM input_state input
),
affected_consultant_lookup AS (
  SELECT
    consultant.[ConsultancyUserId] AS ConsultantMappedConsultancyUserId
  FROM {Consultant} consultant
  CROSS JOIN input_state input
  CROSS JOIN current_user_scope current_user_ctx
  WHERE input.HasAffectedConsultantInput = 1
    AND consultant.[TenantId] = current_user_ctx.CurrentTenantId
    AND consultant.[Id] = @AffectedConsultantId
),
affected_consultant_state AS (
  SELECT
    input.HasAffectedConsultantInput,
    CASE
      WHEN input.HasAffectedConsultantInput = 0 THEN NULL
      WHEN EXISTS (SELECT 1 FROM affected_consultant_lookup) THEN 1
      ELSE 0
    END AS AffectedConsultantExists,
    (
      SELECT lookup_consultant.ConsultantMappedConsultancyUserId
      FROM affected_consultant_lookup lookup_consultant
      LIMIT 1
    ) AS ConsultantMappedConsultancyUserId
  FROM input_state input
),
affected_state AS (
  SELECT
    affected_user.HasAffectedConsultancyUserInput,
    affected_consultant.HasAffectedConsultantInput,
    affected_user.AffectedConsultancyUserExists,
    affected_consultant.AffectedConsultantExists,
    affected_consultant.ConsultantMappedConsultancyUserId,
    CASE
      WHEN affected_user.HasAffectedConsultancyUserInput = 1
       AND affected_consultant.HasAffectedConsultantInput = 1
       AND affected_user.AffectedConsultancyUserExists = 1
       AND affected_consultant.AffectedConsultantExists = 1
       AND affected_user.AffectedConsultancyUserIdResolved <> affected_consultant.ConsultantMappedConsultancyUserId
      THEN 1
      ELSE 0
    END AS AffectedInputsMismatch,
    CASE
      WHEN affected_user.HasAffectedConsultancyUserInput = 1
      THEN affected_user.AffectedConsultancyUserIdResolved
      WHEN affected_consultant.HasAffectedConsultantInput = 1
      THEN affected_consultant.ConsultantMappedConsultancyUserId
      ELSE NULL
    END AS EffectiveAffectedConsultancyUserId
  FROM affected_consultancy_user_state affected_user
  CROSS JOIN affected_consultant_state affected_consultant
),
candidate_permissions AS (
  SELECT
    user_role_permission.[PermissionLevelId] AS PermissionLevelId
  FROM current_user_roles user_role_ctx
  CROSS JOIN current_user_scope current_user_ctx
  CROSS JOIN method_state method_eval
  JOIN {UserRolePermissions} user_role_permission
    ON user_role_permission.[UserRoleId] = user_role_ctx.UserRoleId
   AND user_role_permission.[TenantId] = current_user_ctx.CurrentTenantId
  CROSS JOIN permission_state permission_eval
  WHERE user_role_permission.[PermissionId] = @PermissionId
    AND (
      (
        permission_eval.IsOperation = 0
        AND method_eval.HasActivePermissionMethodInput = 1
        AND user_role_permission.[PermissionMethodId] = @PermissionMethodId
      )
      OR (permission_eval.IsOperation = 1)
    )
),
candidate_level_state AS (
  SELECT
    CASE
      WHEN EXISTS (
        SELECT 1
        FROM candidate_permissions candidate
        WHERE candidate.PermissionLevelId = @PermissionLevelOnId
      ) THEN 1
      ELSE 0
    END AS HasOn,
    CASE
      WHEN EXISTS (
        SELECT 1
        FROM candidate_permissions candidate
        WHERE candidate.PermissionLevelId = @PermissionLevelAllId
      ) THEN 1
      ELSE 0
    END AS HasAll,
    CASE
      WHEN EXISTS (
        SELECT 1
        FROM candidate_permissions candidate
        WHERE candidate.PermissionLevelId = @PermissionLevelOwnId
      ) THEN 1
      ELSE 0
    END AS HasOwn,
    CASE
      WHEN EXISTS (
        SELECT 1
        FROM candidate_permissions candidate
        WHERE candidate.PermissionLevelId = @PermissionLevelMyReportsId
      ) THEN 1
      ELSE 0
    END AS HasMyReports,
    CASE
      WHEN EXISTS (
        SELECT 1
        FROM candidate_permissions candidate
        WHERE candidate.PermissionLevelId = @PermissionLevelOffId
      ) THEN 1
      ELSE 0
    END AS HasOff,
    CASE
      WHEN EXISTS (
        SELECT 1
        FROM candidate_permissions candidate
        WHERE candidate.PermissionLevelId = @PermissionLevelUnavailableId
      ) THEN 1
      ELSE 0
    END AS HasUnavailable,
    CASE
      WHEN EXISTS (
        SELECT 1
        FROM candidate_permissions candidate
        WHERE candidate.PermissionLevelId NOT IN (
          @PermissionLevelOnId,
          @PermissionLevelAllId,
          @PermissionLevelOwnId,
          @PermissionLevelMyReportsId,
          @PermissionLevelOffId,
          @PermissionLevelUnavailableId
        )
      ) THEN 1
      ELSE 0
    END AS HasUnknownLevel
),
my_reports_state AS (
  SELECT
    CASE
      WHEN @IsListView = 1 THEN 0
      WHEN EXISTS (
        SELECT 1
        FROM {ConsultancyUserClosure} closure
        CROSS JOIN current_user_scope current_user_ctx
        CROSS JOIN affected_state affected
        WHERE closure.[TenantId] = current_user_ctx.CurrentTenantId
          AND closure.[AncestorId] = affected.EffectiveAffectedConsultancyUserId
          AND closure.[DescendantId] = current_user_ctx.CurrentConsultancyUserId
      ) THEN 1
      ELSE 0
    END AS IsMyReportsMatch
),
grant_state AS (
  SELECT
    CASE
      WHEN levels.HasAll = 1 THEN @PermissionLevelAllId
      WHEN levels.HasMyReports = 1 THEN @PermissionLevelMyReportsId
      WHEN levels.HasOwn = 1 THEN @PermissionLevelOwnId
      WHEN levels.HasOn = 1 THEN @PermissionLevelOnId
      ELSE NULL
    END AS ListGrantedPermissionLevelId,
    CASE
      WHEN levels.HasAll = 1 OR levels.HasOn = 1 THEN 1
      WHEN levels.HasOwn = 1
       AND affected.EffectiveAffectedConsultancyUserId = current_user_ctx.CurrentConsultancyUserId
      THEN 1
      WHEN levels.HasMyReports = 1
       AND my_reports.IsMyReportsMatch = 1
      THEN 1
      ELSE 0
    END AS NonListGranted
  FROM candidate_level_state levels
  CROSS JOIN affected_state affected
  CROSS JOIN current_user_scope current_user_ctx
  CROSS JOIN my_reports_state my_reports
),
pre_super_admin_error_state AS (
  SELECT
    CASE
      WHEN input.MissingUserId = 1 THEN 'Missing or invalid UserId'
      WHEN current_user_ctx.MatchCount = 0 THEN 'Current user not found in tenant'
      WHEN current_user_ctx.MatchCount > 1 THEN 'Multiple current user mappings found in tenant'
      ELSE NULL
    END AS ErrorReason
  FROM input_state input
  CROSS JOIN current_user_scope current_user_ctx
),
post_super_admin_error_state AS (
  SELECT
    CASE
      WHEN input.MissingPermissionId = 1 THEN 'Missing or invalid PermissionId'
      WHEN input.InvalidIsListView = 1 THEN 'Missing or invalid IsListView value'
      WHEN input.MissingPermissionLevelConfig = 1 THEN 'Missing permission level configuration input'
      WHEN @IsListView = 1
       AND input.MissingPermissionMethodViewId = 1
      THEN 'Missing or invalid PermissionMethodViewId'
      WHEN permission_eval.PermissionExists = 0 THEN 'Permission not found'
      WHEN permission_eval.IsOperation = 1
       AND method_eval.HasActivePermissionMethodInput = 1
      THEN 'Operation permission must not receive active PermissionMethodId'
      WHEN permission_eval.IsOperation = 0
       AND method_eval.HasActivePermissionMethodInput = 0
      THEN 'Data permission requires PermissionMethodId'
      WHEN permission_eval.IsOperation = 0
       AND method_eval.HasActivePermissionMethodInput = 1
       AND method_eval.MethodExists = 0
      THEN 'PermissionMethodId not found'
      WHEN @IsListView = 1
       AND (affected.HasAffectedConsultancyUserInput = 1 OR affected.HasAffectedConsultantInput = 1)
      THEN 'List view mode must not receive affected target inputs'
      WHEN @IsListView = 1
       AND permission_eval.IsOperation = 0
       AND method_eval.HasActivePermissionMethodInput = 1
       AND @PermissionMethodId <> @PermissionMethodViewId
      THEN 'List view mode requires View PermissionMethodId for data permission'
      WHEN @IsListView = 0
       AND permission_eval.IsBooleanPermission = 0
       AND affected.HasAffectedConsultancyUserInput = 0
       AND affected.HasAffectedConsultantInput = 0
      THEN 'Non list mode requires affected target input'
      WHEN permission_eval.IsBooleanPermission = 0
       AND affected.HasAffectedConsultancyUserInput = 1
       AND affected.AffectedConsultancyUserExists = 0
      THEN 'Affected ConsultancyUserId not found in tenant'
      WHEN permission_eval.IsBooleanPermission = 0
       AND affected.HasAffectedConsultantInput = 1
       AND affected.AffectedConsultantExists = 0
      THEN 'Affected ConsultantId not found in tenant'
      WHEN permission_eval.IsBooleanPermission = 0
       AND affected.AffectedInputsMismatch = 1
      THEN 'Affected inputs resolve to different ConsultancyUser records'
      WHEN levels.HasUnknownLevel = 1
      THEN 'Unknown permission level found in matched role permissions'
      ELSE NULL
    END AS ErrorReason
  FROM input_state input
  CROSS JOIN permission_state permission_eval
  CROSS JOIN method_state method_eval
  CROSS JOIN affected_state affected
  CROSS JOIN candidate_level_state levels
),
resolved_error_state AS (
  SELECT
    CASE
      WHEN pre_error.ErrorReason IS NOT NULL THEN pre_error.ErrorReason
      WHEN super_admin.IsSuperAdmin = 1 THEN NULL
      ELSE post_error.ErrorReason
    END AS ErrorReason
  FROM pre_super_admin_error_state pre_error
  CROSS JOIN super_admin_state super_admin
  CROSS JOIN post_super_admin_error_state post_error
),
final_state AS (
  SELECT
    CASE
      WHEN resolved_error.ErrorReason IS NOT NULL THEN 1
      ELSE 0
    END AS IsError,
    resolved_error.ErrorReason AS ErrorReason
  FROM resolved_error_state resolved_error
)
SELECT
  CASE
    WHEN final_eval.IsError = 1 THEN FALSE
    WHEN super_admin.IsSuperAdmin = 1 THEN TRUE
    WHEN @IsListView = 1 AND grant_eval.ListGrantedPermissionLevelId IS NOT NULL THEN TRUE
    WHEN @IsListView = 0 AND grant_eval.NonListGranted = 1 THEN TRUE
    ELSE FALSE
  END AS HasPermission,
  CASE
    WHEN final_eval.IsError = 1 THEN TRUE
    ELSE FALSE
  END AS IsError,
  CASE
    WHEN final_eval.IsError = 1 THEN final_eval.ErrorReason
    ELSE NULL
  END AS ErrorReason,
  CASE
    WHEN final_eval.IsError = 1 THEN NULL
    WHEN super_admin.IsSuperAdmin = 1 THEN NULL
    WHEN @IsListView = 1 THEN grant_eval.ListGrantedPermissionLevelId
    ELSE NULL
  END AS PermissionLevelId
FROM final_state final_eval
CROSS JOIN super_admin_state super_admin
CROSS JOIN grant_state grant_eval
