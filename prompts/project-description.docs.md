# Project Description Prompt Notes

## Purpose
Keep this file as the working notes for the project description prompt. This is for design decisions, unresolved questions, and clarifications that should inform the prompt but do not belong inside the prompt itself.

## Current Decisions
- Project descriptions are generated in four canonical formats: raw (QuillJS HTML), bullet, mixed, and text.
- `RawVersion` is an aggregated project dump and keeps available details, including client/date data.
- Clean versions (`BulletVersion`, `MixedVersion`, `TextVersion`) apply anonymization (remove client-identifying details and project timing).
- Project description focuses on broad project scope and concrete project actions; deeper fields like problem statement, objective, outcome, and method/approach are handled in separate pipeline steps.
- Input sections for this prompt are: `New Info`, `Existing Versions`, and optional `Notes`.

## Open Questions
- Do we want stricter operational guidance for entity-level anonymization edge cases (for example subsidiaries, named products tied to one client)?
- Should we define explicit maximum target lengths for each clean version, or keep current flexible ranges?
