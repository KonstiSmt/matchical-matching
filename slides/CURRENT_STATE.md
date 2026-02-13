# Slides Current State and Open TODOs

## Current State
- Slides module is set up under `slides/` with Reveal.js + Vite.
- Multiple design variants exist:
  - `slides/decks/variant-a/`
  - `slides/decks/variant-b/`
  - `slides/decks/variant-c/`
- Font Awesome class-based icons are wired in deck code.
- Root `.gitignore` ignores `.env` files.

## What We Want Next
- Continue iterative visual refinement slide-by-slide (especially hierarchy, centering, and stronger visual composition).
- Replace placeholder content/details with final business content.
- Keep density mostly airy/balanced; split dense content into additional slides.

## Environment Setup (Top-Level `.env`)
Create/edit a root `.env` file at:
- `.env`

Add the following keys:

```env
# Font Awesome kit for slide icons (URL or kit ID)
VITE_FONT_AWESOME_KIT_URL=

# DevTools API script credentials (scripts/devtools_api.py)
MATCHICAL_DEVTOOLS_BASE_URL=https://matchical-dev.outsystems.app/ConsultingAdmin/rest/DevTools
MATCHICAL_DEVTOOLS_USERNAME=
MATCHICAL_DEVTOOLS_API_KEY=
```

Notes:
- `MATCHICAL_DEVTOOLS_BASE_URL` is optional (script has a default), but keeping it explicit is recommended.
- `.env` is gitignored.

## Quick Commands
From repo root:

```bash
# run slides locally
cd slides
pnpm dev

# build / preview
pnpm build
pnpm preview

# export a deck PDF
pnpm export:pdf -- --deck variant-a --out output/variant-a.pdf
```

DevTools API script examples (from repo root):

```bash
python3 scripts/devtools_api.py categories
python3 scripts/devtools_api.py active <category_id>
```

## Content/Brand Reminders
- Correct contact for future slide content:
  - `get@matchical.com`
  - `www.matchical.com`
