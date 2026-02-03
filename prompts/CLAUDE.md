# AI Pipeline Prompts

This directory contains prompts for Matchical's AI pipelines.

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

- When you modify a prompt, scan for contradictions between rules and examples (e.g., allowed tags vs. example outputs).
- If you find inconsistencies, surface them to the user and resolve them in the prompt/examples.
- Do not add "validation" or "self-check" instructions inside the prompt itself.
- Prompts should be written as if they are the current source of truth; do not mention prior versions or changes inside the prompt.

## Change Discipline

- Make targeted changes that address the requested update only, unless a broader review is requested.
- Keep examples aligned with the current rules and output structure.

---

## DevTools Prompt Workflow

Use the DevTools REST API to discover categories, fetch active prompts, and sync local files.

### Workflow Rules

- Always call categories first to confirm the category ID. Do not assume category IDs.
- If a prompt is requested, fetch the active prompt and compare with the repo files. If different, update the repo files to match the active prompt.
- Only post prompt updates when the user explicitly instructs to post. When asked to post, provide a bash command the user can run (do not execute the post yourself).
- Do not create or modify categories; if a category is missing, report it.

### API Endpoints

| Method | Endpoint | Purpose |
|--------|----------|---------|
| GET | `/SystemPromtCategories` | List all prompt categories |
| GET | `/ActiveSystemPrompt?SystemPromptCategoryId={id}` | Fetch active prompt for category |
| POST | `/SystemPrompt?SystemPromptCategoryId={id}` | Post new prompt version |

### POST Payload

The POST payload must include:
- `Value` - The prompt text
- `OpenAIJsonSchema` - OpenAI schema JSON
- `GeminiJsonSchma` - Gemini schema JSON (note: backend misspelling)
- `Comment` - Version comment (max 500 chars)

### Local Runner

Use `scripts/devtools_api.py` and supply explicit file paths on POST (no defaults).

**Post Command Template:**
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
