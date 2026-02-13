# Repository Agent Guide

Repository includes development artifacts for Matchical: queries, prompts, mockups, and specifications.

## Repository Context
- Platform: OutSystems ODC with Aurora PostgreSQL
- Entity definitions: `docs/entities/README.md`
- Never assume entity attributes; ask if unsure

## Directory Guide
- `prompts/`: AI pipeline prompts. Follow `prompts/AGENTS.md`.
- `queries/`: SQL queries. Follow `queries/AGENTS.md`.
- `mockups/`: UI mockups and specifications.
- `docs/entities/`: Entity reference documentation.

## Knowledge Base Awareness
- If relevant new business concepts or workflow features are introduced, proactively ask whether `docs/knowledge-base/` should be updated.
- Keep technical implementation details (queries/prompts/scripts) in their own folders, not in the knowledge base.
- Keep planned/future-state knowledge in `docs/knowledge-base/roadmap/` and current/live state in domain docs.
- Always use repository-relative paths in docs/instructions; never use worktree-specific absolute paths.

## Instruction Maintenance
- When the user gives a durable rule (for example: "always", "never", "from now on"), add it to `AGENTS.md`.
- Add the rule at the narrowest valid scope:
  - Repo-wide rule: `AGENTS.md`
  - Prompt-only rule: `prompts/AGENTS.md`
  - Query-only rule: `queries/AGENTS.md`
  - Matching-module rule: `queries/matching/AGENTS.md`
- Do not add one-off task instructions to AGENTS files.
- Keep new rules short, testable, and non-duplicative.
- If a new rule conflicts with an existing rule, ask for clarification before changing AGENTS files.

## Voice Dictation Handling
- User may issue requests via voice dictation
- Treat obvious minor transcription errors as intended wording
- If ambiguity could materially change the technical result, ask a focused clarification before proceeding

## Worktree Merge Workflow
- Trigger condition: when the user says a worktree is done and requests merging to the main checkout.
- Step 1: merge or sync the latest main checkout into the worktree branch first.
- Step 2: resolve all merge conflicts inside the worktree.
- Step 3: only after conflicts are resolved and validated, merge the worktree branch back into the main checkout.
- Step 4: do not use the reverse conflict-resolution flow on main first unless the user explicitly overrides.
