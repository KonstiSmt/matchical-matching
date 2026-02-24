# Repository Agent Guide

Repository includes development artifacts for Matchical: queries, prompts, mockups, and specifications.

## Repository Context
- Platform: OutSystems ODC with Aurora PostgreSQL
- Entity definitions: `docs/entities/README.md`
- Never assume entity attributes; ask if unsure

## Python Environment Rules
- Use the repository-root virtual environment `.venv/`; do not create virtual environments inside subfolders (for example, under `tmp/`).
- If a tracked Python script needs third-party packages, list them in repository-root `requirements.txt`.
- Always use repository-root `.env` for shared environment variables required by scripts and tooling; do not use per-folder env files.
- In a worktree, if repository-root `.env` is missing and env changes are requested, create `.env` in that worktree and report which keys were added and still need user-provided values.

## JS Dependency Rules
- Keep JavaScript dependency manifests and lockfiles tracked in-repo (for example, `slides/package.json` and `slides/pnpm-lock.yaml`); never commit `node_modules/`.
- In each new worktree, run `pnpm install` in `slides/` before slide development and report that it was executed.

## Directory Guide
- `prompts/`: AI pipeline prompts. Follow `prompts/AGENTS.md`.
- `queries/`: SQL queries. Follow `queries/AGENTS.md`.
- `mockups/`: UI mockups and specifications.
- `docs/entities/`: Entity reference documentation.

## Knowledge Base Awareness
- If relevant new business concepts or workflow features are introduced, proactively ask whether `docs/knowledge-base/` should be updated.
- Keep technical implementation details (queries/prompts/scripts) in their own folders, not in the knowledge base.
- Do not add generic reporting or query artifacts to `docs/knowledge-base/`; only add customer-facing value propositions or offering-level insights.
- Keep planned/future-state knowledge in `docs/knowledge-base/roadmap/` and current/live state in domain docs.
- Always use repository-relative paths in docs/instructions; never use worktree-specific absolute paths.

## Technical Capability Documentation
- Document technical repository capabilities and workflows (for example, code-based slide production) in the relevant `AGENTS.md` files.
- Do not document technical capabilities in `docs/knowledge-base/`; that folder is only for business concepts and market/product knowledge.

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

## External File Discovery
- Do not run broad/random filesystem searches for user-provided external files.
- If external file paths are unclear or unavailable, ask the user to provide or re-provide exact paths.

## Worktree Merge Workflow
- Trigger condition: when the user says a worktree is done and requests merging to the main checkout.
- Step 1: merge or sync the latest main checkout into the worktree branch first.
- Step 2: resolve all merge conflicts inside the worktree.
- Step 3: only after conflicts are resolved and validated, merge the worktree branch back into the main checkout.
- Step 4: do not use the reverse conflict-resolution flow on main first unless the user explicitly overrides.

## Design Documentation Fidelity
- For style guides and UI documentation, only document tokens/components/rules that are explicitly provided or verified in existing artifacts.
- Do not invent missing design values or rules.
