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
