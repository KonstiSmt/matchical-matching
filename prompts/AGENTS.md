# AI Pipeline Prompts

This directory contains prompts for Matchical's AI pipelines.

## Prompting Conventions

## Required Structure
Every prompt must use this section order and heading levels:
- `# Role`
- `# Task`
- `# Specifics`
- `# Context`
- `# Examples` (with `## Example X`, each containing `### Input` and `### Output`)
- `# Notes`

## Output Structure Discipline
- Keep JSON output keys in a fixed, explicit order and mirror that order in examples.
- When output fields or ordering change, update both schema files in `prompts/schemas/`.
- Follow the detailed schema rules in `prompts/docs/schema-guidelines.md`.

## Prompt QA (Consistency Checks)
- When modifying prompts, scan for contradictions between rules and examples.
- Surface inconsistencies to the user and resolve them in the prompt/examples.
- Do not add validation or self-check instructions inside prompts.
- Prompts should not mention prior versions or change history.

## Change Discipline
- Make targeted changes that address the requested update only, unless a broader review is requested.
- Keep examples aligned with the current rules and output structure.
- Keep prompt edits tightly scoped to explicitly provided requirements.
- Do not add inferred requirements unless the user explicitly asks for exploration/elaboration.
- If a requirement is uncertain or ambiguous, ask a focused clarification question before changing the prompt.
- Do not reword or simplify existing prompt language unless the user explicitly asks for that wording change.
- Before adding handling for a potential edge case, confirm with the user that the edge case can occur in runtime.

## Prompt Docs Files (`*.docs.md`)
- Use prompt docs files for non-runtime context only: intent, non-intent, design decisions, findings, and open questions.
- Keep all runtime output behavior in the prompt file itself (`.md`), not in the docs file.
- If a rule changes model output, format, or constraints, update the prompt first and reflect only a short rationale in docs.
- Keep docs concise and decision-oriented; avoid duplicating full prompt text.
- Maintain one docs file per prompt when useful (for example, `engagement-description.docs.md`, `project-description.docs.md`).

## DevTools Prompt Workflow
- Use the DevTools REST API to discover categories, fetch active prompts, and sync local files when requested.
- Always call categories first to confirm the category ID. Do not assume category IDs.
- If a prompt is requested, fetch the active prompt and compare with the repo files. If different, update the repo files to match the active prompt.
- Only post prompt updates when the user explicitly instructs to post. When asked to post, provide a bash command the user can run (do not execute the post yourself).
- Keep post comments short and specific to the change; avoid boilerplate like \"update prompt\" or \"sync schemas\".
- For posting, use the command format below and fill in the correct category ID, prompt file, and schema paths.
- The POST payload must include `Value`, `OpenAIJsonSchema`, `GeminiJsonSchma` (backend misspelling), and `Comment` (<= 500 chars).
- Do not create or modify categories; if a category is missing, report it.

### DevTools API Endpoints
- `GET /SystemPromtCategories`
- `GET /ActiveSystemPrompt?SystemPromptCategoryId={id}`
- `POST /SystemPrompt?SystemPromptCategoryId={id}`

### Local Runner
Use `scripts/devtools_api.py` and supply explicit file paths on POST (no defaults).

### Post Command Template
```bash
python3 scripts/devtools_api.py post <category_id> "<comment>" \
  <prompt_file> \
  <openai_schema_file> \
  <gemini_schema_file>
```

---

## Planned Modules

Folders will be created as needed:
- CV parsing pipeline
- Skill classification
- Requirement matching justification
- Translation
