# Matchical Style Guide

> Based on provided UI boards/screens and existing product UI references.

## 1) Scope And Status

- This document is the style-guide baseline for product UI mockups and related artifacts in this repository.
- Two visual modes are used:
- Marketing UI (website and public-facing pages)
- Product UI (application shell, data-heavy workflows, admin/operations surfaces)
- The live website UI is inspiration for tone and messaging, not strict visual source-of-truth for product UI.
- This draft intentionally avoids any knowledge-base update.

## 2) Brand Principles

- Data first: prioritize clarity, structure, and fast scanability.
- Functional confidence: visual language should feel precise, operational, and trustworthy.
- Controlled energy: use orange accents for focus and action, not for full-surface decoration.
- Consistency over novelty: reusable layout and token decisions should win over one-off styling.

## 3) Color System

Token names below are recommended for implementation in design/dev handoff.
Values are taken from the provided style board and confirmed as used in the app.

### Verified In-App References

- Active tab/header color uses `--color-secondary-main` (`#002839`).
- Secondary text (e.g., subtitle-like text) uses `#305063`.

### Primary

- `--color-primary-main: #FF5F00`
- `--color-primary-dark: #C42800`
- `--color-primary-light: #FF903E`
- `--color-primary-contrast: #FFFFFF`

### Secondary

- `--color-secondary-main: #002839`
- `--color-secondary-light: #305063`
- `--color-secondary-dark: #000014`
- `--color-secondary-contrast: #FFFFFF`

### Text

- `--color-text-primary: #000839`
- `--color-text-secondary: #305063`
- `--color-text-disabled: #E9F2F6`

### Background

- `--color-bg-paper: #FFFFFF`
- `--color-bg-default: #F8F8F8`

### Semantic

| Category | Main | Dark | Light | Contrast |
|---|---|---|---|---|
| Error | `#D32F2F` | `#C62828` | `#EF5350` | `#FFFFFF` |
| Warning | `#FFF738` | `#C8C400` | `#FFFF71` | `#000014` |
| Success | `#2E7D32` | `#1B5E20` | `#4CAF50` | `#FFFFFF` |
| Info | `#0288D1` | `#015798` | `#03A9F4` | `#FFFFFF` |

## 4) Typography

### Font Families

- Heading scale (`H1`-`H6`): `Steradian`
- Subtitle/body and smaller text: `Commissioner`

### Responsive Heading Scale

| Element | Desktop (base 24) | Mobile (base 16) |
|---|---|---|
| `h1` | `92px` | `61px` |
| `h2` | `70px` | `47px` |
| `h3` | `54px` | `36px` |
| `h4` | `41px` | `27px` |
| `h5` | `31px` | `21px` |
| `h6` | `24px` | `16px` |

Scale basis: `1.309` (rounded values).

### Fixed Text Sizes

- `subtitle1: 16px`
- `subtitle2: 14px`
- `body1: 16px`
- `body2: 14px`
- `button: 16px`
- `caption: 12px`
- `overline: 10px`

## 5) Spacing Scale

Use the provided spacing system as layout source-of-truth:

- `4, 8, 16, 24, 32, 48, 56, 64, 72, 96, 144`

Recommended token naming:

- `--space-1: 4px`
- `--space-2: 8px`
- `--space-3: 16px`
- `--space-4: 24px`
- `--space-5: 32px`
- `--space-6: 48px`
- `--space-7: 56px`
- `--space-8: 64px`
- `--space-9: 72px`
- `--space-10: 96px`
- `--space-11: 144px`

## 6) Product UI Patterns (From Provided Screens)

### Shell And Navigation

- Left rail uses dark secondary tones and persistent icon+label navigation.
- Main canvas uses light neutral surfaces with high content density.
- Keep action controls near context (inline in cards, top-right for global actions).

### Cards And Surfaces

- Cards are high-usage primitives: soft radius, subtle borders, flat design (no shadows).
- Prefer grouped cards over large uninterrupted tables when scanning and comparing entities.

### Selection And State

- Orange is the active state for tabs, selected cards, progress, and key labels.
- Availability/status should primarily use semantic colors, not custom one-off shades.

### Data Visualization Primitives

- Use compact indicators such as segmented bars (proficiency/strength), circular scores (matching/price), and chips/tags (role/skill metadata).

### Form And Export Screens

- Keep control panel on the left and preview on the right for configuration-heavy workflows.
- Use segmented controls and sliders with explicit values for quick tuning.

## 7) Website-Derived Content Guidance

Website messaging can be used to enrich style-guide content blocks and product messaging:

- Core value proposition: reduce inefficiency, improve transparency, speed up staffing workflows.
- Feature pillars to reuse consistently: Client requests, Consultants, Matching, Insights.
- CTA language pattern: "Schedule your demo" (primary), "Learn more about matchical" (secondary).
- Tone pattern: clear and benefit-led, operationally concrete, bilingual consistency (`en`/`de`) by intent.

## 8) Content Blocks To Append Where Relevant

For mockups, product one-pagers, and marketing support docs:

- "Problem" block: manual data handling, low transparency, slow matching.
- "Outcome" block: faster response times, reduced admin effort, better staffing decisions.
- "How it works" block: Demo -> Onboarding -> PoC -> Roll out.
- "Trust" block: GDPR compliance, security-by-design, German company context.

## 9) Current Boundaries

- Do not introduce undocumented design tokens or component rules.
- No shadow/elevation system is defined; keep flat design.
- Border radius, stroke scales, and motion rules are currently unspecified and must remain unspecified until provided.
