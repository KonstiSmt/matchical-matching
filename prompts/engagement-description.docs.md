# Engagement Description Prompt Notes

## Purpose
Keep this file as non-runtime context for the engagement description prompt. It captures intent, non-intent, decisions, and findings that inform iteration, while runtime behavior stays in `engagement-description.md`.

## Intent
- Capture consultant-specific contributions in clean engagement versions.
- Preserve an editable raw/original source variant for traceability.
- Keep clean outputs safe, structured, and stakeholder-ready.

## Non-Intent
- Do not attribute project-wide achievements to the consultant without explicit grounding.
- Do not use generic skill/role statements disconnected from concrete actions.
- Do not place runtime output rules only in this docs file; those belong in the prompt.

## Current Decisions
- Engagement clean versions must prioritize consultant actions, responsibilities, and outcomes.
- Project-level context can be used only to clarify consultant actions where grounded.
- Exclusion rules are enforced consistently across outputs.
- Formatting constraints are strict (allowed tags only; no disallowed styling tags).

## Findings and Learnings
- Contradictions between rules and examples are a frequent failure mode and must be checked on each update.
- Example quality strongly influences output behavior; examples must reflect strict boundaries.

## Open Questions
- Should we add tighter operational guidance for conflict handling when consultant and project inputs disagree materially?
