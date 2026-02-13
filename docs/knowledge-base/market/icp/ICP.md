# Ideal Customer Profile (ICP) Overview

## Confirmed Facts
### Segmentation Model
- Matchical currently uses three behavior-based ICP modes:
  - ICP 1: Consultancy Core System
  - ICP 2: External Staffing Agency
  - ICP 3: Framework Orchestrator
- These ICP modes are distinct for analysis and messaging.
- One customer organization can map to one, two, or all three ICP modes at the same time.
- Different ICP modes can involve different buying centers and decision makers.

### Geographic and Size Focus (Current Targeting)
- Primary geographic focus is the DACH region.
- Size guidance is ICP-specific:
  - ICP 1: consultancy context with at least ~50 consultants.
  - ICP 2: can include small staffing teams (for example ~3-5 recruiters and roughly ~5-10+ employees).
  - ICP 3: size can vary and should be evaluated more by operating model than by employee count.

### Core Fit Boundaries
- Matchical targets high-skill consulting and staffing workflows around consultant data, demand parsing, matching, and CV output.
- Core non-fit boundaries:
  - Permanent-recruiting ATS workflows.
  - Low-skill temporary labor staffing models.
  - AUE/ANUE-heavy models without core project-consultant placement focus.

### Buying and Adoption Pattern (Current Motion)
- In most cases, chief executives are involved in final purchase decisions.
- Current buying motion in practice:
  - Showcase/demo.
  - Free trial with no paperwork.
  - 3-month paid proof-of-concept phase (flat-fee model currently used).
  - Transition to paid plans based on consultant-volume usage.

## Assumptions
- Buying-trigger hierarchy across ICP modes remains hypothesis-level and must be validated through sales and lead-gen experiments.
- KPI hierarchy before purchase is still not stable enough to standardize by ICP.

### Lead-Research Evidence Schema (Draft)
- Suggested fields per lead record:
  - `company_name`
  - `domain`
  - `geo`
  - `icp_candidate` (1, 2, or 3)
  - `signal_name`
  - `signal_value`
  - `evidence_status` (`confirmed` or `inferred`)
  - `source_type` (website, job posting, news, profile)
  - `source_url`
  - `captured_at`
  - `notes`

### Lead-Research Mode (Draft)
- Run scoring and qualification per ICP separately (not as one combined model).

## Notes
### How to Use These ICPs
- Use ICPs as behavior patterns, not as legal-company-type labels.
- Keep account-level ICP mapping separate from buyer-role mapping.
- Update ICP assumptions continuously from trial and proof-of-concept observations.

### Detailed ICP Files
- [ICP 1: Consultancy Core System](./icp-1-consultancy-core-system.md)
- [ICP 2: External Staffing Agency](./icp-2-external-staffing-agency.md)
- [ICP 3: Framework Orchestrator](./icp-3-framework-orchestrator.md)
