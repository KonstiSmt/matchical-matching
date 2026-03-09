# Internal Meetings

This folder stores raw internal meeting records imported from Fireflies.

## Purpose

- Keep internal operational transcripts available in the repo.
- Keep these records outside `docs/knowledge-base/` so they are not treated as durable knowledge-base content by default.
- Add analysis or derived notes later only when explicitly requested.

## Structure

```text
docs/internal-meetings/
  YYYY-MM-DD-<topic>-<transcript-id>/
    transcript.md
    metadata.json
```

## Metadata

Each `metadata.json` file includes the original Fireflies IDs, participants, detected domains, meeting kind, and a broad category tag.
