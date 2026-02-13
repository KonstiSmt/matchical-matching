# Matchical Slides (Phase 1)

Code-based, live-first presentation workflow using Reveal.js + Vite + plain HTML/CSS/JS.

## What this module provides
- Live browser decks for presentation and iteration.
- Shared theme tokens and reusable styling foundation.
- Canonical brand assets in `slides/assets/brand/`.
- Local PDF export through Playwright.

## Bootstrap (local machine)
From the repository root:

```bash
brew install node
npm install -g corepack
corepack enable
corepack prepare pnpm@latest --activate
cd slides
pnpm install
pnpm exec playwright install chromium
```

## Commands
Run from `slides/`:

```bash
pnpm dev
pnpm build
pnpm preview
pnpm export:pdf -- --deck variant-a --out output/variant-a.pdf
```

## Font Awesome (Kit) Setup
Font Awesome Free is bundled locally as a default fallback.
Adding a kit URL lets you use your own/pro icon set with the same HTML class syntax.

1. Edit the repository-global env file:
```bash
cat ../.env
```
If it does not exist yet, create it from:
```bash
cp ../.env.example ../.env
```
2. Set your kit credential in `.env`:
```bash
VITE_FONT_AWESOME_KIT_URL=https://kit.fontawesome.com/<your-kit-id>.js
```
You can also set only the kit id:
```bash
VITE_FONT_AWESOME_KIT_URL=<your-kit-id>
```
3. Restart `pnpm dev` from `slides/`.

### Usage in slides
Use icon classes directly in HTML:
```html
<span class="icon-badge accent" aria-hidden="true">
  <i class="fa-solid fa-bolt"></i>
</span>
```

## Open In Browser
1. Start dev server:
```bash
cd slides
pnpm dev
```
2. Open:
- Deck list: `http://127.0.0.1:5173/`
- Variant A: `http://127.0.0.1:5173/decks/variant-a/`
- Variant B: `http://127.0.0.1:5173/decks/variant-b/`
- Variant C: `http://127.0.0.1:5173/decks/variant-c/`
- Legacy demo: `http://127.0.0.1:5173/decks/demo/`
- Speaker view (while deck is open): press `s`

## Current Design Variants (for review)
- Variant A: Brand-led contrast with icon-assisted cards.
  - Dark emotional anchors (cover/closing), left-aligned center staging.
  - Process lane + central savings hub + ticket-style PoC offer.
  - Strongest visual energy of the three.
- Variant B: Editorial minimal with centered narrative flow.
  - Mostly centered content blocks with large type and clean whitespace.
  - Vertical numbered process and center-focused offer board.
  - Best for concise, executive storytelling.
- Variant C: Modular system view with balanced density.
  - Dark emotional anchors + triad and flow modules with icon badges.
  - Matrix-like automation and offer slides with clear hierarchy.
  - Best for product-mechanics storytelling.

## Deck paths
- Deck source: `slides/decks/<deck-id>/index.html`
- Variant A: `slides/decks/variant-a/index.html`
- Variant B: `slides/decks/variant-b/index.html`
- Variant C: `slides/decks/variant-c/index.html`
- Legacy demo: `slides/decks/demo/index.html`
- Shared runtime: `slides/src/shared/reveal-init.js`
- Theme variants: `slides/src/theme/variants/`

## Authoring conventions (v1)
- Use pure HTML/CSS/JS.
- Keep slide design minimalistic and content-forward.
- Prefer shared theme tokens and utility classes over inline styling.
- Live deck quality is primary; PDF is secondary export.

## Dependency model
JS dependencies are local to this module (`slides/node_modules`).
This is different from Python virtual environments (`.venv`).
