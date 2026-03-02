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
- Clean versions use consultant description as the primary evidence source; project description is secondary and clarifies only.
- Project-level context can be used only to clarify consultant actions where grounded.
- `ParagraphVersion` is mandatory first-person in the consultant language.
- For both `MixedVersion` and `ParagraphVersion`, the first sentence must not start with `I` or `Ich`.
- Project-only context statements that are not tied to consultant contribution are dropped from clean engagement versions.
- Clean versions may use adaptive sparse fallback (minimal meaningful consultant-oriented text) when explicit action evidence is weak, but must return empty if meaningful non-fabricated output is not feasible.
- Clean versions should reduce overlap with project descriptions by selecting high-signal contributions instead of exhaustively converting every granular input point.
- Exclusion rules are enforced consistently across outputs.
- Formatting constraints are strict (allowed tags only; no disallowed styling tags).

## Findings and Learnings
- Contradictions between rules and examples are a frequent failure mode and must be checked on each update.
- Example quality strongly influences output behavior; examples must reflect strict boundaries.
- Redundancy risk rises when both prompts consume the same source content; engagement outputs need explicit contribution-first selection to remain distinct from project descriptions.
- The most frequent drift is converting project framing into consultant actions; explicit statement classification and drop logic reduce this failure mode.
- First-person requirements can drift when opener-variation rules are introduced; docs must lock both perspective and opener constraints together.

## Open Questions
- Should we add tighter operational guidance for conflict handling when consultant and project inputs disagree materially?
