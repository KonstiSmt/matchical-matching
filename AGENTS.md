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

## Instruction Maintenance
- When the user gives a durable rule (for example: "always", "never", "from now on"), add it to `AGENTS.md`.
- Add the rule at the narrowest valid scope:
  - Repo-wide rule: `/Users/konsti/.codex/worktrees/f327/matchical-matching/AGENTS.md`
  - Prompt-only rule: `/Users/konsti/.codex/worktrees/f327/matchical-matching/prompts/AGENTS.md`
  - Query-only rule: `/Users/konsti/.codex/worktrees/f327/matchical-matching/queries/AGENTS.md`
  - Matching-module rule: `/Users/konsti/.codex/worktrees/f327/matchical-matching/queries/matching/AGENTS.md`
- Do not add one-off task instructions to AGENTS files.
- Keep new rules short, testable, and non-duplicative.
- If a new rule conflicts with an existing rule, ask for clarification before changing AGENTS files.

## Voice Dictation Handling
- User may issue requests via voice dictation
- Treat obvious minor transcription errors as intended wording
- If ambiguity could materially change the technical result, ask a focused clarification before proceeding
