# Epic: Project Layer

## Confirmed Facts
- Project layer or project management capability is in the making.
- This is planned/future state and not current/live state.
- The intent is to strengthen project and engagement context handling inside Matchical workflows.

## Assumptions
- Project layer will improve continuity between staffing decisions and project-level operations.
- Scope should remain focused on Matchical-relevant staffing and engagement workflows, not generic ERP project management.

## Notes
- Keep this epic as the high-level container.
- Working design note for taxonomy and matching model:
  - [Project Layer Taxonomy and Matching (V1 Working Design)](./project-layer-taxonomy-and-matching-v1.md)
- The working design note currently covers:
  - Engagement and project taxonomy decisions (`Industry`, `Business Process`, `Delivery Type`, and dropped `Functional Area` / `Project Category`).
  - Canonical facet catalogs for matching (`Business Process`, `Delivery Type`, `Problem Theme`, `Objective Theme`, `Outcome Type`, `Project Capability`).
  - Project data composition across facets, aggregated role/skill evidence, main description versions, and dedicated text fields (`ProblemStatementText`, `ObjectiveText`, `OutcomeText`, `MethodApproachText`).
- Add implementation-level scope, data model changes, rollout phases, and migration steps once execution planning starts.
