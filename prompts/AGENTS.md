# Prompting Conventions

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

## Change Discipline
- Make targeted changes that address the requested update only, unless a broader review is requested.
- Keep examples aligned with the current rules and output structure.

## DevTools Prompt Workflow
- Use the DevTools REST API to discover categories, fetch active prompts, and sync local files when requested.
- Always call categories first to confirm the category ID. Do not assume category IDs.
- If a prompt is requested, fetch the active prompt and compare with the repo files. If different, update the repo files to match the active prompt.
- Only post prompt updates when the user explicitly instructs to post. When asked to post, provide a bash command the user can run (do not execute the post yourself).
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
