# Project Description Prompt Notes

## Purpose
Keep this file as non-runtime context for the project description prompt. It captures intent, non-intent, decisions, and findings that inform iteration, while runtime behavior stays in `project-description.md`.

## Intent
- Generate a trustworthy project-level description from dynamic inputs.
- Preserve a full, editable aggregated `RawVersion`.
- Produce clean versions that are anonymized, neutral, project-centric, and reusable.

## Non-Intent
- Do not use this prompt to generate consultant-perspective narration in clean versions.
- Do not use clean versions for client-identifying or date-specific statements.
- Do not force rigid template writing that makes outputs read identical.

## Current Decisions
- Input contract uses `New Info` (required), `Existing Versions` (optional), and `Notes` (optional).
- `New Info` may be text-only, image-only, or mixed.
- `RawVersion` keeps full project detail; clean versions apply anonymization.
- Clean versions must remain project-centric and impersonal.
- Coverage in clean versions is principle-based (objective/scope, what/why, context, measures, outcomes) and only included when evidenced.
- Length behavior is adaptive: compact by default, with expansion only when added text contributes distinct project value.
- If project-level evidence is insufficient for clean versions, return empty strings for those versions while preserving available input in `RawVersion`.
- `Notes` can add facts and instructions, but cannot override anonymization, HTML subset, or output structure.

## Findings and Learnings
- Examples must be illustrative and not treated as fixed templates.
- Narration-trap examples are needed to prove clean versions avoid consultant framing.
- Sparse tech-stack examples are needed to prove conservative empty-output fallback.
- Rich-input examples are needed to show controlled expansion without padding.

## Open Questions
- Do we need stricter anonymization guidance for edge cases such as subsidiaries, branded platforms, or uniquely identifying program names?
