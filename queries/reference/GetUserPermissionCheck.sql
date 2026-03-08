/* GetUserPermissionCheck : Advanced SQL (Aurora Postgres, ODC)
   Purpose: Unified permission evaluation that always returns strongest granted PermissionLevelId.

   Input:
     @UserId,
     @PermissionId,
     @PermissionMethodId,
     @AffectedConsultancyUserId,
     @AffectedConsultantId,
     @PermissionLevelOnId,
     @PermissionLevelAllId,
     @PermissionLevelOwnId,
     @PermissionLevelMyReportsId,
     @PermissionLevelOffId,
     @PermissionLevelUnavailableId

   Output columns (ordered):
     HasPermission,
     PermissionLevelId,
     IsError,
     ErrorReason

   Output contract:
     HasPermission is always FALSE when IsError is TRUE.
     HasPermission can be NULL when strongest granted level requires target resolution
     (Own or MyReports) and no affected target is provided.
     ErrorReason is NULL when IsError is FALSE.
     PermissionLevelId is always the strongest granted level when no error.

   Strongest level precedence:
     All, MyReports, Own, On

   Tenant behavior:
     Tenant scope is inferred from current ConsultancyUser resolved by @UserId.
     Affected target records must belong to the same inferred tenant.

   Affected consultant behavior:
     Internal consultant target resolves through Consultant.ConsultancyUserId.
     External consultant target resolves through ExternalUser.OwnerId, then ExternalUser.CreatorId.
     If an external consultant has neither OwnerId nor CreatorId, non-boolean permissions require All scope.

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
  WHERE consultancy_user_role.[ConsultancyUserId] = current_user_ctx.CurrentConsultancyUserId
),
super_admin_state AS (
  SELECT
    CASE
      WHEN EXISTS (
        SELECT 1
        FROM current_user_roles user_role_ctx
        JOIN {UserRole} user_role
          ON user_role.[Id] = user_role_ctx.UserRoleId
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
    CASE
      WHEN consultant.[IsInternal] = 1 THEN consultant.[ConsultancyUserId]
      WHEN external_user.[OwnerId] IS NOT NULL
       AND TRIM(CAST(external_user.[OwnerId] AS TEXT)) <> ''
      THEN external_user.[OwnerId]
      WHEN external_user.[CreatorId] IS NOT NULL
       AND TRIM(CAST(external_user.[CreatorId] AS TEXT)) <> ''
      THEN external_user.[CreatorId]
      ELSE NULL
    END AS ConsultantMappedConsultancyUserId,
    CASE
      WHEN consultant.[IsInternal] <> 1
       AND (
         external_user.[OwnerId] IS NULL
         OR TRIM(CAST(external_user.[OwnerId] AS TEXT)) = ''
       )
       AND (
         external_user.[CreatorId] IS NULL
         OR TRIM(CAST(external_user.[CreatorId] AS TEXT)) = ''
       )
      THEN 1
      ELSE 0
    END AS ConsultantRequiresAllScope
  FROM {Consultant} consultant
  CROSS JOIN input_state input
  CROSS JOIN current_user_scope current_user_ctx
  LEFT JOIN {ExternalUser} external_user
    ON consultant.[IsInternal] <> 1
   AND external_user.[Id] = consultant.[ExternalUserId]
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
    ) AS ConsultantMappedConsultancyUserId,
    (
      SELECT lookup_consultant.ConsultantRequiresAllScope
      FROM affected_consultant_lookup lookup_consultant
      LIMIT 1
    ) AS ConsultantRequiresAllScope
  FROM input_state input
),
affected_state AS (
  SELECT
    affected_user.HasAffectedConsultancyUserInput,
    affected_consultant.HasAffectedConsultantInput,
    affected_user.AffectedConsultancyUserExists,
    affected_consultant.AffectedConsultantExists,
    affected_consultant.ConsultantMappedConsultancyUserId,
    affected_consultant.ConsultantRequiresAllScope,
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
  CROSS JOIN method_state method_eval
  JOIN {UserRolePermissions} user_role_permission
    ON user_role_permission.[UserRoleId] = user_role_ctx.UserRoleId
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
    COALESCE(MAX(
      CASE
        WHEN candidate.PermissionLevelId = @PermissionLevelOnId THEN 1
        ELSE 0
      END
    ), 0) AS HasOn,
    COALESCE(MAX(
      CASE
        WHEN candidate.PermissionLevelId = @PermissionLevelAllId THEN 1
        ELSE 0
      END
    ), 0) AS HasAll,
    COALESCE(MAX(
      CASE
        WHEN candidate.PermissionLevelId = @PermissionLevelOwnId THEN 1
        ELSE 0
      END
    ), 0) AS HasOwn,
    COALESCE(MAX(
      CASE
        WHEN candidate.PermissionLevelId = @PermissionLevelMyReportsId THEN 1
        ELSE 0
      END
    ), 0) AS HasMyReports,
    COALESCE(MAX(
      CASE
        WHEN candidate.PermissionLevelId NOT IN (
          @PermissionLevelOnId,
          @PermissionLevelAllId,
          @PermissionLevelOwnId,
          @PermissionLevelMyReportsId,
          @PermissionLevelOffId,
          @PermissionLevelUnavailableId
        ) THEN 1
        ELSE 0
      END
    ), 0) AS HasUnknownLevel
  FROM candidate_permissions candidate
),
my_reports_state AS (
  SELECT
    CASE
      WHEN myreports_hit.IsMyReportsMatch = 1 THEN 1
      ELSE 0
    END AS IsMyReportsMatch
  FROM candidate_level_state levels
  CROSS JOIN affected_state affected
  LEFT JOIN LATERAL (
    SELECT
      1 AS IsMyReportsMatch
    FROM {ConsultancyUserClosure} closure
    CROSS JOIN current_user_scope current_user_ctx
    WHERE levels.HasMyReports = 1
      AND affected.EffectiveAffectedConsultancyUserId IS NOT NULL
      AND closure.[AncestorId] = affected.EffectiveAffectedConsultancyUserId
      AND closure.[DescendantId] = current_user_ctx.CurrentConsultancyUserId
    LIMIT 1
  ) myreports_hit ON TRUE
),
grant_state AS (
  SELECT
    CASE
      WHEN levels.HasAll = 1 THEN @PermissionLevelAllId
      WHEN levels.HasMyReports = 1 THEN @PermissionLevelMyReportsId
      WHEN levels.HasOwn = 1 THEN @PermissionLevelOwnId
      WHEN levels.HasOn = 1 THEN @PermissionLevelOnId
      ELSE NULL
    END AS StrongestPermissionLevelId,
    affected.EffectiveAffectedConsultancyUserId,
    CASE
      WHEN permission_eval.IsBooleanPermission <> 1
       AND affected.HasAffectedConsultancyUserInput = 0
       AND affected.HasAffectedConsultantInput = 1
       AND affected.ConsultantRequiresAllScope = 1
      THEN 1
      ELSE 0
    END AS RequiresAllScope,
    CASE
      WHEN affected.EffectiveAffectedConsultancyUserId = current_user_ctx.CurrentConsultancyUserId THEN 1
      ELSE 0
    END AS IsOwnMatch,
    my_reports.IsMyReportsMatch,
    CASE
      WHEN levels.HasAll = 1 OR levels.HasOn = 1 THEN 1
      WHEN levels.HasOwn = 1 THEN 1
      WHEN levels.HasMyReports = 1 THEN 1
      ELSE 0
    END AS HasAnyGrant
  FROM candidate_level_state levels
  CROSS JOIN affected_state affected
  CROSS JOIN current_user_scope current_user_ctx
  CROSS JOIN my_reports_state my_reports
  CROSS JOIN permission_state permission_eval
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
      WHEN input.MissingPermissionLevelConfig = 1 THEN 'Missing permission level configuration input'
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
      WHEN affected.HasAffectedConsultancyUserInput = 1
       AND affected.AffectedConsultancyUserExists = 0
      THEN 'Affected ConsultancyUserId not found in tenant'
      WHEN affected.HasAffectedConsultantInput = 1
       AND affected.AffectedConsultantExists = 0
      THEN 'Affected ConsultantId not found in tenant'
      WHEN affected.AffectedInputsMismatch = 1
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
    WHEN grant_eval.RequiresAllScope = 1
      AND grant_eval.StrongestPermissionLevelId = @PermissionLevelAllId
    THEN TRUE
    WHEN grant_eval.RequiresAllScope = 1 THEN FALSE
    WHEN grant_eval.StrongestPermissionLevelId = @PermissionLevelAllId THEN TRUE
    WHEN grant_eval.StrongestPermissionLevelId = @PermissionLevelOnId THEN TRUE
    WHEN grant_eval.StrongestPermissionLevelId = @PermissionLevelOwnId
      AND grant_eval.EffectiveAffectedConsultancyUserId IS NULL
    THEN NULL
    WHEN grant_eval.StrongestPermissionLevelId = @PermissionLevelOwnId
      AND grant_eval.IsOwnMatch = 1
    THEN TRUE
    WHEN grant_eval.StrongestPermissionLevelId = @PermissionLevelOwnId THEN FALSE
    WHEN grant_eval.StrongestPermissionLevelId = @PermissionLevelMyReportsId
      AND grant_eval.EffectiveAffectedConsultancyUserId IS NULL
    THEN NULL
    WHEN grant_eval.StrongestPermissionLevelId = @PermissionLevelMyReportsId
      AND grant_eval.IsMyReportsMatch = 1
    THEN TRUE
    WHEN grant_eval.StrongestPermissionLevelId = @PermissionLevelMyReportsId THEN FALSE
    WHEN grant_eval.HasAnyGrant = 1 THEN TRUE
    ELSE FALSE
  END AS HasPermission,
  CASE
    WHEN final_eval.IsError = 1 THEN NULL
    WHEN super_admin.IsSuperAdmin = 1 THEN @PermissionLevelAllId
    ELSE grant_eval.StrongestPermissionLevelId
  END AS PermissionLevelId,
  CASE
    WHEN final_eval.IsError = 1 THEN TRUE
    ELSE FALSE
  END AS IsError,
  CASE
    WHEN final_eval.IsError = 1 THEN final_eval.ErrorReason
    ELSE NULL
  END AS ErrorReason
FROM final_state final_eval
CROSS JOIN super_admin_state super_admin
CROSS JOIN grant_state grant_eval
