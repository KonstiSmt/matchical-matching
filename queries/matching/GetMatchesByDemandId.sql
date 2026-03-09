/* GetMatchesByDemandId : Advanced SQL (Aurora Postgres, ODC)
   Purpose: return consultant matches for a demand with scoring, paging, and filters.

   This is the scoring query. Returns only IDs and scores.
   Display data (names, photos, etc.) comes from GetConsultantMatchPreview.

   Refactored version:
     • Early NOT EXISTS filter enforcement in ec CTE (consultants failing filters excluded before scoring)
     • Removed aggregate-based filter enforcement (excl_partial, has_filter_partial, IsExcludedMax, HasFilterSum)
     • Removed contract-type filter (OnlyShowFreelancer/Temporary/Permanent)
     • Removed ExperienceFilterCount dependency
     • Mandatory soft role gate (consultant must match at least one required role with Score > 0;
       bypassed in Global Skill mode)
     • Inline permission gating for demand visibility and consultant visibility

   Permission inputs:
     @UserId,
     @IsMatchicalAdmin,
     @PermissionInternalConsultantId,
     @PermissionExternalConsultantId,
     @PermissionOpportunityId,
     @PermissionLevelOnId,
     @PermissionLevelAllId,
     @PermissionLevelOwnId,
     @PermissionLevelMyReportsId

   Performance note:
     • Matchical admin, super admin, and global grant paths skip owner/creator/co-owner lookups.
     • ConsultancyUserClosure is only touched in the MyReports path.
     • Matching visibility permissions are treated as operation/feature permissions and ignore PermissionMethodId.
     • Role-skill matching uses selected scoring mode via @RoleSkillScoringModeId.

   Output columns (ordered):
     ConsultantId, MatchingScore, PricePerformanceScore, MatchedRequirementsCount, Count, HasActiveFilters
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
/* _____________ Demand context (single row) _____________ */
base_demand AS (
  SELECT
    {Demand}.[Id]                           AS DemandId,
    {Demand}.[TenantId]                     AS TenantId,
    {Demand}.[OpportunityId]                AS OpportunityId,
    {Demand}.[LocationTagId]                AS LocationTagId,
    {Demand}.[LocationFilterCategoryId]     AS LocationFilter,
    {Demand}.[AvailabilityFilterCategoryId] AS AvailabilityFilter,
    {Demand}.[IsCapacityFilterActive]       AS IsCapacityFilterActive,
    {Demand}.[Capacity]                     AS Capacity,
    {Demand}.[ClientOffsiteRate]            AS ClientOffsiteRate
  FROM {Demand}
  WHERE {Demand}.[Id] = @DemandId
    AND {Demand}.[TenantId] = @TenantId
),
demand_visibility_targets AS (
  SELECT
    co_owner.[ConsultancyUserId] AS TargetConsultancyUserId
  FROM base_demand demand_ctx
  CROSS JOIN input_state input
  CROSS JOIN super_admin_state super_admin
  CROSS JOIN opportunity_view_scope opportunity_scope
  JOIN {CoOwner} co_owner
    ON co_owner.[TenantId] = demand_ctx.TenantId
   AND co_owner.[OpportunityId] = demand_ctx.OpportunityId
  WHERE input.IsMatchicalAdmin <> 1
    AND super_admin.IsSuperAdmin <> 1
    AND opportunity_scope.HasGlobalGrant <> 1
    AND (opportunity_scope.HasOwnGrant = 1 OR opportunity_scope.HasMyReportsGrant = 1)

  UNION

  SELECT
    opportunity.[CreatorId] AS TargetConsultancyUserId
  FROM base_demand demand_ctx
  CROSS JOIN input_state input
  CROSS JOIN super_admin_state super_admin
  CROSS JOIN opportunity_view_scope opportunity_scope
  JOIN {Opportunity} opportunity
    ON opportunity.[Id] = demand_ctx.OpportunityId
   AND opportunity.[TenantId] = demand_ctx.TenantId
  WHERE input.IsMatchicalAdmin <> 1
    AND super_admin.IsSuperAdmin <> 1
    AND opportunity_scope.HasGlobalGrant <> 1
    AND (opportunity_scope.HasOwnGrant = 1 OR opportunity_scope.HasMyReportsGrant = 1)
    AND opportunity.[CreatorId] IS NOT NULL
    AND TRIM(CAST(opportunity.[CreatorId] AS TEXT)) <> ''
),
demand_visibility_state AS (
  SELECT
    CASE
      WHEN input.IsMatchicalAdmin = 1 THEN 1
      WHEN super_admin.IsSuperAdmin = 1 THEN 1
      WHEN opportunity_scope.HasGlobalGrant = 1 THEN 1
      WHEN opportunity_scope.HasOwnGrant = 1
       AND EXISTS (
         SELECT 1
         FROM demand_visibility_targets visibility_target
         WHERE visibility_target.TargetConsultancyUserId = current_user_ctx.CurrentConsultancyUserId
       ) THEN 1
      WHEN opportunity_scope.HasMyReportsGrant = 1
       AND EXISTS (
         SELECT 1
         FROM demand_visibility_targets visibility_target
         JOIN {ConsultancyUserClosure} closure
           ON closure.[AncestorId] = visibility_target.TargetConsultancyUserId
          AND closure.[DescendantId] = current_user_ctx.CurrentConsultancyUserId
       ) THEN 1
      ELSE 0
    END AS IsVisible
  FROM input_state input
  CROSS JOIN current_user_scope current_user_ctx
  CROSS JOIN super_admin_state super_admin
  CROSS JOIN opportunity_view_scope opportunity_scope
),
demand AS (
  SELECT
    demand_ctx.DemandId,
    demand_ctx.TenantId,
    demand_ctx.OpportunityId,
    demand_ctx.LocationTagId,
    demand_ctx.LocationFilter,
    demand_ctx.AvailabilityFilter,
    demand_ctx.IsCapacityFilterActive,
    demand_ctx.Capacity,
    demand_ctx.ClientOffsiteRate
  FROM base_demand demand_ctx
  CROSS JOIN demand_visibility_state demand_visibility
  WHERE demand_visibility.IsVisible = 1
),

/* _____________ Requirements (valid only) _____________ */
requirement AS (
  SELECT
    req.[Id]               AS RequirementId,
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
  JOIN demand demand_ctx
    ON demand_ctx.DemandId = req.[DemandId]
   AND demand_ctx.TenantId = req.[TenantId]
  WHERE req.[DemandId] = @DemandId
    AND req.[TenantId]  = @TenantId
    AND req.[IsActive]  = 1
    AND NOT (req.[HasMissingKeys] = 1)
),

/* _____________ Role requirements for mandatory soft role gate _____________ */
role_requirement AS (
  SELECT
    role_req.[CategoryId],
    role_req.[RoleId],
    role_req.[CustomRoleId],
    role_req.[TenantId]
  FROM {DemandRequirement} role_req
  JOIN demand demand_ctx
    ON demand_ctx.DemandId = role_req.[DemandId]
   AND demand_ctx.TenantId = role_req.[TenantId]
  WHERE role_req.[DemandId] = @DemandId
    AND role_req.[TenantId]  = @TenantId
    AND role_req.[IsActive]  = 1
    AND NOT (role_req.[HasMissingKeys] = 1)
    AND (
      (@UseCustomRoles <> 1 AND role_req.[CategoryId] = @Cat_Role)
      OR (@UseCustomRoles = 1 AND role_req.[CategoryId] = @Cat_CustomRole)
    )
),

/* _____________ Role requirement check (evaluated once, not per consultant) _____________ */
has_role_requirements AS (
  SELECT EXISTS (SELECT 1 FROM role_requirement) AS HasRoleRequirements
),

/* _____________ Filtered requirements (Hard/Soft only) _____________ */
filtered_requirement AS (
  SELECT
    freq.[Id]               AS RequirementId,
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
  JOIN demand demand_ctx
    ON demand_ctx.DemandId = freq.[DemandId]
   AND demand_ctx.TenantId = freq.[TenantId]
  WHERE freq.[DemandId] = @DemandId
    AND freq.[TenantId]  = @TenantId
    AND freq.[IsActive]  = 1
    AND NOT (freq.[HasMissingKeys] = 1)
    AND freq.[FilterCategoryId] <> @Filter_Default
),

/* _____________ Effective filtered requirements (Global Skill mode ignores Role/CustomRole filters) _____________ */
filtered_requirement_effective AS (
  SELECT
    filter_req.RequirementId,
    filter_req.[CategoryId],
    filter_req.[RoleId],
    filter_req.[CustomRoleId],
    filter_req.[SkillId],
    filter_req.[IndustryId],
    filter_req.[FunctionalAreaId],
    filter_req.[LanguageId],
    filter_req.ReqScore,
    filter_req.FilterCategory,
    filter_req.[TenantId]
  FROM filtered_requirement filter_req
  WHERE NOT (
    @RoleSkillScoringModeId = @ScoringMode_GlobalSkill
    AND (
      (@UseCustomRoles <> 1 AND filter_req.[CategoryId] = @Cat_Role)
      OR (@UseCustomRoles = 1 AND filter_req.[CategoryId] = @Cat_CustomRole)
    )
  )
),

/* _____________ Filtered role-skill requirements in active role mode _____________ */
filtered_roleskill_requirement_raw AS (
  SELECT
    filter_req.RequirementId,
    filter_req.[CategoryId],
    filter_req.[RoleId],
    filter_req.[CustomRoleId],
    filter_req.[SkillId],
    filter_req.ReqScore,
    filter_req.FilterCategory,
    filter_req.[TenantId]
  FROM filtered_requirement_effective filter_req
  WHERE (
    (@UseCustomRoles <> 1 AND filter_req.[CategoryId] = @Cat_RoleSkill)
    OR (@UseCustomRoles = 1 AND filter_req.[CategoryId] = @Cat_CustomRoleSkill)
  )
),

/* Rank filtered role-skill duplicates for Global Skill mode representative selection */
filtered_roleskill_requirement_ranked_global AS (
  SELECT
    filter_req.RequirementId,
    filter_req.[CategoryId],
    filter_req.[RoleId],
    filter_req.[CustomRoleId],
    filter_req.[SkillId],
    filter_req.ReqScore,
    filter_req.FilterCategory,
    filter_req.[TenantId],
    ROW_NUMBER() OVER (
      PARTITION BY filter_req.[TenantId], filter_req.[SkillId]
      ORDER BY filter_req.ReqScore DESC, filter_req.RequirementId ASC
    ) AS SkillRank
  FROM filtered_roleskill_requirement_raw filter_req
),

/* Merge filtered role-skill duplicates by SkillId (Hard > Soft > Default) */
filtered_roleskill_requirement_aggregated_global AS (
  SELECT
    filter_req.[SkillId],
    filter_req.[TenantId],
    MAX(filter_req.ReqScore) AS ReqScore,
    CASE
      WHEN MAX(CASE WHEN filter_req.FilterCategory = @Filter_Hard THEN 1 ELSE 0 END) = 1
      THEN @Filter_Hard
      WHEN MAX(CASE WHEN filter_req.FilterCategory = @Filter_Soft THEN 1 ELSE 0 END) = 1
      THEN @Filter_Soft
      ELSE @Filter_Default
    END AS FilterCategory
  FROM filtered_roleskill_requirement_raw filter_req
  GROUP BY
    filter_req.[SkillId],
    filter_req.[TenantId]
),

/* Effective filtered role-skill requirements by scoring mode */
filtered_roleskill_requirement_effective AS (
  SELECT
    filter_req.RequirementId,
    filter_req.[CategoryId],
    filter_req.[RoleId],
    filter_req.[CustomRoleId],
    filter_req.[SkillId],
    filter_req.ReqScore,
    filter_req.FilterCategory,
    filter_req.[TenantId]
  FROM filtered_roleskill_requirement_raw filter_req
  WHERE @RoleSkillScoringModeId <> @ScoringMode_GlobalSkill

  UNION ALL

  SELECT
    rep.RequirementId,
    rep.[CategoryId],
    rep.[RoleId],
    rep.[CustomRoleId],
    rep.[SkillId],
    agg.ReqScore,
    agg.FilterCategory,
    rep.[TenantId]
  FROM filtered_roleskill_requirement_ranked_global rep
  JOIN filtered_roleskill_requirement_aggregated_global agg
    ON agg.[SkillId] = rep.[SkillId]
   AND agg.[TenantId] = rep.[TenantId]
  WHERE @RoleSkillScoringModeId = @ScoringMode_GlobalSkill
    AND rep.SkillRank = 1
),

/* Filtered role-scoped scores per consultant and requirement */
filtered_roleskill_role_score AS (
  SELECT
    filter_req.RequirementId,
    experience.[ConsultantId] AS ConsultantId,
    MAX(experience.[Score])   AS RoleScore
  FROM filtered_roleskill_requirement_effective filter_req
  JOIN {Experience} experience
    ON experience.[TenantId] = filter_req.[TenantId]
   AND experience.[Score] > 0
   AND (
     (@UseCustomRoles <> 1
      AND experience.[CategoryId] = @Cat_RoleSkill
      AND experience.[RoleId] = filter_req.[RoleId]
      AND experience.[SkillId] = filter_req.[SkillId])
     OR (@UseCustomRoles = 1
         AND experience.[CategoryId] = @Cat_CustomRoleSkill
         AND experience.[CustomRoleId] = filter_req.[CustomRoleId]
         AND experience.[SkillId] = filter_req.[SkillId])
   )
  GROUP BY
    filter_req.RequirementId,
    experience.[ConsultantId]
),

/* Filtered global-skill scores per consultant and requirement */
filtered_roleskill_global_score AS (
  SELECT
    filter_req.RequirementId,
    experience.[ConsultantId] AS ConsultantId,
    MAX(experience.[Score])   AS GlobalScore
  FROM filtered_roleskill_requirement_effective filter_req
  JOIN {Experience} experience
    ON experience.[TenantId] = filter_req.[TenantId]
   AND experience.[Score] > 0
   AND (
     (@UseCustomRoles <> 1
      AND experience.[CategoryId] = @Cat_Skill
      AND experience.[SkillId] = filter_req.[SkillId])
     OR (@UseCustomRoles = 1
         AND experience.[CategoryId] = @Cat_CustomSkill
         AND experience.[SkillId] = filter_req.[SkillId])
   )
  GROUP BY
    filter_req.RequirementId,
    experience.[ConsultantId]
),

/* Combined role/global candidate scores for filtered role-skill requirements */
filtered_roleskill_score AS (
  SELECT
    filtered_score.RequirementId,
    filtered_score.ConsultantId,
    MAX(filtered_score.RoleScore)   AS RoleScore,
    MAX(filtered_score.GlobalScore) AS GlobalScore
  FROM (
    SELECT
      role_score.RequirementId,
      role_score.ConsultantId,
      role_score.RoleScore,
      CAST(NULL AS INTEGER) AS GlobalScore
    FROM filtered_roleskill_role_score role_score

    UNION ALL

    SELECT
      global_score.RequirementId,
      global_score.ConsultantId,
      CAST(NULL AS INTEGER) AS RoleScore,
      global_score.GlobalScore
    FROM filtered_roleskill_global_score global_score
  ) filtered_score
  GROUP BY
    filtered_score.RequirementId,
    filtered_score.ConsultantId
),

/* Filtered role-skill requirements satisfied by effective score mode */
filtered_roleskill_pass AS (
  SELECT
    filter_req.RequirementId,
    filter_score.ConsultantId
  FROM filtered_roleskill_requirement_effective filter_req
  JOIN filtered_roleskill_score filter_score
    ON filter_score.RequirementId = filter_req.RequirementId
  WHERE
    (
      filter_req.FilterCategory = @Filter_Hard
      AND (
        (@RoleSkillScoringModeId = @ScoringMode_StrictRole
         AND COALESCE(filter_score.RoleScore, 0) >= filter_req.ReqScore)
        OR (@RoleSkillScoringModeId = @ScoringMode_GlobalSkill
            AND COALESCE(filter_score.GlobalScore, 0) >= filter_req.ReqScore)
        OR (@RoleSkillScoringModeId = @ScoringMode_RoleFirstHybrid
            AND GREATEST(
                  COALESCE(filter_score.RoleScore, 0),
                  GREATEST(COALESCE(filter_score.GlobalScore, 0) - 1, 0)
                ) >= filter_req.ReqScore)
        OR (@RoleSkillScoringModeId <> @ScoringMode_StrictRole
            AND @RoleSkillScoringModeId <> @ScoringMode_GlobalSkill
            AND @RoleSkillScoringModeId <> @ScoringMode_RoleFirstHybrid
            AND COALESCE(filter_score.RoleScore, 0) >= filter_req.ReqScore)
      )
    )
    OR (
      filter_req.FilterCategory = @Filter_Soft
      AND (
        (@RoleSkillScoringModeId = @ScoringMode_StrictRole
         AND COALESCE(filter_score.RoleScore, 0) > 0)
        OR (@RoleSkillScoringModeId = @ScoringMode_GlobalSkill
            AND COALESCE(filter_score.GlobalScore, 0) > 0)
        OR (@RoleSkillScoringModeId = @ScoringMode_RoleFirstHybrid
            AND GREATEST(
                  COALESCE(filter_score.RoleScore, 0),
                  GREATEST(COALESCE(filter_score.GlobalScore, 0) - 1, 0)
                ) > 0)
        OR (@RoleSkillScoringModeId <> @ScoringMode_StrictRole
            AND @RoleSkillScoringModeId <> @ScoringMode_GlobalSkill
            AND @RoleSkillScoringModeId <> @ScoringMode_RoleFirstHybrid
            AND COALESCE(filter_score.RoleScore, 0) > 0)
      )
    )
),

/* Effective filtered requirements for consultant enforcement */
filtered_requirement_for_enforcement AS (
  SELECT
    filter_req.RequirementId,
    filter_req.[CategoryId],
    filter_req.[RoleId],
    filter_req.[CustomRoleId],
    filter_req.[SkillId],
    filter_req.[IndustryId],
    filter_req.[FunctionalAreaId],
    filter_req.[LanguageId],
    filter_req.ReqScore,
    filter_req.FilterCategory,
    filter_req.[TenantId]
  FROM filtered_requirement_effective filter_req
  WHERE NOT (
    (@UseCustomRoles <> 1 AND filter_req.[CategoryId] = @Cat_RoleSkill)
    OR (@UseCustomRoles = 1 AND filter_req.[CategoryId] = @Cat_CustomRoleSkill)
  )

  UNION ALL

  SELECT
    filter_req.RequirementId,
    filter_req.[CategoryId],
    filter_req.[RoleId],
    filter_req.[CustomRoleId],
    filter_req.[SkillId],
    NULL AS IndustryId,
    NULL AS FunctionalAreaId,
    NULL AS LanguageId,
    filter_req.ReqScore,
    filter_req.FilterCategory,
    filter_req.[TenantId]
  FROM filtered_roleskill_requirement_effective filter_req
),

/* _____________ Filter check (evaluated once, not per consultant) _____________ */
has_filtered_requirements AS (
  SELECT (
    /* Requirement filters (Hard/Soft on individual requirements) */
    EXISTS (SELECT 1 FROM filtered_requirement_for_enforcement)
    /* Availability filter active */
    OR (SELECT AvailabilityFilter FROM demand) <> @Filter_Default
    /* Location filter active (not Default AND has location) */
    OR ((SELECT LocationFilter FROM demand) <> @Filter_Default
        AND (SELECT LocationTagId FROM demand) IS NOT NULL)
  ) AS HasFilters
),

/* _____________ Eligible consultants (prefilter + filter enforcement) _____________ */
eligible_consultant AS (
  SELECT consultant.[Id] AS ConsultantId
  FROM {Consultant} consultant
  JOIN {Status} consultant_status
    ON consultant_status.[Id] = consultant.[StatusId]
  CROSS JOIN input_state input
  CROSS JOIN current_user_scope current_user_ctx
  CROSS JOIN super_admin_state super_admin
  CROSS JOIN internal_consultant_view_scope internal_scope
  CROSS JOIN external_consultant_view_scope external_scope
  CROSS JOIN demand
  CROSS JOIN has_role_requirements has_role_requirement
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

    /* Permission-aware consultant visibility */
    AND (
          input.IsMatchicalAdmin = 1
          OR super_admin.IsSuperAdmin = 1
          OR (
               consultant.[IsInternal] = 1
               AND (
                    internal_scope.HasGlobalGrant = 1
                    OR (
                         internal_scope.HasOwnGrant = 1
                         AND consultant.[ConsultancyUserId] = current_user_ctx.CurrentConsultancyUserId
                       )
                    OR (
                         internal_scope.HasMyReportsGrant = 1
                         AND EXISTS (
                               SELECT 1
                               FROM {ConsultancyUserClosure} closure
                               WHERE closure.[AncestorId] = consultant.[ConsultancyUserId]
                                 AND closure.[DescendantId] = current_user_ctx.CurrentConsultancyUserId
                             )
                       )
                  )
             )
          OR (
               consultant.[IsInternal] <> 1
               AND (
                    external_scope.HasGlobalGrant = 1
                    OR (
                         external_scope.HasOwnGrant = 1
                         AND EXISTS (
                               SELECT 1
                               FROM {ExternalUser} external_user
                               WHERE external_user.[Id] = consultant.[ExternalUserId]
                                 AND (
                                      CASE
                                        WHEN external_user.[OwnerId] IS NOT NULL
                                         AND TRIM(CAST(external_user.[OwnerId] AS TEXT)) <> ''
                                        THEN external_user.[OwnerId]
                                        WHEN external_user.[CreatorId] IS NOT NULL
                                         AND TRIM(CAST(external_user.[CreatorId] AS TEXT)) <> ''
                                        THEN external_user.[CreatorId]
                                        ELSE NULL
                                      END
                                     ) = current_user_ctx.CurrentConsultancyUserId
                             )
                       )
                    OR (
                         external_scope.HasMyReportsGrant = 1
                         AND EXISTS (
                               SELECT 1
                               FROM {ExternalUser} external_user
                               JOIN {ConsultancyUserClosure} closure
                                 ON closure.[AncestorId] = (
                                      CASE
                                        WHEN external_user.[OwnerId] IS NOT NULL
                                         AND TRIM(CAST(external_user.[OwnerId] AS TEXT)) <> ''
                                        THEN external_user.[OwnerId]
                                        WHEN external_user.[CreatorId] IS NOT NULL
                                         AND TRIM(CAST(external_user.[CreatorId] AS TEXT)) <> ''
                                        THEN external_user.[CreatorId]
                                        ELSE NULL
                                      END
                                    )
                                AND closure.[DescendantId] = current_user_ctx.CurrentConsultancyUserId
                               WHERE external_user.[Id] = consultant.[ExternalUserId]
                             )
                       )
                  )
             )
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

    /* Availability filter based on AvailabilityCategoryId */
    AND (
          /* Default: no filtering */
          demand.AvailabilityFilter = @Filter_Default
          /* Soft: only consultants marked as NOT available */
          OR (demand.AvailabilityFilter = @Filter_Soft
              AND consultant.[AvailabilityCategoryId] = @AvailabilityCategory_No)
          /* Hard: only consultants marked as available */
          OR (demand.AvailabilityFilter = @Filter_Hard
              AND consultant.[AvailabilityCategoryId] = @AvailabilityCategory_Yes)
        )

    /* Capacity (only when active) */
    AND (
          (NOT (demand.IsCapacityFilterActive = 1))
          OR (demand.Capacity >= consultant.[MinCapacity] AND demand.Capacity <= consultant.[MaxCapacity])
        )

    /* Mandatory role soft-match gate: consultant must match at least one required role with Score > 0 */
    AND (
          /* Global Skill mode bypasses mandatory role gate */
          @RoleSkillScoringModeId = @ScoringMode_GlobalSkill
          OR
          /* Fast path: no role requirement in active role mode */
          has_role_requirement.HasRoleRequirements = FALSE
          OR
          EXISTS (
            SELECT 1
            FROM role_requirement role_req
            JOIN {Experience} experience
              ON experience.[ConsultantId] = consultant.[Id]
             AND experience.[TenantId] = role_req.[TenantId]
             AND experience.[Score] > 0
             AND (
               /* Standard Role gate */
               (@UseCustomRoles <> 1
                AND role_req.[CategoryId] = @Cat_Role
                AND experience.[CategoryId] = @Cat_Role
                AND experience.[RoleId] = role_req.[RoleId]
                AND experience.[SkillId] IS NULL)
               /* Custom Role gate */
               OR (@UseCustomRoles = 1
                   AND role_req.[CategoryId] = @Cat_CustomRole
                   AND experience.[CategoryId] = @Cat_CustomRole
                   AND experience.[CustomRoleId] = role_req.[CustomRoleId]
                   AND experience.[SkillId] IS NULL)
             )
          )
        )

    /* Filter requirement enforcement: consultant must satisfy ALL filtered requirements */
    AND (
          /* Fast path: HasFilters is evaluated once, not per consultant */
          has_filter.HasFilters = FALSE
          OR
          /* Otherwise: no filtered requirement may be unsatisfied */
          NOT EXISTS (
            SELECT 1 FROM filtered_requirement_for_enforcement filter_req
            WHERE NOT (
              (
                (
                  (@UseCustomRoles <> 1 AND filter_req.[CategoryId] = @Cat_RoleSkill)
                  OR (@UseCustomRoles = 1 AND filter_req.[CategoryId] = @Cat_CustomRoleSkill)
                )
                AND EXISTS (
                  SELECT 1
                  FROM filtered_roleskill_pass filtered_pass
                  WHERE filtered_pass.RequirementId = filter_req.RequirementId
                    AND filtered_pass.ConsultantId = consultant.[Id]
                )
              )
              OR EXISTS (
                SELECT 1 FROM {Experience} experience
                WHERE experience.[ConsultantId] = consultant.[Id]
                  AND experience.[TenantId] = filter_req.[TenantId]
                  AND (
                    /* Standard Role */
                    (@UseCustomRoles <> 1
                     AND filter_req.[CategoryId] = @Cat_Role
                     AND experience.[CategoryId] = @Cat_Role
                     AND experience.[RoleId] = filter_req.[RoleId]
                     AND experience.[SkillId] IS NULL)
                    /* Custom Role */
                    OR (@UseCustomRoles = 1
                        AND filter_req.[CategoryId] = @Cat_CustomRole
                        AND experience.[CategoryId] = @Cat_CustomRole
                        AND experience.[CustomRoleId] = filter_req.[CustomRoleId]
                        AND experience.[SkillId] IS NULL)
                    /* Industry */
                    OR (filter_req.[CategoryId] = @Cat_Industry
                        AND experience.[CategoryId] = @Cat_Industry
                        AND experience.[IndustryId] = filter_req.[IndustryId])
                    /* FunctionalArea */
                    OR (filter_req.[CategoryId] = @Cat_FunctionalArea
                        AND experience.[CategoryId] = @Cat_FunctionalArea
                        AND experience.[FunctionalAreaId] = filter_req.[FunctionalAreaId])
                    /* Language */
                    OR (filter_req.[CategoryId] = @Cat_Language
                        AND experience.[CategoryId] = @Cat_Language
                        AND experience.[LanguageId] = filter_req.[LanguageId])
                  )
                  AND (
                    (filter_req.FilterCategory = @Filter_Hard AND experience.[Score] >= filter_req.ReqScore)
                    OR (filter_req.FilterCategory = @Filter_Soft AND experience.[Score] > 0)
                  )
              )
            )
          )
        )
),

/* _____________ Category branches with computed partial_score (DOUBLE PRECISION) _____________ */

/* RoleSkill requirements in active role mode */
roleskill_requirement_raw AS (
  SELECT
    req.RequirementId,
    req.[CategoryId],
    req.[RoleId],
    req.[CustomRoleId],
    req.[SkillId],
    req.ReqScore,
    req.[DynamicWeight],
    req.[RoleWeight],
    req.[TenantId]
  FROM requirement req
  WHERE (
    (@UseCustomRoles <> 1 AND req.[CategoryId] = @Cat_RoleSkill)
    OR (@UseCustomRoles = 1 AND req.[CategoryId] = @Cat_CustomRoleSkill)
  )
),

/* Role-only requirement contribution per role bucket (for Global Skill redistribution) */
roleskill_role_requirement_weight_raw AS (
  SELECT
    req.[RoleId],
    req.[CustomRoleId],
    SUM(CAST(req.[DynamicWeight] AS DOUBLE PRECISION) * 100.0) AS RoleContribution
  FROM requirement req
  WHERE (
    (@UseCustomRoles <> 1 AND req.[CategoryId] = @Cat_Role)
    OR (@UseCustomRoles = 1 AND req.[CategoryId] = @Cat_CustomRole)
  )
  GROUP BY
    req.[RoleId],
    req.[CustomRoleId]
),

/* Base skill weight (pre-redistribution) */
roleskill_base_weight_raw AS (
  SELECT
    req.RequirementId,
    req.[RoleId],
    req.[CustomRoleId],
    req.[SkillId],
    req.ReqScore,
    req.[CategoryId],
    req.[TenantId],
    CAST(req.[DynamicWeight] AS DOUBLE PRECISION) * CAST(req.[RoleWeight] AS DOUBLE PRECISION) AS SkillBaseWeight
  FROM roleskill_requirement_raw req
),

/* Sum of base skill weights per role bucket */
roleskill_bucket_weight_sum_raw AS (
  SELECT
    base_weight.[RoleId],
    base_weight.[CustomRoleId],
    SUM(base_weight.SkillBaseWeight) AS SkillBaseSum
  FROM roleskill_base_weight_raw base_weight
  GROUP BY
    base_weight.[RoleId],
    base_weight.[CustomRoleId]
),

/* Per-row redistributed weight (Global Skill mode only) */
roleskill_weight_after_distribution_raw AS (
  SELECT
    req.RequirementId,
    req.[CategoryId],
    req.[RoleId],
    req.[CustomRoleId],
    req.[SkillId],
    req.ReqScore,
    req.[TenantId],
    CASE
      WHEN @RoleSkillScoringModeId = @ScoringMode_GlobalSkill
           AND COALESCE(bucket_weight.SkillBaseSum, 0) > 0
      THEN base_weight.SkillBaseWeight
           + COALESCE(role_weight.RoleContribution, 0)
             * (
                 base_weight.SkillBaseWeight
                 / bucket_weight.SkillBaseSum
               )
      ELSE base_weight.SkillBaseWeight
    END AS SkillWeightAfterDistribution
  FROM roleskill_requirement_raw req
  JOIN roleskill_base_weight_raw base_weight
    ON base_weight.RequirementId = req.RequirementId
  LEFT JOIN roleskill_bucket_weight_sum_raw bucket_weight
    ON (
      (@UseCustomRoles <> 1 AND bucket_weight.[RoleId] = req.[RoleId])
      OR (@UseCustomRoles = 1 AND bucket_weight.[CustomRoleId] = req.[CustomRoleId])
    )
  LEFT JOIN roleskill_role_requirement_weight_raw role_weight
    ON (
      (@UseCustomRoles <> 1 AND role_weight.[RoleId] = req.[RoleId])
      OR (@UseCustomRoles = 1 AND role_weight.[CustomRoleId] = req.[CustomRoleId])
    )
),

/* Rank deduplicated global-skill rows by highest required score first */
roleskill_requirement_ranked_global AS (
  SELECT
    req.RequirementId,
    req.[CategoryId],
    req.[RoleId],
    req.[CustomRoleId],
    req.[SkillId],
    req.ReqScore,
    req.[TenantId],
    req.SkillWeightAfterDistribution,
    ROW_NUMBER() OVER (
      PARTITION BY req.[TenantId], req.[SkillId]
      ORDER BY req.ReqScore DESC, req.SkillWeightAfterDistribution DESC, req.RequirementId ASC
    ) AS SkillRank
  FROM roleskill_weight_after_distribution_raw req
),

/* Merge global-skill duplicates across role buckets */
roleskill_requirement_aggregated_global AS (
  SELECT
    req.[SkillId],
    req.[TenantId],
    MAX(req.ReqScore) AS ReqScore,
    SUM(req.SkillWeightAfterDistribution) AS SkillWeightEffective
  FROM roleskill_weight_after_distribution_raw req
  GROUP BY
    req.[SkillId],
    req.[TenantId]
),

/* Effective role-skill requirements used for scoring by selected mode */
roleskill_requirement_effective AS (
  SELECT
    req.RequirementId,
    req.[CategoryId],
    req.[RoleId],
    req.[CustomRoleId],
    req.[SkillId],
    req.ReqScore,
    req.[TenantId],
    req.SkillWeightAfterDistribution AS SkillWeightEffective
  FROM roleskill_weight_after_distribution_raw req
  WHERE @RoleSkillScoringModeId <> @ScoringMode_GlobalSkill

  UNION ALL

  SELECT
    rep.RequirementId,
    rep.[CategoryId],
    rep.[RoleId],
    rep.[CustomRoleId],
    rep.[SkillId],
    agg.ReqScore,
    rep.[TenantId],
    agg.SkillWeightEffective
  FROM roleskill_requirement_ranked_global rep
  JOIN roleskill_requirement_aggregated_global agg
    ON agg.[SkillId] = rep.[SkillId]
   AND agg.[TenantId] = rep.[TenantId]
  WHERE @RoleSkillScoringModeId = @ScoringMode_GlobalSkill
    AND rep.SkillRank = 1
),

/* Role-scoped RoleSkill candidate scores */
roleskill_role_score AS (
  SELECT
    req.RequirementId,
    experience.[ConsultantId] AS ConsultantId,
    MAX(experience.[Score])   AS RoleScore
  FROM roleskill_requirement_effective req
  JOIN {Experience} experience
    ON experience.[TenantId] = req.[TenantId]
   AND experience.[Score] > 0
   AND (
     (@UseCustomRoles <> 1
      AND experience.[CategoryId] = @Cat_RoleSkill
      AND experience.[RoleId] = req.[RoleId]
      AND experience.[SkillId] = req.[SkillId])
     OR (@UseCustomRoles = 1
         AND experience.[CategoryId] = @Cat_CustomRoleSkill
         AND experience.[CustomRoleId] = req.[CustomRoleId]
         AND experience.[SkillId] = req.[SkillId])
   )
  JOIN eligible_consultant ec
    ON ec.ConsultantId = experience.[ConsultantId]
  GROUP BY
    req.RequirementId,
    experience.[ConsultantId]
),

/* Skill-scoped RoleSkill candidate scores */
roleskill_global_score AS (
  SELECT
    req.RequirementId,
    experience.[ConsultantId] AS ConsultantId,
    MAX(experience.[Score])   AS GlobalScore
  FROM roleskill_requirement_effective req
  JOIN {Experience} experience
    ON experience.[TenantId] = req.[TenantId]
   AND experience.[Score] > 0
   AND (
     (@UseCustomRoles <> 1
      AND experience.[CategoryId] = @Cat_Skill
      AND experience.[SkillId] = req.[SkillId])
     OR (@UseCustomRoles = 1
         AND experience.[CategoryId] = @Cat_CustomSkill
         AND experience.[SkillId] = req.[SkillId])
   )
  JOIN eligible_consultant ec
    ON ec.ConsultantId = experience.[ConsultantId]
  GROUP BY
    req.RequirementId,
    experience.[ConsultantId]
),

/* Effective score for selected RoleSkill scoring mode */
roleskill_score AS (
  SELECT
    score_source.RequirementId,
    score_source.ConsultantId,
    MAX(score_source.RoleScore)   AS RoleScore,
    MAX(score_source.GlobalScore) AS GlobalScore,
    CASE
      WHEN @RoleSkillScoringModeId = @ScoringMode_StrictRole
      THEN COALESCE(MAX(score_source.RoleScore), 0)
      WHEN @RoleSkillScoringModeId = @ScoringMode_GlobalSkill
      THEN COALESCE(MAX(score_source.GlobalScore), 0)
      WHEN @RoleSkillScoringModeId = @ScoringMode_RoleFirstHybrid
      THEN GREATEST(
             COALESCE(MAX(score_source.RoleScore), 0),
             GREATEST(COALESCE(MAX(score_source.GlobalScore), 0) - 1, 0)
           )
      ELSE COALESCE(MAX(score_source.RoleScore), 0)
    END AS EffectiveScore
  FROM (
    SELECT
      role_score.RequirementId,
      role_score.ConsultantId,
      role_score.RoleScore,
      CAST(NULL AS INTEGER) AS GlobalScore
    FROM roleskill_role_score role_score

    UNION ALL

    SELECT
      global_score.RequirementId,
      global_score.ConsultantId,
      CAST(NULL AS INTEGER) AS RoleScore,
      global_score.GlobalScore
    FROM roleskill_global_score global_score
  ) score_source
  GROUP BY
    score_source.RequirementId,
    score_source.ConsultantId
),

/* RoleSkill scoring branch using effective score from selected mode */
branch_roleskill AS (
  SELECT
    roleskill_score.ConsultantId AS ConsultantId,
    CASE WHEN @UseCustomRoles = 1 THEN @Cat_CustomRoleSkill ELSE @Cat_RoleSkill END AS CategoryId,
    CAST(
      CASE
        WHEN req.ReqScore = 0 THEN 0
        ELSE
          CASE
            WHEN roleskill_score.EffectiveScore >= req.ReqScore THEN req.SkillWeightEffective
            ELSE req.SkillWeightEffective * (CAST(roleskill_score.EffectiveScore AS DOUBLE PRECISION) / CAST(req.ReqScore AS DOUBLE PRECISION))
          END
      END
    AS DOUBLE PRECISION) AS partial_score
  FROM roleskill_requirement_effective req
  JOIN roleskill_score
    ON roleskill_score.RequirementId = req.RequirementId
  WHERE req.ReqScore <> 0
    AND roleskill_score.EffectiveScore > 0
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
  WHERE @RoleSkillScoringModeId <> @ScoringMode_GlobalSkill
    AND req.ReqScore <> 0
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

    /* 6) HasActiveFilters (true if any filter is active: requirement, availability, or location) */
    (SELECT HasFilters FROM has_filtered_requirements) AS HasActiveFilters

  FROM price_performance pp
) final
ORDER BY final.MatchingScore DESC
LIMIT @MaxRecords
OFFSET @StartIndex
