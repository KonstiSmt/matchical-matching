# Repository Instructions

## Agent Scope
This agent focuses exclusively on **prompts**. When working in this repository, your primary concern is the `prompts/` directory.

## Instruction Priority
1. Subfolder `AGENTS.md` files (e.g., `prompts/AGENTS.md`) have highest priority for their scope
2. This global `AGENTS.md` provides general context
3. `CLAUDE.md` files provide supplementary reference information

## Primary Focus: Prompts
- Work in `prompts/` directory
- Follow `prompts/AGENTS.md` for prompt-specific rules, structure, and DevTools workflow
- See `prompts/CLAUDE.md` for additional conventions

## Reference Context
- Entity docs in `docs/entities/` (never assume attributes - ask if unsure)
- Platform: OutSystems ODC with Aurora PostgreSQL
- See global `CLAUDE.md` for repository overview if needed

## Knowledge Base Awareness
- If relevant new business concepts or workflow features are introduced, proactively ask whether `docs/knowledge-base/` should be updated.
- Keep technical implementation details (queries/prompts/scripts) in their own folders, not in the knowledge base.
- Keep planned/future-state knowledge in `docs/knowledge-base/roadmap/` and current/live state in domain docs.
- Always use repository-relative paths in docs/instructions; never use worktree-specific absolute paths.
