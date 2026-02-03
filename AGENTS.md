# Repository Instructions

## Source of Truth
- Only `AGENTS.md` files are authoritative. Ignore `CLAUDE.md` files unless the user explicitly asks to use them.
- Other repository docs (e.g., `README`, `docs/`) remain valid references.
- Subfolder `AGENTS.md` files (e.g., `prompts/AGENTS.md`) override or extend these rules for their scope.

## Repository Overview
- This repo contains development artifacts for Matchical (queries, prompts, mockups, and specifications). It is not a full application codebase.
- Platform context: OutSystems ODC with Aurora PostgreSQL.

## Entity Documentation
- Entity reference docs live in `docs/entities/`.
- Never assume entity attributes. Ask if unsure.
- All queries must filter by `TenantId` for multi-tenancy.
- Booleans are stored as `0/1` integers.

## Directory Guide
- `queries/`: SQL queries (OutSystems ODC Advanced SQL).
- `prompts/`: AI prompt templates and docs.
- `mockups/`: UI mockups and specs.
- `docs/entities/`: Entity reference documentation.

## Query Conventions
- Follow `queries/AGENTS.md` for SQL rules and conventions.

## Prompt Conventions
- Follow `prompts/AGENTS.md` for prompt-specific structure, schema rules, and change discipline.
