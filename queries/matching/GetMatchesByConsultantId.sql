/* GetMatchesByConsultantId : Advanced SQL (Aurora Postgres, ODC)
   Purpose: return demand matches for a consultant with scoring and paging.

   This is the inverse scoring query. Returns only IDs and scores.
   Starts from a consultant and finds all demands whose requirements match the
   consultant's experiences. Same scoring formula as GetMatchesByDemandId,
   but with inverted join direction and no filter enforcement.

   Display data (demand names, details, etc.) comes from GetDemandMatchPreview.

   Input:
     @TenantId,
     @ConsultantId,
     @UserId,
     @IsMatchicalAdmin,
     @StartIndex,
     @MaxRecords,
     @UseCustomRoles,
     @Cat_Role,
     @Cat_RoleSkill,
     @Cat_CustomRole,
     @Cat_CustomRoleSkill,
     @Cat_Language,
     @Cat_FunctionalArea,
     @Cat_Industry,
     @PermissionInternalConsultantId,
     @PermissionExternalConsultantId,
     @PermissionOpportunityId,
     @PermissionLevelOnId,
     @PermissionLevelAllId,
     @PermissionLevelOwnId,
     @PermissionLevelMyReportsId

   Performance note:
     • Permission gating is resolved inline inside this query.
     • Matchical admin, super admin, and global grant paths skip owner/creator/co_owner lookups.
     • ConsultancyUserClosure is only touched in the MyReports path.
     • Matching visibility permissions are treated as operation/feature permissions and ignore PermissionMethodId.

   Output columns (ordered):
     DemandId, MatchingScore, PricePerformanceScore, MatchedRequirementsCount, Count
*/

WITH
input_state AS (
  SELECT
    CASE
      WHEN @IsMatchicalAdmin = 1 THEN 1
      ELSE 0
    END AS IsMatchicalAdmin
),
current_user_scope AS (
  SELECT
    COUNT(*) AS MatchCount,
    MIN(consultancy_user.[Id]) AS CurrentConsultancyUserId
  FROM {ConsultancyUser} consultancy_user
  CROSS JOIN input_state input
  WHERE input.IsMatchicalAdmin <> 1
    AND consultancy_user.[TenantId] = @TenantId
    AND consultancy_user.[UserId] = @UserId
),
current_user_roles AS (
  SELECT
    consultancy_user_role.[UserRoleId] AS UserRoleId
  FROM {ConsultancyUserRoles} consultancy_user_role
  CROSS JOIN input_state input
  CROSS JOIN current_user_scope current_user_ctx
  WHERE input.IsMatchicalAdmin <> 1
    AND current_user_ctx.MatchCount = 1
    AND consultancy_user_role.[ConsultancyUserId] = current_user_ctx.CurrentConsultancyUserId
),
super_admin_state AS (
  SELECT
    CASE
      WHEN input.IsMatchicalAdmin = 1 THEN 1
      WHEN EXISTS (
        SELECT 1
        FROM current_user_roles user_role_ctx
        JOIN {UserRole} user_role
          ON user_role.[Id] = user_role_ctx.UserRoleId
        WHERE user_role.[IsSuperAdmin] = 1
      ) THEN 1
      ELSE 0
    END AS IsSuperAdmin
  FROM input_state input
),
permission_scope_flags AS (
  SELECT
    role_permission.[PermissionId] AS PermissionId,
    MAX(
      CASE
        WHEN role_permission.[PermissionLevelId] IN (@PermissionLevelAllId, @PermissionLevelOnId) THEN 1
        ELSE 0
      END
    ) AS HasGlobalGrant,
    MAX(
      CASE
        WHEN role_permission.[PermissionLevelId] = @PermissionLevelOwnId THEN 1
        ELSE 0
      END
    ) AS HasOwnGrant,
    MAX(
      CASE
        WHEN role_permission.[PermissionLevelId] = @PermissionLevelMyReportsId THEN 1
        ELSE 0
      END
    ) AS HasMyReportsGrant
  FROM current_user_roles user_role_ctx
  JOIN {UserRolePermissions} role_permission
    ON role_permission.[UserRoleId] = user_role_ctx.UserRoleId
  CROSS JOIN input_state input
  CROSS JOIN super_admin_state super_admin
  WHERE input.IsMatchicalAdmin <> 1
    AND super_admin.IsSuperAdmin <> 1
    AND role_permission.[PermissionId] IN (
      @PermissionInternalConsultantId,
      @PermissionExternalConsultantId,
      @PermissionOpportunityId
    )
    AND role_permission.[PermissionLevelId] IN (
      @PermissionLevelOnId,
      @PermissionLevelAllId,
      @PermissionLevelOwnId,
      @PermissionLevelMyReportsId
    )
  GROUP BY
    role_permission.[PermissionId]
),
internal_consultant_view_scope AS (
  SELECT
    COALESCE(MAX(
      CASE
        WHEN permission_scope.PermissionId = @PermissionInternalConsultantId THEN permission_scope.HasGlobalGrant
        ELSE 0
      END
    ), 0) AS HasGlobalGrant,
    COALESCE(MAX(
      CASE
        WHEN permission_scope.PermissionId = @PermissionInternalConsultantId THEN permission_scope.HasOwnGrant
        ELSE 0
      END
    ), 0) AS HasOwnGrant,
    COALESCE(MAX(
      CASE
        WHEN permission_scope.PermissionId = @PermissionInternalConsultantId THEN permission_scope.HasMyReportsGrant
        ELSE 0
      END
    ), 0) AS HasMyReportsGrant
  FROM permission_scope_flags permission_scope
),
external_consultant_view_scope AS (
  SELECT
    COALESCE(MAX(
      CASE
        WHEN permission_scope.PermissionId = @PermissionExternalConsultantId THEN permission_scope.HasGlobalGrant
        ELSE 0
      END
    ), 0) AS HasGlobalGrant,
    COALESCE(MAX(
      CASE
        WHEN permission_scope.PermissionId = @PermissionExternalConsultantId THEN permission_scope.HasOwnGrant
        ELSE 0
      END
    ), 0) AS HasOwnGrant,
    COALESCE(MAX(
      CASE
        WHEN permission_scope.PermissionId = @PermissionExternalConsultantId THEN permission_scope.HasMyReportsGrant
        ELSE 0
      END
    ), 0) AS HasMyReportsGrant
  FROM permission_scope_flags permission_scope
),
opportunity_view_scope AS (
  SELECT
    COALESCE(MAX(
      CASE
        WHEN permission_scope.PermissionId = @PermissionOpportunityId THEN permission_scope.HasGlobalGrant
        ELSE 0
      END
    ), 0) AS HasGlobalGrant,
    COALESCE(MAX(
      CASE
        WHEN permission_scope.PermissionId = @PermissionOpportunityId THEN permission_scope.HasOwnGrant
        ELSE 0
      END
    ), 0) AS HasOwnGrant,
    COALESCE(MAX(
      CASE
        WHEN permission_scope.PermissionId = @PermissionOpportunityId THEN permission_scope.HasMyReportsGrant
        ELSE 0
      END
    ), 0) AS HasMyReportsGrant
  FROM permission_scope_flags permission_scope
),
requested_consultant_base AS (
  SELECT
    consultant.[Id] AS ConsultantId,
    consultant.[TenantId] AS TenantId,
    consultant.[IsInternal] AS IsInternal,
    consultant.[ConsultancyUserId] AS ConsultancyUserId,
    consultant.[ExternalUserId] AS ExternalUserId
  FROM {Consultant} consultant
  JOIN {Status} consultant_status
    ON consultant_status.[Id] = consultant.[StatusId]
  WHERE consultant.[Id] = @ConsultantId
    AND consultant.[TenantId] = @TenantId
    AND consultant_status.[IsReady] = 1
    AND consultant_status.[IsActive] = 1
),
requested_consultant_external_target AS (
  SELECT
    CASE
      WHEN external_user.[OwnerId] IS NOT NULL
       AND TRIM(CAST(external_user.[OwnerId] AS TEXT)) <> ''
      THEN external_user.[OwnerId]
      WHEN external_user.[CreatorId] IS NOT NULL
       AND TRIM(CAST(external_user.[CreatorId] AS TEXT)) <> ''
      THEN external_user.[CreatorId]
      ELSE NULL
    END AS TargetConsultancyUserId
  FROM requested_consultant_base consultant
  CROSS JOIN input_state input
  CROSS JOIN super_admin_state super_admin
  CROSS JOIN external_consultant_view_scope external_scope
  JOIN {ExternalUser} external_user
    ON external_user.[Id] = consultant.[ExternalUserId]
  WHERE input.IsMatchicalAdmin <> 1
    AND super_admin.IsSuperAdmin <> 1
    AND consultant.[IsInternal] <> 1
    AND external_scope.HasGlobalGrant <> 1
    AND (external_scope.HasOwnGrant = 1 OR external_scope.HasMyReportsGrant = 1)
),
consultant AS (
  SELECT
    consultant_base.ConsultantId,
    consultant_base.TenantId
  FROM requested_consultant_base consultant_base
  CROSS JOIN input_state input
  CROSS JOIN current_user_scope current_user_ctx
  CROSS JOIN super_admin_state super_admin
  CROSS JOIN internal_consultant_view_scope internal_scope
  CROSS JOIN external_consultant_view_scope external_scope
  WHERE
    input.IsMatchicalAdmin = 1
    OR super_admin.IsSuperAdmin = 1
    OR (
      consultant_base.[IsInternal] = 1
      AND (
        internal_scope.HasGlobalGrant = 1
        OR (
          internal_scope.HasOwnGrant = 1
          AND consultant_base.[ConsultancyUserId] = current_user_ctx.CurrentConsultancyUserId
        )
        OR (
          internal_scope.HasMyReportsGrant = 1
          AND EXISTS (
            SELECT 1
            FROM {ConsultancyUserClosure} closure
            WHERE closure.[AncestorId] = consultant_base.[ConsultancyUserId]
              AND closure.[DescendantId] = current_user_ctx.CurrentConsultancyUserId
          )
        )
      )
    )
    OR (
      consultant_base.[IsInternal] <> 1
      AND (
        external_scope.HasGlobalGrant = 1
        OR (
          external_scope.HasOwnGrant = 1
          AND EXISTS (
            SELECT 1
            FROM requested_consultant_external_target external_target
            WHERE external_target.TargetConsultancyUserId = current_user_ctx.CurrentConsultancyUserId
          )
        )
        OR (
          external_scope.HasMyReportsGrant = 1
          AND EXISTS (
            SELECT 1
            FROM requested_consultant_external_target external_target
            JOIN {ConsultancyUserClosure} closure
              ON closure.[AncestorId] = external_target.TargetConsultancyUserId
             AND closure.[DescendantId] = current_user_ctx.CurrentConsultancyUserId
          )
        )
      )
    )
),
consultant_experience AS (
  SELECT
    experience.[CategoryId],
    experience.[RoleId],
    experience.[CustomRoleId],
    experience.[SkillId],
    experience.[IndustryId],
    experience.[FunctionalAreaId],
    experience.[LanguageId],
    experience.[Score],
    experience.[TenantId]
  FROM {Experience} experience
  JOIN consultant c
    ON c.ConsultantId = experience.[ConsultantId]
  WHERE experience.[TenantId] = @TenantId
),
visible_demand_global AS (
  SELECT
    demand.[Id] AS DemandId
  FROM {Demand} demand
  JOIN consultant visible_consultant
    ON visible_consultant.TenantId = demand.[TenantId]
  CROSS JOIN input_state input
  CROSS JOIN super_admin_state super_admin
  CROSS JOIN opportunity_view_scope opportunity_scope
  WHERE demand.[TenantId] = @TenantId
    AND (
      input.IsMatchicalAdmin = 1
      OR super_admin.IsSuperAdmin = 1
      OR opportunity_scope.HasGlobalGrant = 1
    )
),
visible_demand_own AS (
  SELECT
    demand.[Id] AS DemandId
  FROM {Demand} demand
  JOIN consultant visible_consultant
    ON visible_consultant.TenantId = demand.[TenantId]
  CROSS JOIN input_state input
  CROSS JOIN current_user_scope current_user_ctx
  CROSS JOIN super_admin_state super_admin
  CROSS JOIN opportunity_view_scope opportunity_scope
  WHERE demand.[TenantId] = @TenantId
    AND input.IsMatchicalAdmin <> 1
    AND super_admin.IsSuperAdmin <> 1
    AND opportunity_scope.HasGlobalGrant <> 1
    AND opportunity_scope.HasOwnGrant = 1
    AND (
      EXISTS (
        SELECT 1
        FROM {CoOwner} co_owner
        WHERE co_owner.[TenantId] = demand.[TenantId]
          AND co_owner.[OpportunityId] = demand.[OpportunityId]
          AND co_owner.[ConsultancyUserId] = current_user_ctx.CurrentConsultancyUserId
      )
      OR EXISTS (
        SELECT 1
        FROM {Opportunity} opportunity
        WHERE opportunity.[Id] = demand.[OpportunityId]
          AND opportunity.[TenantId] = demand.[TenantId]
          AND opportunity.[CreatorId] = current_user_ctx.CurrentConsultancyUserId
      )
    )
),
visible_demand_myreports AS (
  SELECT
    demand.[Id] AS DemandId
  FROM {Demand} demand
  JOIN consultant visible_consultant
    ON visible_consultant.TenantId = demand.[TenantId]
  CROSS JOIN input_state input
  CROSS JOIN current_user_scope current_user_ctx
  CROSS JOIN super_admin_state super_admin
  CROSS JOIN opportunity_view_scope opportunity_scope
  WHERE demand.[TenantId] = @TenantId
    AND input.IsMatchicalAdmin <> 1
    AND super_admin.IsSuperAdmin <> 1
    AND opportunity_scope.HasGlobalGrant <> 1
    AND opportunity_scope.HasMyReportsGrant = 1
    AND (
      EXISTS (
        SELECT 1
        FROM {CoOwner} co_owner
        JOIN {ConsultancyUserClosure} closure
          ON closure.[AncestorId] = co_owner.[ConsultancyUserId]
         AND closure.[DescendantId] = current_user_ctx.CurrentConsultancyUserId
        WHERE co_owner.[TenantId] = demand.[TenantId]
          AND co_owner.[OpportunityId] = demand.[OpportunityId]
      )
      OR EXISTS (
        SELECT 1
        FROM {Opportunity} opportunity
        JOIN {ConsultancyUserClosure} closure
          ON closure.[AncestorId] = opportunity.[CreatorId]
         AND closure.[DescendantId] = current_user_ctx.CurrentConsultancyUserId
        WHERE opportunity.[Id] = demand.[OpportunityId]
          AND opportunity.[TenantId] = demand.[TenantId]
          AND opportunity.[CreatorId] IS NOT NULL
          AND TRIM(CAST(opportunity.[CreatorId] AS TEXT)) <> ''
      )
    )
),
visible_demand AS (
  SELECT
    global_demand.DemandId
  FROM visible_demand_global global_demand

  UNION

  SELECT
    own_demand.DemandId
  FROM visible_demand_own own_demand

  UNION

  SELECT
    myreports_demand.DemandId
  FROM visible_demand_myreports myreports_demand
),

/* _____________ Category branches with computed partial_score (DOUBLE PRECISION) _____________ */

/* RoleSkill: match (RoleId, SkillId) or CustomRoleSkill: match (CustomRoleId, SkillId) */
branch_roleskill AS (
  SELECT
    req.[DemandId] AS DemandId,
    CASE WHEN @UseCustomRoles = 1 THEN @Cat_CustomRoleSkill ELSE @Cat_RoleSkill END AS CategoryId,
    CAST(
      CASE
        WHEN req.[Score] = 0 THEN 0
        ELSE
          (
            CASE
              WHEN exp.Score >= req.[Score] THEN req.[DynamicWeight]
              ELSE req.[DynamicWeight] * (CAST(exp.Score AS DOUBLE PRECISION) / CAST(req.[Score] AS DOUBLE PRECISION))
            END
          ) * CAST(req.[RoleWeight] AS DOUBLE PRECISION)
      END
    AS DOUBLE PRECISION) AS partial_score
  FROM consultant_experience exp
  JOIN {DemandRequirement} req
    ON req.[TenantId] = exp.TenantId
   AND req.[IsActive] = 1
   AND NOT (req.[HasMissingKeys] = 1)
   AND (
     (@UseCustomRoles <> 1
      AND exp.CategoryId = @Cat_RoleSkill
      AND req.[CategoryId] = @Cat_RoleSkill
      AND req.[RoleId] = exp.RoleId
      AND req.[SkillId] = exp.SkillId)
     OR (@UseCustomRoles = 1
         AND exp.CategoryId = @Cat_CustomRoleSkill
         AND req.[CategoryId] = @Cat_CustomRoleSkill
         AND req.[CustomRoleId] = exp.CustomRoleId
         AND req.[SkillId] = exp.SkillId)
   )
  JOIN visible_demand visible_demand_ctx
    ON visible_demand_ctx.DemandId = req.[DemandId]
  WHERE req.[Score] <> 0
    AND exp.Score > 0
),

/* Role: match RoleId or CustomRole: match CustomRoleId (SkillId IS NULL on requirement) */
branch_role AS (
  SELECT
    req.[DemandId] AS DemandId,
    CASE WHEN @UseCustomRoles = 1 THEN @Cat_CustomRole ELSE @Cat_Role END AS CategoryId,
    CAST(
      CASE
        WHEN req.[Score] = 0 THEN 0
        ELSE
          (
            CASE
              WHEN exp.Score >= req.[Score] THEN req.[DynamicWeight]
              ELSE req.[DynamicWeight] * (CAST(exp.Score AS DOUBLE PRECISION) / CAST(req.[Score] AS DOUBLE PRECISION))
            END
          ) * 100.0
      END
    AS DOUBLE PRECISION) AS partial_score
  FROM consultant_experience exp
  JOIN {DemandRequirement} req
    ON req.[TenantId] = exp.TenantId
   AND req.[IsActive] = 1
   AND NOT (req.[HasMissingKeys] = 1)
   AND (
     (@UseCustomRoles <> 1
      AND exp.CategoryId = @Cat_Role
      AND req.[CategoryId] = @Cat_Role
      AND req.[RoleId] = exp.RoleId
      AND req.[SkillId] IS NULL)
     OR (@UseCustomRoles = 1
         AND exp.CategoryId = @Cat_CustomRole
         AND req.[CategoryId] = @Cat_CustomRole
         AND req.[CustomRoleId] = exp.CustomRoleId
         AND req.[SkillId] IS NULL)
   )
  JOIN visible_demand visible_demand_ctx
    ON visible_demand_ctx.DemandId = req.[DemandId]
  WHERE req.[Score] <> 0
    AND exp.Score > 0
),

/* Industry: match IndustryId */
branch_industry AS (
  SELECT
    req.[DemandId] AS DemandId,
    @Cat_Industry AS CategoryId,
    CAST(
      CASE
        WHEN req.[Score] = 0 THEN 0
        ELSE
          (
            CASE
              WHEN exp.Score >= req.[Score] THEN req.[DynamicWeight]
              ELSE req.[DynamicWeight] * (CAST(exp.Score AS DOUBLE PRECISION) / CAST(req.[Score] AS DOUBLE PRECISION))
            END
          ) * 100.0
      END
    AS DOUBLE PRECISION) AS partial_score
  FROM consultant_experience exp
  JOIN {DemandRequirement} req
    ON req.[TenantId] = exp.TenantId
   AND req.[IsActive] = 1
   AND NOT (req.[HasMissingKeys] = 1)
   AND exp.CategoryId = @Cat_Industry
   AND req.[CategoryId] = @Cat_Industry
   AND req.[IndustryId] = exp.IndustryId
  JOIN visible_demand visible_demand_ctx
    ON visible_demand_ctx.DemandId = req.[DemandId]
  WHERE req.[Score] <> 0
    AND exp.Score > 0
),

/* FunctionalArea: match FunctionalAreaId */
branch_functional AS (
  SELECT
    req.[DemandId] AS DemandId,
    @Cat_FunctionalArea AS CategoryId,
    CAST(
      CASE
        WHEN req.[Score] = 0 THEN 0
        ELSE
          (
            CASE
              WHEN exp.Score >= req.[Score] THEN req.[DynamicWeight]
              ELSE req.[DynamicWeight] * (CAST(exp.Score AS DOUBLE PRECISION) / CAST(req.[Score] AS DOUBLE PRECISION))
            END
          ) * 100.0
      END
    AS DOUBLE PRECISION) AS partial_score
  FROM consultant_experience exp
  JOIN {DemandRequirement} req
    ON req.[TenantId] = exp.TenantId
   AND req.[IsActive] = 1
   AND NOT (req.[HasMissingKeys] = 1)
   AND exp.CategoryId = @Cat_FunctionalArea
   AND req.[CategoryId] = @Cat_FunctionalArea
   AND req.[FunctionalAreaId] = exp.FunctionalAreaId
  JOIN visible_demand visible_demand_ctx
    ON visible_demand_ctx.DemandId = req.[DemandId]
  WHERE req.[Score] <> 0
    AND exp.Score > 0
),

/* Language: match LanguageId */
branch_language AS (
  SELECT
    req.[DemandId] AS DemandId,
    @Cat_Language AS CategoryId,
    CAST(
      CASE
        WHEN req.[Score] = 0 THEN 0
        ELSE
          (
            CASE
              WHEN exp.Score >= req.[Score] THEN req.[DynamicWeight]
              ELSE req.[DynamicWeight] * (CAST(exp.Score AS DOUBLE PRECISION) / CAST(req.[Score] AS DOUBLE PRECISION))
            END
          ) * 100.0
      END
    AS DOUBLE PRECISION) AS partial_score
  FROM consultant_experience exp
  JOIN {DemandRequirement} req
    ON req.[TenantId] = exp.TenantId
   AND req.[IsActive] = 1
   AND NOT (req.[HasMissingKeys] = 1)
   AND exp.CategoryId = @Cat_Language
   AND req.[CategoryId] = @Cat_Language
   AND req.[LanguageId] = exp.LanguageId
  JOIN visible_demand visible_demand_ctx
    ON visible_demand_ctx.DemandId = req.[DemandId]
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

/* _____________ Aggregate per demand _____________ */
scores AS (
  SELECT
    partial.DemandId,
    SUM(partial.partial_score) AS MatchingScore,
    COUNT(*) FILTER (WHERE partial.CategoryId <> @Cat_Language) AS MatchedRequirementsCount
  FROM partials partial
  GROUP BY partial.DemandId
),

/* _____________ Keep only demands with positive score _____________ */
kept AS (
  SELECT
    score.DemandId,
    score.MatchingScore,
    score.MatchedRequirementsCount
  FROM scores score
  WHERE score.MatchingScore > 0
),

/* _____________ Price_performance calculation with window function _____________ */
price_performance AS (
  SELECT
    kept_demand.DemandId,
    kept_demand.MatchingScore,
    kept_demand.MatchedRequirementsCount,
    CASE
      WHEN demand.[ClientOffsiteRate] > 0
      THEN demand.[ClientOffsiteRate] / kept_demand.MatchingScore
      ELSE 0
    END AS Ratio,
    MAX(
      CASE
        WHEN demand.[ClientOffsiteRate] > 0
        THEN demand.[ClientOffsiteRate] / kept_demand.MatchingScore
        ELSE 0
      END
    ) OVER () AS BestRatio
  FROM kept kept_demand
  JOIN {Demand} demand
    ON demand.[Id] = kept_demand.DemandId
)

/* _____________ Final projection: scoring + price_performance _____________ */
SELECT
  final.DemandId,
  final.MatchingScore,
  final.PricePerformanceScore,
  final.MatchedRequirementsCount,
  final.Count
FROM (
  SELECT
    pp.DemandId AS DemandId,
    pp.MatchingScore AS MatchingScore,
    CASE
      WHEN pp.BestRatio > 0
      THEN (pp.Ratio / pp.BestRatio) * 10
      ELSE 0
    END AS PricePerformanceScore,
    pp.MatchedRequirementsCount AS MatchedRequirementsCount,
    COUNT(*) OVER() AS Count
  FROM price_performance pp
) final
ORDER BY final.MatchingScore DESC
LIMIT @MaxRecords
OFFSET @StartIndex
