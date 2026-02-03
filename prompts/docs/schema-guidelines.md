# JSON Schema Guidelines

Use this file whenever a prompt defines a JSON output structure and needs schemas for Gemini and OpenAI. Keep schemas in `prompts/schemas/` and ensure they stay in sync with the prompt output structure and examples.

## General Rules (Both Schemas)
- Only use these keywords: `type`, `description`, `properties`, `items`, `required`.
- Additionally allowed:
  - Google: `nullable`
  - OpenAI: `additionalProperties`
- Do not use `enum`, `format`, `pattern`, `minimum`, `maximum`, or other validation keywords.
- Preserve **property order** exactly as shown in the prompt output examples.
- Every property must have a concise description. Do not use escaped double quotes in descriptions; use single quotes if needed.

## Google Schema Rules
- Use `nullable: true` for any field that can be null (including arrays or nested objects).
- Do **not** include `additionalProperties` anywhere.

## OpenAI Schema Rules
- Use `type: ["<type>", "null"]` for any field that can be null (including arrays or nested objects).
- For every object, include `additionalProperties: false` at the end of its property list.

## Required Fields
- The `required` list must include all output keys and follow the same order as the properties.

## Storage
- Store schemas as:
  - `prompts/schemas/<prompt-name>.schema.google.json`
  - `prompts/schemas/<prompt-name>.schema.openai.json`
