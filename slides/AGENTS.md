# Slides Module Guide

## Scope
These rules apply to `slides/` and all subfolders.

## Authoring Model
- Use pure HTML/CSS/JS for slide authoring in v1.
- Prioritize live browser deck quality over static export workflows.
- Keep layouts flexible for Codex-driven iteration; do not enforce strict template constraints in v1.
- Default slide composition to vertically centered content blocks; when using left alignment, keep the content block vertically centered.
- Avoid text-only slides by default; include lightweight visual anchors (for example icons, shapes, or diagrams) where they improve clarity.

## Outputs
- Live deck is the primary output.
- PDF export is required and should remain functional via local scripts.

## Brand and Style Source
- Store logos and slide brand assets in `slides/assets/brand/`.
- Keep reusable style tokens in `slides/src/theme/`.
- Keep human-readable style references in `slides/style-guide.md`.
- If additional external assets are needed, ask the user for explicit file paths instead of scanning unrelated locations.
- Store slide runtime credentials in repository-root `.env` (gitignored), not in `slides/.env.*`.

## Documentation Boundaries
- Document slide workflow capability in `AGENTS.md` files, not in `docs/knowledge-base/`.
- Use repository-relative paths in documentation.
