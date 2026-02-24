# Mini CRM

This folder stores account-level lead research and meeting intelligence in a consistent structure.

## Goals

- Keep one place per customer account.
- Keep raw source files and curated notes together.
- Make ICP qualification and next actions easy to track.

## Folder structure

```text
crm/
  accounts/
    <account-slug>/
      account.md
      contacts/
        <person-slug>.md
      meeting-notes/
        YYYY-MM-DD-<topic>/
          notes.md
          actions.md
          source/
            <raw files>
```

## Input priority for Codex

1. Transcript (`.md` or `.txt`) with speaker labels and timestamps.
2. Optional call summary (`.md`, `.docx`, `.pdf`).
3. Optional audio (`.mp3`, `.m4a`) when transcript quality is weak.
4. Video only when UI/visual context is critical.

Transcript is usually the best default because it is fastest to parse and easiest to quote with evidence.

## Working convention

- Use ISO dates (`YYYY-MM-DD`) in folder names.
- Store original files unchanged under `source/`.
- Put curated output in `notes.md` and execution follow-ups in `actions.md`.
- Update `account.md` after every meaningful call.
- Keep claims tagged as `confirmed` or `inferred`.
