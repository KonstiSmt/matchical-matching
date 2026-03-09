# Mini CRM

This folder stores account-level lead research and meeting intelligence in a consistent structure.

## Goals

- Keep one place per customer account.
- Keep raw meeting imports and curated meeting notes together without forcing both for every meeting.
- Make ICP qualification and next actions easy to track.

## Folder structure

```text
crm/
  inbox/
    meetings/
      YYYY-MM-DD-<topic>-<transcript-id>/
        transcript.md
        metadata.json
  accounts/
    <account-slug>/
      account.md
      contacts/
        <person-slug>.md
      meetings/
        YYYY-MM-DD-<topic>/
          transcript.md
          metadata.json
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
- Store raw Fireflies imports under `meetings/` with `transcript.md` and `metadata.json`.
- Use `meeting-notes/` only for curated analysis artifacts that are created later on demand.
- Store original non-Fireflies source files unchanged under `meeting-notes/.../source/` when you create a curated note package.
- Update `account.md` when a human or a later workflow explicitly decides to enrich the account record.
- Keep claims tagged as `confirmed` or `inferred`.
