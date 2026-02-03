# Project Description Prompt Notes

## Purpose
Keep this file as the working notes for the project description prompt. This is for design decisions, unresolved questions, and clarifications that should inform the prompt but do not belong inside the prompt itself.

## Current Decisions
- Project descriptions will be generated in four canonical formats: original (QuillJS HTML), bullet, mixed, and text.
- Project description should focus on project scope and summary, while other fields will cover problem statement, objective, outcome, and method/approach.
- Avoid excessive redundancy across project description vs. the other project fields.

## Open Questions
- What is the exact QuillJS HTML subset required for the project description “Original” format?
- What is the preferred mixed format pattern (e.g., short paragraph + bullets, or flexible)?
- Should the project description include or exclude client names and other sensitive fields, and is the exclusion list identical to the engagement prompt?
