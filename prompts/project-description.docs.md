# Project Description Prompt Notes

## Purpose
Keep this file as non-runtime context for the project description prompt. It captures intent, non-intent, decisions, and findings that inform iteration, while runtime behavior stays in `project-description.md`.

## Intent
- Generate a trustworthy project-level description from dynamic inputs.
- Preserve a full, editable aggregated `RawVersion`.
- Produce clean versions that are anonymized, neutral, and reusable.

## Non-Intent
- Do not use this prompt to extract dedicated fields like problem statement, objective, outcome, or method/approach (handled in separate pipeline steps).
- Do not use clean versions for client-identifying or date-specific statements.
- Do not force rigid template writing that makes outputs read identical.

## Current Decisions
- Input contract uses `New Info` (required), `Existing Versions` (optional), and `Notes` (optional).
- `New Info` may be text-only, image-only, or mixed.
- `RawVersion` keeps full project detail; clean versions apply anonymization.
- `Notes` can add facts and instructions, but cannot override anonymization, HTML subset, or output structure.
- Length behavior is soft and conservative: concise by default, with controlled expansion for very rich inputs.

## Findings and Learnings
- Examples must be illustrative and not treated as fixed templates.
- Long-input scenarios are necessary to show that `RawVersion` can be extensive while clean versions remain focused.
- Conservative inference must be explicit and repeated: if uncertain, omit.

## Open Questions
- Do we need stricter anonymization guidance for edge cases such as subsidiaries, branded platforms, or uniquely identifying program names?
