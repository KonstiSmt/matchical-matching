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
- Input contract uses `New Info` (required), `Existing Versions` (optional), `Linked Engagement Descriptions` (optional), and `Notes` (optional).
- `New Info` may be text-only, image-only, or mixed.
- Project output keys are `Rationale`, `BulletVersion`, `ParagraphVersion`, `MixedVersion`, `RawVersion` (in that order).
- `RawVersion` keeps full project detail; clean versions apply anonymization.
- Clean versions must remain project-centric and impersonal.
- Clean versions prioritize core project essence (management-summary style) over exhaustive contribution-level detail.
- Linked engagement evidence is analyzed as whole engagement packages (all linked versions together), with repeated facts deduplicated per engagement.
- Linked engagement `Start`/`End`/`Capacity` are weighting signals only (`Start`/`End` input format: `MMMM yyyy`; `End` may be `ongoing` for no end date).
- Coverage in clean versions is salience-based: include only the highest-value project signals (objective/scope, core transformation, primary context/constraint, outcomes when evidenced).
- Clean versions suppress low-signal operational execution detail unless needed to understand project purpose or delivery model.
- Length behavior is strongly compact by default: one paragraph preferred; expansion only when clearly distinct, material value is added.
- Bullet and mixed outputs are intentionally selective to avoid sentence-by-sentence mapping from source data.
- Clean versions must not contain spacer/empty paragraph tags (`<p>&nbsp;</p>`, empty `<p>`).
- If project-level evidence is insufficient for clean versions, return empty strings for those versions while preserving available input in `RawVersion`.
- `Notes` can add facts and instructions, but cannot override anonymization, HTML subset, or output structure.
- HTML escaping is minimal: escape only `&`, `<`, and `>` in text content; preserve normal UTF-8 apostrophes and quotation marks as literal characters.

## Findings and Learnings
- Examples must be illustrative and not treated as fixed templates.
- Narration-trap examples are needed to prove clean versions avoid consultant framing.
- Sparse tech-stack examples are needed to prove conservative empty-output fallback.
- Rich-input examples are needed to show controlled expansion without padding.
- Wording in clean versions should avoid anthropomorphic project agency for tactical tasks and prefer neutral constructions.
- Redundancy quality depends on phrasing control, not fact suppression: semantic overlap with linked engagement clean versions is acceptable, but mirrored sentence/list patterns should be reduced.
- The main quality risk is over-mapping engagement execution detail into project text; prompt guidance and examples should bias toward abstraction and essence-first synthesis.

## Open Questions
- Do we need stricter heuristics for detecting near-copy phrasing against linked engagement clean versions across different languages?
