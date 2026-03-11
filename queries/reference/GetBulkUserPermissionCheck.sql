/* GetBulkUserPermissionCheck : Advanced SQL (Aurora Postgres, ODC)
   Purpose: Evaluate permission checks in bulk from a JSON array payload.

   Input:
     @UserId,
     @PermissionChecksJson,
     @PermissionLevelOnId,
     @PermissionLevelAllId,
     @PermissionLevelOwnId,
     @PermissionLevelMyReportsId,
     @PermissionLevelOffId,
     @PermissionLevelUnavailableId

   JSON item shape:
     PermissionId,
     ExternalConsultantPermissionId,
     PermissionMethodId,
     AffectedConsultancyUserId,
     AffectedConsultantId

   Output columns:
     PermissionId,
     ExternalConsultantPermissionId,
     PermissionMethodId,
     AffectedConsultancyUserId,
     AffectedConsultantId,
     HasPermission,
     PermissionLevelId,
     IsError,
     ErrorReason

   Output contract:
     One output row per parsed item when payload level validation passes.
     Payload level errors return one global error row and no item rows.
     Empty JSON array returns zero rows.
     Super admin returns one row per parsed item with HasPermission = TRUE.
     HasPermission can be NULL when strongest granted level requires target resolution
     (Own or MyReports) and no affected target is provided.
     PermissionLevelId is always the strongest granted level when no error.

   Affected consultant behavior:
     When ExternalConsultantPermissionId is provided and the affected consultant is external,
     permission resolution uses ExternalConsultantPermissionId instead of PermissionId for that item.
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
      WHEN @PermissionChecksJson IS NULL OR TRIM(CAST(@PermissionChecksJson AS TEXT)) = '' THEN 1
      ELSE 0
    END AS MissingPayload
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
payload_parse_state AS (
  SELECT
    input.MissingPayload,
    CASE
      WHEN input.MissingPayload = 1 THEN NULL
      ELSE CAST(@PermissionChecksJson AS jsonb)
    END AS ParsedPayloadJson
  FROM input_state input
),
payload_state AS (
  SELECT
    payload_parse.MissingPayload,
    CASE
      WHEN payload_parse.ParsedPayloadJson IS NOT NULL
       AND jsonb_typeof(payload_parse.ParsedPayloadJson) = 'array'
      THEN 1
      ELSE 0
    END AS IsJsonArray,
    CASE
      WHEN payload_parse.ParsedPayloadJson IS NOT NULL
       AND jsonb_typeof(payload_parse.ParsedPayloadJson) = 'array'
      THEN payload_parse.ParsedPayloadJson
      ELSE '[]'::jsonb
    END AS PayloadArrayJson
  FROM payload_parse_state payload_parse
),
global_error_state AS (
  SELECT
    CASE
      WHEN input.MissingUserId = 1 THEN 'Missing or invalid UserId'
      WHEN current_user_ctx.MatchCount = 0 THEN 'Current user not found in tenant'
      WHEN current_user_ctx.MatchCount > 1 THEN 'Multiple current user mappings found in tenant'
      WHEN input.MissingPermissionLevelConfig = 1 THEN 'Missing permission level configuration input'
      WHEN payload.MissingPayload = 1 THEN 'PermissionChecksJson is required'
      WHEN payload.IsJsonArray = 0 THEN 'PermissionChecksJson must be a JSON array'
      ELSE NULL
    END AS ErrorReason
  FROM input_state input
  CROSS JOIN current_user_scope current_user_ctx
  CROSS JOIN payload_state payload
),
parsed_items_raw AS (
  SELECT
    payload_item.ordinality AS InputOrder,
    payload_item.item_json AS ItemJson
  FROM payload_state payload
  CROSS JOIN LATERAL jsonb_array_elements(payload.PayloadArrayJson) WITH ORDINALITY AS payload_item(item_json, ordinality)
),
parsed_items AS (
  SELECT
    parsed_raw.InputOrder,
    TRIM(COALESCE(parsed_raw.ItemJson ->> 'PermissionId', '')) AS PermissionIdRaw,
    TRIM(COALESCE(parsed_raw.ItemJson ->> 'ExternalConsultantPermissionId', '')) AS ExternalConsultantPermissionIdRaw,
    TRIM(COALESCE(parsed_raw.ItemJson ->> 'PermissionMethodId', '')) AS PermissionMethodIdRaw,
    TRIM(COALESCE(parsed_raw.ItemJson ->> 'AffectedConsultancyUserId', '')) AS AffectedConsultancyUserIdRaw,
    TRIM(COALESCE(parsed_raw.ItemJson ->> 'AffectedConsultantId', '')) AS AffectedConsultantIdRaw
  FROM parsed_items_raw parsed_raw
),
item_input_state AS (
  SELECT
    parsed.InputOrder,
    parsed.PermissionIdRaw,
    parsed.ExternalConsultantPermissionIdRaw,
    parsed.PermissionMethodIdRaw,
    parsed.AffectedConsultancyUserIdRaw,
    parsed.AffectedConsultantIdRaw,
    CASE
      WHEN parsed.PermissionIdRaw <> '' THEN 1
      ELSE 0
    END AS HasPermissionIdInput,
    CASE
      WHEN parsed.PermissionIdRaw ~ '^[0-9]+$' THEN CAST(parsed.PermissionIdRaw AS INTEGER)
      ELSE NULL
    END AS PermissionId,
    CASE
      WHEN parsed.ExternalConsultantPermissionIdRaw ~ '^[0-9]+$' THEN CAST(parsed.ExternalConsultantPermissionIdRaw AS INTEGER)
      ELSE NULL
    END AS ExternalConsultantPermissionId,
    CASE
      WHEN parsed.PermissionMethodIdRaw <> '' THEN 1
      ELSE 0
    END AS HasPermissionMethodInput,
    CASE
      WHEN parsed.PermissionMethodIdRaw ~ '^[0-9]+$'
       AND CAST(parsed.PermissionMethodIdRaw AS INTEGER) > 0
      THEN 1
      ELSE 0
    END AS HasActivePermissionMethodInput,
    CASE
      WHEN parsed.PermissionMethodIdRaw ~ '^[0-9]+$' THEN CAST(parsed.PermissionMethodIdRaw AS INTEGER)
      ELSE NULL
    END AS PermissionMethodId,
    CASE
      WHEN parsed.AffectedConsultancyUserIdRaw <> '' THEN 1
      ELSE 0
    END AS HasAffectedConsultancyUserInput,
    CASE
      WHEN parsed.AffectedConsultancyUserIdRaw <> '' THEN parsed.AffectedConsultancyUserIdRaw
      ELSE NULL
    END AS AffectedConsultancyUserId,
    CASE
      WHEN parsed.AffectedConsultantIdRaw <> '' THEN 1
      ELSE 0
    END AS HasAffectedConsultantInput,
    CASE
      WHEN parsed.AffectedConsultantIdRaw <> '' THEN parsed.AffectedConsultantIdRaw
      ELSE NULL
    END AS AffectedConsultantId
  FROM parsed_items parsed
),
items_for_eval AS (
  SELECT
    item_input.InputOrder,
    item_input.HasPermissionIdInput,
    item_input.PermissionId,
    item_input.ExternalConsultantPermissionId,
    item_input.HasPermissionMethodInput,
    item_input.HasActivePermissionMethodInput,
    item_input.PermissionMethodId,
    item_input.HasAffectedConsultancyUserInput,
    item_input.AffectedConsultancyUserId,
    item_input.HasAffectedConsultantInput,
    item_input.AffectedConsultantId
  FROM item_input_state item_input
  CROSS JOIN super_admin_state super_admin
  WHERE super_admin.IsSuperAdmin = 0
),
item_target_state AS (
  SELECT
    item_input.InputOrder,
    item_input.HasPermissionIdInput,
    item_input.PermissionId,
    item_input.ExternalConsultantPermissionId,
    item_input.HasPermissionMethodInput,
    item_input.HasActivePermissionMethodInput,
    item_input.PermissionMethodId,
    item_input.HasAffectedConsultancyUserInput,
    item_input.AffectedConsultancyUserId,
    item_input.HasAffectedConsultantInput,
    item_input.AffectedConsultantId,
    CASE
      WHEN item_input.HasAffectedConsultancyUserInput = 0 THEN NULL
      WHEN affected_consultancy_user.[Id] IS NOT NULL THEN 1
      ELSE 0
    END AS AffectedConsultancyUserExists,
    CASE
      WHEN item_input.HasAffectedConsultantInput = 0 THEN NULL
      WHEN affected_consultant.[Id] IS NOT NULL THEN 1
      ELSE 0
    END AS AffectedConsultantExists,
    CASE
      WHEN affected_consultant.[IsInternal] = 1 THEN 1
      WHEN affected_consultant.[Id] IS NOT NULL THEN 0
      ELSE NULL
    END AS IsInternalConsultant,
    CASE
      WHEN affected_consultant.[IsInternal] = 1 THEN affected_consultant.[ConsultancyUserId]
      WHEN affected_external_user.[OwnerId] IS NOT NULL
       AND TRIM(CAST(affected_external_user.[OwnerId] AS TEXT)) <> ''
      THEN affected_external_user.[OwnerId]
      WHEN affected_external_user.[CreatorId] IS NOT NULL
       AND TRIM(CAST(affected_external_user.[CreatorId] AS TEXT)) <> ''
      THEN affected_external_user.[CreatorId]
      ELSE NULL
    END AS ConsultantMappedConsultancyUserId,
    CASE
      WHEN affected_consultant.[Id] IS NOT NULL
       AND affected_consultant.[IsInternal] <> 1
       AND (
         affected_external_user.[OwnerId] IS NULL
         OR TRIM(CAST(affected_external_user.[OwnerId] AS TEXT)) = ''
       )
       AND (
         affected_external_user.[CreatorId] IS NULL
         OR TRIM(CAST(affected_external_user.[CreatorId] AS TEXT)) = ''
      )
      THEN 1
      ELSE 0
    END AS ConsultantRequiresAllScope,
    CASE
      WHEN item_input.HasAffectedConsultantInput = 1
       AND affected_consultant.[Id] IS NOT NULL
       AND affected_consultant.[IsInternal] <> 1
       AND item_input.ExternalConsultantPermissionId IS NOT NULL
       AND item_input.ExternalConsultantPermissionId > 0
      THEN item_input.ExternalConsultantPermissionId
      ELSE item_input.PermissionId
    END AS EffectivePermissionId
  FROM items_for_eval item_input
  CROSS JOIN current_user_scope current_user_ctx
  LEFT JOIN {ConsultancyUser} affected_consultancy_user
    ON item_input.HasAffectedConsultancyUserInput = 1
   AND affected_consultancy_user.[TenantId] = current_user_ctx.CurrentTenantId
   AND affected_consultancy_user.[Id] = item_input.AffectedConsultancyUserId
  LEFT JOIN {Consultant} affected_consultant
    ON item_input.HasAffectedConsultantInput = 1
   AND affected_consultant.[TenantId] = current_user_ctx.CurrentTenantId
   AND affected_consultant.[Id] = item_input.AffectedConsultantId
  LEFT JOIN {ExternalUser} affected_external_user
    ON affected_consultant.[IsInternal] <> 1
   AND affected_external_user.[Id] = affected_consultant.[ExternalUserId]
),
item_permission_state AS (
  SELECT
    item_target.InputOrder,
    item_target.HasPermissionIdInput,
    item_target.PermissionId,
    item_target.ExternalConsultantPermissionId,
    item_target.EffectivePermissionId,
    item_target.HasPermissionMethodInput,
    item_target.HasActivePermissionMethodInput,
    item_target.PermissionMethodId,
    item_target.HasAffectedConsultancyUserInput,
    item_target.AffectedConsultancyUserId,
    item_target.HasAffectedConsultantInput,
    item_target.AffectedConsultantId,
    item_target.AffectedConsultancyUserExists,
    item_target.AffectedConsultantExists,
    item_target.IsInternalConsultant,
    item_target.ConsultantMappedConsultancyUserId,
    item_target.ConsultantRequiresAllScope,
    CASE
      WHEN permission.[Id] IS NOT NULL THEN 1
      ELSE 0
    END AS PermissionExists,
    permission.[IsOperation] AS IsOperation,
    permission.[IsBoolean] AS IsBooleanPermission,
    CASE
      WHEN item_target.HasActivePermissionMethodInput = 1
       AND permission_method.[Id] IS NOT NULL
      THEN 1
      ELSE 0
    END AS MethodExists
  FROM item_target_state item_target
  LEFT JOIN {Permission} permission
    ON permission.[Id] = item_target.EffectivePermissionId
  LEFT JOIN {PermissionMethod} permission_method
    ON permission_method.[Id] = item_target.PermissionMethodId
),
item_scope_state AS (
  SELECT
    item_permission.InputOrder,
    item_permission.HasPermissionIdInput,
    item_permission.PermissionId,
    item_permission.ExternalConsultantPermissionId,
    item_permission.EffectivePermissionId,
    item_permission.HasPermissionMethodInput,
    item_permission.HasActivePermissionMethodInput,
    item_permission.PermissionMethodId,
    item_permission.AffectedConsultancyUserId,
    item_permission.AffectedConsultantId,
    item_permission.PermissionExists,
    item_permission.IsOperation,
    item_permission.IsBooleanPermission,
    item_permission.MethodExists,
    item_permission.HasAffectedConsultancyUserInput,
    item_permission.AffectedConsultancyUserExists,
    item_permission.HasAffectedConsultantInput,
    item_permission.AffectedConsultantExists,
    item_permission.ConsultantRequiresAllScope,
    CASE
      WHEN item_permission.HasAffectedConsultancyUserInput = 1
       AND item_permission.HasAffectedConsultantInput = 1
       AND item_permission.AffectedConsultancyUserExists = 1
       AND item_permission.AffectedConsultantExists = 1
       AND item_permission.AffectedConsultancyUserId <> item_permission.ConsultantMappedConsultancyUserId
      THEN 1
      ELSE 0
    END AS AffectedInputsMismatch,
    CASE
      WHEN item_permission.HasAffectedConsultancyUserInput = 1 THEN item_permission.AffectedConsultancyUserId
      WHEN item_permission.HasAffectedConsultantInput = 1 THEN item_permission.ConsultantMappedConsultancyUserId
      ELSE NULL
    END AS EffectiveAffectedConsultancyUserId,
    CASE
      WHEN item_permission.IsBooleanPermission <> 1
       AND item_permission.HasAffectedConsultancyUserInput = 0
       AND item_permission.HasAffectedConsultantInput = 1
       AND item_permission.ConsultantRequiresAllScope = 1
      THEN 1
      ELSE 0
    END AS RequiresAllScope
  FROM item_permission_state item_permission
),
item_candidate_permissions AS (
  SELECT
    item_scope.InputOrder,
    role_permission.[PermissionLevelId] AS PermissionLevelId
  FROM item_scope_state item_scope
  JOIN current_user_roles user_role_ctx
    ON 1 = 1
  JOIN {UserRolePermissions} role_permission
    ON role_permission.[UserRoleId] = user_role_ctx.UserRoleId
  WHERE role_permission.[PermissionId] = item_scope.EffectivePermissionId
    AND (
      (
        item_scope.IsOperation = 0
        AND item_scope.HasActivePermissionMethodInput = 1
        AND role_permission.[PermissionMethodId] = item_scope.PermissionMethodId
      )
      OR (item_scope.IsOperation = 1)
    )
),
item_level_state AS (
  SELECT
    item_scope.InputOrder,
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
        WHEN candidate.InputOrder IS NOT NULL
         AND (
           candidate.PermissionLevelId IS NULL
           OR candidate.PermissionLevelId NOT IN (
             @PermissionLevelOnId,
             @PermissionLevelAllId,
             @PermissionLevelOwnId,
             @PermissionLevelMyReportsId,
             @PermissionLevelOffId,
             @PermissionLevelUnavailableId
           )
         )
        THEN 1
        ELSE 0
      END
    ), 0) AS HasUnknownLevel
  FROM item_scope_state item_scope
  LEFT JOIN item_candidate_permissions candidate
    ON candidate.InputOrder = item_scope.InputOrder
  GROUP BY item_scope.InputOrder
),
item_myreports_hits AS (
  SELECT
    item_scope.InputOrder,
    1 AS IsMyReportsMatch
  FROM item_scope_state item_scope
  JOIN item_level_state item_level
    ON item_level.InputOrder = item_scope.InputOrder
   AND item_level.HasMyReports = 1
  CROSS JOIN current_user_scope current_user_ctx
  JOIN {ConsultancyUserClosure} closure
    ON item_scope.EffectiveAffectedConsultancyUserId IS NOT NULL
   AND closure.[AncestorId] = item_scope.EffectiveAffectedConsultancyUserId
   AND closure.[DescendantId] = current_user_ctx.CurrentConsultancyUserId
  GROUP BY item_scope.InputOrder
),
item_myreports_state AS (
  SELECT
    item_scope.InputOrder,
    CASE
      WHEN myreports_hits.IsMyReportsMatch = 1 THEN 1
      ELSE 0
    END AS IsMyReportsMatch
  FROM item_scope_state item_scope
  LEFT JOIN item_myreports_hits myreports_hits
    ON myreports_hits.InputOrder = item_scope.InputOrder
),
item_error_state AS (
  SELECT
    item_scope.InputOrder,
    CASE
      WHEN item_scope.HasPermissionIdInput = 0
        OR item_scope.PermissionId IS NULL
      THEN 'Missing or invalid PermissionId'
      WHEN item_scope.PermissionExists = 0
      THEN 'Permission not found'
      WHEN item_scope.IsOperation = 1
       AND item_scope.HasActivePermissionMethodInput = 1
      THEN 'Operation permission must not receive active PermissionMethodId'
      WHEN item_scope.IsOperation = 0
       AND item_scope.HasActivePermissionMethodInput = 0
      THEN 'Data permission requires PermissionMethodId'
      WHEN item_scope.IsOperation = 0
       AND item_scope.HasActivePermissionMethodInput = 1
       AND item_scope.MethodExists = 0
      THEN 'PermissionMethodId not found'
      WHEN item_scope.HasAffectedConsultancyUserInput = 1
       AND item_scope.AffectedConsultancyUserExists = 0
      THEN 'Affected ConsultancyUserId not found in tenant'
      WHEN item_scope.HasAffectedConsultantInput = 1
       AND item_scope.AffectedConsultantExists = 0
      THEN 'Affected ConsultantId not found in tenant'
      WHEN item_scope.AffectedInputsMismatch = 1
      THEN 'Affected inputs resolve to different ConsultancyUser records'
      WHEN item_level.HasUnknownLevel = 1
      THEN 'Unknown permission level found in matched role permissions'
      ELSE NULL
    END AS ErrorReason
  FROM item_scope_state item_scope
  JOIN item_level_state item_level
    ON item_level.InputOrder = item_scope.InputOrder
),
item_result_state AS (
  SELECT
    item_scope.InputOrder,
    item_scope.PermissionId AS PermissionId,
    item_scope.ExternalConsultantPermissionId AS ExternalConsultantPermissionId,
    item_scope.PermissionMethodId AS PermissionMethodId,
    item_scope.AffectedConsultancyUserId AS AffectedConsultancyUserId,
    item_scope.AffectedConsultantId AS AffectedConsultantId,
    CASE
      WHEN item_error.ErrorReason IS NOT NULL THEN NULL
      WHEN item_level.HasAll = 1 THEN @PermissionLevelAllId
      WHEN item_level.HasMyReports = 1 THEN @PermissionLevelMyReportsId
      WHEN item_level.HasOwn = 1 THEN @PermissionLevelOwnId
      WHEN item_level.HasOn = 1 THEN @PermissionLevelOnId
      ELSE NULL
    END AS PermissionLevelId,
    CASE
      WHEN item_error.ErrorReason IS NOT NULL THEN FALSE
      WHEN item_scope.RequiresAllScope = 1
       AND item_level.HasAll = 1
      THEN TRUE
      WHEN item_scope.RequiresAllScope = 1 THEN FALSE
      WHEN item_level.HasAll = 1 THEN TRUE
      WHEN item_level.HasMyReports = 1
       AND item_scope.EffectiveAffectedConsultancyUserId IS NULL
      THEN NULL
      WHEN item_level.HasMyReports = 1
       AND item_myreports.IsMyReportsMatch = 1
      THEN TRUE
      WHEN item_level.HasMyReports = 1 THEN FALSE
      WHEN item_level.HasOwn = 1
       AND item_scope.EffectiveAffectedConsultancyUserId IS NULL
      THEN NULL
      WHEN item_level.HasOwn = 1
       AND item_scope.EffectiveAffectedConsultancyUserId = current_user_ctx.CurrentConsultancyUserId
      THEN TRUE
      WHEN item_level.HasOwn = 1 THEN FALSE
      WHEN item_level.HasOn = 1 THEN TRUE
      ELSE FALSE
    END AS HasPermission,
    CASE
      WHEN item_error.ErrorReason IS NOT NULL THEN TRUE
      ELSE FALSE
    END AS IsError,
    CASE
      WHEN item_error.ErrorReason IS NOT NULL THEN item_error.ErrorReason
      ELSE NULL
    END AS ErrorReason
  FROM item_scope_state item_scope
  CROSS JOIN current_user_scope current_user_ctx
  JOIN item_level_state item_level
    ON item_level.InputOrder = item_scope.InputOrder
  JOIN item_myreports_state item_myreports
    ON item_myreports.InputOrder = item_scope.InputOrder
  JOIN item_error_state item_error
    ON item_error.InputOrder = item_scope.InputOrder
),
global_error_result AS (
  SELECT
    0 AS SortGroup,
    0::bigint AS SortOrder,
    NULL::integer AS PermissionId,
    NULL::integer AS ExternalConsultantPermissionId,
    NULL::integer AS PermissionMethodId,
    NULL::text AS AffectedConsultancyUserId,
    NULL::text AS AffectedConsultantId,
    FALSE AS HasPermission,
    NULL::integer AS PermissionLevelId,
    TRUE AS IsError,
    global_error.ErrorReason AS ErrorReason
  FROM global_error_state global_error
  WHERE global_error.ErrorReason IS NOT NULL
),
item_super_admin_result AS (
  SELECT
    1 AS SortGroup,
    item_input.InputOrder AS SortOrder,
    item_input.PermissionId AS PermissionId,
    item_input.ExternalConsultantPermissionId AS ExternalConsultantPermissionId,
    item_input.PermissionMethodId AS PermissionMethodId,
    item_input.AffectedConsultancyUserId AS AffectedConsultancyUserId,
    item_input.AffectedConsultantId AS AffectedConsultantId,
    TRUE AS HasPermission,
    @PermissionLevelAllId AS PermissionLevelId,
    FALSE AS IsError,
    NULL::text AS ErrorReason
  FROM item_input_state item_input
  CROSS JOIN global_error_state global_error
  CROSS JOIN super_admin_state super_admin
  WHERE global_error.ErrorReason IS NULL
    AND super_admin.IsSuperAdmin = 1
),
item_result AS (
  SELECT
    1 AS SortGroup,
    item_result_state.InputOrder AS SortOrder,
    item_result_state.PermissionId AS PermissionId,
    item_result_state.ExternalConsultantPermissionId AS ExternalConsultantPermissionId,
    item_result_state.PermissionMethodId AS PermissionMethodId,
    item_result_state.AffectedConsultancyUserId AS AffectedConsultancyUserId,
    item_result_state.AffectedConsultantId AS AffectedConsultantId,
    item_result_state.HasPermission,
    item_result_state.PermissionLevelId,
    item_result_state.IsError,
    item_result_state.ErrorReason
  FROM item_result_state
  CROSS JOIN global_error_state global_error
  WHERE global_error.ErrorReason IS NULL
),
final_result AS (
  SELECT
    global_result.SortGroup,
    global_result.SortOrder,
    global_result.PermissionId,
    global_result.ExternalConsultantPermissionId,
    global_result.PermissionMethodId,
    global_result.AffectedConsultancyUserId,
    global_result.AffectedConsultantId,
    global_result.HasPermission,
    global_result.PermissionLevelId,
    global_result.IsError,
    global_result.ErrorReason
  FROM global_error_result global_result

  UNION ALL

  SELECT
    super_admin_result.SortGroup,
    super_admin_result.SortOrder,
    super_admin_result.PermissionId,
    super_admin_result.ExternalConsultantPermissionId,
    super_admin_result.PermissionMethodId,
    super_admin_result.AffectedConsultancyUserId,
    super_admin_result.AffectedConsultantId,
    super_admin_result.HasPermission,
    super_admin_result.PermissionLevelId,
    super_admin_result.IsError,
    super_admin_result.ErrorReason
  FROM item_super_admin_result super_admin_result

  UNION ALL

  SELECT
    item_result.SortGroup,
    item_result.SortOrder,
    item_result.PermissionId,
    item_result.ExternalConsultantPermissionId,
    item_result.PermissionMethodId,
    item_result.AffectedConsultancyUserId,
    item_result.AffectedConsultantId,
    item_result.HasPermission,
    item_result.PermissionLevelId,
    item_result.IsError,
    item_result.ErrorReason
  FROM item_result
)
SELECT
  final_result.PermissionId AS PermissionId,
  final_result.ExternalConsultantPermissionId AS ExternalConsultantPermissionId,
  final_result.PermissionMethodId AS PermissionMethodId,
  final_result.AffectedConsultancyUserId AS AffectedConsultancyUserId,
  final_result.AffectedConsultantId AS AffectedConsultantId,
  final_result.HasPermission AS HasPermission,
  final_result.PermissionLevelId AS PermissionLevelId,
  final_result.IsError AS IsError,
  final_result.ErrorReason AS ErrorReason
FROM final_result
ORDER BY
  final_result.SortGroup,
  final_result.SortOrder
