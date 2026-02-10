/* GetMatchesByConsultantId : Advanced SQL (Aurora Postgres, ODC)
   Purpose: return demand matches for a consultant with scoring and paging.

   This is the INVERSE SCORING QUERY (Query 5). Returns only IDs and scores.
   Starts from a consultant and finds all demands whose requirements match the
   consultant's experiences. Same scoring formula as Query 1 (GetMatchesByDemandId),
   but with inverted join direction and no filter enforcement.

   Display data (demand names, details, etc.) comes from GetDemandMatchPreview (Query 6).

   Performance note:
     MATERIALIZED hints on CTEs (consultant, consultant_experience) prevent
     PostgreSQL planner instability. consultant_experience is read by all 5
     scoring branches; materializing it avoids 5 redundant Experience table scans.

   Output columns (ordered):
     DemandId, MatchingScore, PricePerformanceScore, MatchedRequirementsCount, Count
*/

WITH
/* _____________ Consultant context (single row) _____________ */
consultant AS MATERIALIZED (
  SELECT
    {Consultant}.[Id]       AS ConsultantId,
    {Consultant}.[TenantId] AS TenantId
  FROM {Consultant}
  JOIN {Status} consultant_status
    ON consultant_status.[Id] = {Consultant}.[StatusId]
  WHERE {Consultant}.[Id] = @ConsultantId
    AND {Consultant}.[TenantId] = @TenantId
    AND consultant_status.[IsReady] = 1
    AND consultant_status.[IsActive] = 1
),

/* _____________ Consultant experiences (pre_materialized for 5 branches) _____________ */
consultant_experience AS MATERIALIZED (
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
  JOIN consultant c ON c.ConsultantId = experience.[ConsultantId]
  WHERE experience.[TenantId] = @TenantId
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
     /* Standard RoleSkill */
     (@UseCustomRoles <> 1
      AND exp.CategoryId = @Cat_RoleSkill
      AND req.[CategoryId] = @Cat_RoleSkill
      AND req.[RoleId] = exp.RoleId
      AND req.[SkillId] = exp.SkillId)
     /* Custom RoleSkill */
     OR (@UseCustomRoles = 1
         AND exp.CategoryId = @Cat_CustomRoleSkill
         AND req.[CategoryId] = @Cat_CustomRoleSkill
         AND req.[CustomRoleId] = exp.CustomRoleId
         AND req.[SkillId] = exp.SkillId)
   )
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
     /* Standard Role */
     (@UseCustomRoles <> 1
      AND exp.CategoryId = @Cat_Role
      AND req.[CategoryId] = @Cat_Role
      AND req.[RoleId] = exp.RoleId
      AND req.[SkillId] IS NULL)
     /* Custom Role */
     OR (@UseCustomRoles = 1
         AND exp.CategoryId = @Cat_CustomRole
         AND req.[CategoryId] = @Cat_CustomRole
         AND req.[CustomRoleId] = exp.CustomRoleId
         AND req.[SkillId] IS NULL)
   )
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
  JOIN {Demand} demand ON demand.[Id] = kept_demand.DemandId
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
    /* 1) DemandId */
    pp.DemandId AS DemandId,

    /* 2) MatchingScore */
    pp.MatchingScore AS MatchingScore,

    /* 3) PricePerformanceScore (0_10 scale, rate per score point) */
    CASE
      WHEN pp.BestRatio > 0
      THEN (pp.Ratio / pp.BestRatio) * 10
      ELSE 0
    END AS PricePerformanceScore,

    /* 4) MatchedRequirementsCount (excludes Language) */
    pp.MatchedRequirementsCount AS MatchedRequirementsCount,

    /* 5) Total row count (computed once via window function) */
    COUNT(*) OVER() AS Count

  FROM price_performance pp
) final
ORDER BY final.MatchingScore DESC
LIMIT @MaxRecords
OFFSET @StartIndex
