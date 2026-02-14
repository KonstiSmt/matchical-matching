# Knowledge Base Rules

## Scope
These rules apply to `docs/knowledge-base/` and all subfolders.

## Purpose
This folder stores durable internal business knowledge for AI-assisted work and human review.

## Content Boundaries
- Include business concepts, product workflow features, market and ICP knowledge, roadmap context, and operating context.
- Do not use this folder for implementation details of queries, prompts, scripts, or other technical artifacts. Keep those in their respective folders.

## Current vs Future State
- Document current/live state in domain files.
- Document planned/future state in `docs/knowledge-base/roadmap/`.

## Writing Structure
For non-trivial knowledge files, use top-level sections:
- `## Confirmed Facts`
- `## Assumptions`
- `## Notes` (only when explicitly needed)

You may add deeper subheadings and paragraphs under these sections when useful.

## Accuracy Rules
- Do not present assumptions as facts.
- Assumptions are temporary working content.
- After explicit review, resolve assumptions into either Confirmed Facts or Notes.
- If a missing piece is not important right now, discard it.
- If a missing piece is important, capture it in `Notes`.

## Maintenance
When relevant new business concepts or workflow features appear, proactively ask whether `docs/knowledge-base/` should be updated.
