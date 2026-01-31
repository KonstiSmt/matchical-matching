# Flexible AI Description Generation System

> Feature specification for on-demand AI-optimized description generation in CV exports

**Status:** Concept / Mockup Phase
**Last Updated:** 2026-01-31
**Mockup:** [description-format-selector.html](../description-format-selector.html)

---

## Management Summary

### The Problem

The current system maintains multiple static text versions (bullet, paragraph, original) for engagement and project descriptions. As requirements grow (different lengths, tones, formats per CV template), maintaining 5-6+ static versions per description becomes unsustainable and creates data maintenance burden for users.

### The Solution

1. **Reduce static versions to 4 canonical formats** in the database (Bullet, Paragraph, Mixed, Raw)
2. **Generate AI-optimized versions on-demand** at CV export time with configurable parameters
3. **Template-specific recommended settings** with user override capability

### Key Benefits

- Reduced data maintenance burden (4 versions instead of potentially 6+)
- Flexible output without pre-generating all combinations
- Template-aware defaults ensure optimal output per CV design
- User control over AI generation parameters when needed

---

## Table of Contents

1. [Data Architecture](#data-architecture)
2. [CV Export Format Selection](#cv-export-format-selection)
3. [AI Generation Settings](#ai-generation-settings)
4. [User Experience Decisions](#user-experience-decisions)
5. [Technical Considerations](#technical-considerations)
6. [UI Pattern Options](#ui-pattern-options)
7. [Open Questions](#open-questions)

---

## Data Architecture

### The Four Canonical Versions

Instead of maintaining many static versions, we reduce to exactly four formats that serve distinct purposes:

| Version | Purpose | Source | Used in CV Export |
|---------|---------|--------|-------------------|
| **Bullet** | Clean bullet-point list for scanning | User-maintained or AI-generated | Yes (static option) |
| **Paragraph** | Flowing prose text for narrative | User-maintained or AI-generated | Yes (static option) |
| **Mixed** | Combination of prose + bullets | User-maintained or AI-generated | Yes (static option) |
| **Raw Dump** | Unformatted source material | CV parsing output, user-editable | No (AI source only) |

### Raw Dump: The Source of Truth

The Raw Dump serves as a **data reservoir** for AI generation:

- Contains all available information about the engagement/project
- Can include unstructured notes, achievements, metrics, context
- Is populated initially from CV parsing
- Users can add additional context that wouldn't fit in polished versions
- **Never exported directly** - only used as input for AI generation

### Why This Architecture?

**Previous approach:** Pre-generate multiple AI versions (short bullet, long bullet, short paragraph, etc.)
- Problem: Combinatorial explosion of versions to maintain
- Problem: Versions get out of sync when user edits one

**New approach:** Maintain canonical versions + generate on-demand
- User maintains up to 4 versions (or lets AI populate 3 from Raw)
- AI generates export-specific versions from Raw Dump at export time
- No stale pre-generated versions

### AI Generation Source

**Decision:** AI optimization always pulls from the **Raw Dump** as primary source.

**Rationale:** Using already-polished versions (Bullet, Paragraph) as AI input creates "salt on salt" - the AI optimizes content that was already AI-optimized, potentially losing information or amplifying stylistic choices. The Raw Dump contains the most complete, unfiltered information.

---

## CV Export Format Selection

### User Flow

In the CV Export wizard, users select how descriptions should appear:

1. **Static Option:** Use one of the three maintained formats (Bullet, Paragraph, Mixed) as-is
2. **AI Optimized Option:** Generate a new version with configurable settings

### Static vs. AI Optimized

| Aspect | Static | AI Optimized |
|--------|--------|--------------|
| Source | Pulls from user-maintained version | Generates from Raw Dump |
| Customization | None (what you see is what you get) | Length, tone, format, perspective, focus |
| Template fit | May not fit template constraints | Can be tuned to template requirements |
| Consistency | Identical every export | May vary slightly between generations |

### When to Use Each

**Use Static when:**
- User has carefully crafted the description
- Exact wording matters (legal, compliance)
- Consistency across exports is critical

**Use AI Optimized when:**
- Template has specific length constraints
- Tailoring to a specific client/demand
- User wants to highlight certain aspects

---

## AI Generation Settings

### The Settings Levers

When AI Optimized is selected, users can configure these parameters:

#### 1. Length

**Type:** Slider with 5 tick marks
**Options:** Minimal → Short → Medium → Long → Extended
**Mapping:**
| Setting | Approximate Word Count |
|---------|----------------------|
| Minimal | ~20-30 words |
| Short | ~50-80 words |
| Medium | ~100-150 words |
| Long | ~200-300 words |
| Extended | ~400-500 words |

**Implementation Note:** The slider is continuous (0-100) but maps to word count ranges. This allows the "Recommended" indicator to be placed at any position (e.g., 40% = between Short and Medium).

**Prompting Strategy:** Convert slider position to target word count before sending to LLM. Do not ask the LLM to hit exact counts - provide a range (e.g., "approximately 100-150 words").

#### 2. Tone

**Type:** Segmented selector (3 options)
**Options:**
| Tone | Description |
|------|-------------|
| **Conservative** | Factual, understated, lets achievements speak for themselves |
| **Balanced** | Professional confidence without overselling |
| **Bold** | Emphasizes impact, uses stronger language, more "salesy" |

#### 3. Output Format

**Type:** Segmented selector (3 options)
**Options:** Bullet / Paragraph / Mixed

Determines the structural format of the AI-generated output, independent of what format the source data is in.

#### 4. Perspective

**Type:** Dropdown
**Options:**
| Perspective | Example |
|-------------|---------|
| **1st Person** | "I developed backend systems..." |
| **3rd Person** | "The consultant developed backend systems..." |
| **Impersonal** | "Development of backend systems..." (passive/task-focused) |

**Decision:** Impersonal is typically the recommended default for German market CVs.

#### 5. Focus

**Type:** Dropdown
**Options:**
| Focus | Emphasis |
|-------|----------|
| **Task-focused** | What was done, responsibilities |
| **Outcome-focused** | Results, achievements, impact |
| **Technology-focused** | Tools, frameworks, technical depth |

**Decision:** Keep to 3 simple options to avoid complexity. More specific focusing can be done via Additional Instructions.

#### 6. Additional Instructions

**Type:** Collapsible text area
**Purpose:** Free-text field for custom AI instructions

**Examples:**
- "Emphasize leadership experience"
- "Focus on cloud technologies"
- "Highlight cost savings achieved"
- "Use terminology from the job posting"

**UI Decision:** Collapsed by default with "Optional" hint. Expands with smooth animation when clicked.

---

## User Experience Decisions

### Recommended Settings

Each CV template can define recommended values for all settings. These are displayed as:

- **Orange dot** on selectors/sliders indicating the recommended option
- **Tick mark below slider** for length showing recommended position
- **Legend** at bottom explaining the indicator

**Rationale:** Different templates have different space constraints and style expectations. A template with a small description area should recommend "Short" length, while a detailed template might recommend "Long."

### User Actions

| Action | Behavior |
|--------|----------|
| **Apply** | Uses current settings for this generation only |
| **Save & Apply** | Saves settings as user's personal default for this template, then applies |
| **Restore Recommended** | Resets all settings to template's recommended values |

**Note:** Users cannot modify template defaults - only their personal overrides. Template defaults are set by administrators.

### Settings Persistence

- **Template defaults:** Set by admin, shown as "Recommended"
- **User defaults:** Saved per-user per-template, override template defaults
- **Session settings:** Current selections before Apply, not persisted

### Auto-Open Behavior

**Decision:** When user selects "AI Optimized", the settings panel **auto-opens** immediately.

**Rationale:** Makes settings discoverable. Users unfamiliar with the feature immediately see what options are available. The gear icon remains for re-opening if the panel is closed.

---

## Technical Considerations

### Length Determinism

**Challenge:** AI output length is inherently variable. How do we ensure consistent lengths?

**Approach:**
1. Map UI slider position (0-100) to target word count
2. Include word count target in prompt as a range (e.g., "between 80 and 120 words")
3. Accept variance of ~20% from target
4. Do NOT ask AI to count words precisely (causes overthinking)

**Template Configuration:** Templates store their recommended slider position AND the corresponding word count range. This allows different templates to have different "Short" meanings if needed.

### Prompt Architecture

**Decision:** Use a single generic prompt template with parameter injection.

```
System: You are an expert CV writer...

Parameters:
- Target length: {wordCount} words (±20%)
- Tone: {tone}
- Output format: {format}
- Perspective: {perspective}
- Focus: {focus}
- Additional instructions: {customInstructions}

Source material:
{rawDumpContent}

Generate a description following the parameters above.
```

**Benefits:**
- Single prompt to maintain
- Clear parameter contracts
- Easy to extend with new parameters

### Caching Considerations

**Question:** Should AI-generated outputs be cached?

**Current thinking:** No persistent caching. Each "Apply" generates fresh output. Reasons:
- Source data (Raw Dump) may have changed
- User expects "fresh" generation
- Storage overhead for all user/template/setting combinations

**Future consideration:** Session-level caching to avoid re-generation if user toggles back to same settings within same export session.

---

## UI Pattern Options

Three patterns were explored for the format selector UI:

### Pattern A: Segmented Control

```
[ Bullet | Paragraph | Mixed | AI Optimized ⚙️ ]
```

**Characteristics:**
- All options visible at once
- AI Optimized is visually equivalent to static options
- Settings panel appears below when AI selected
- Slider-based length control

**Best for:** Users who frequently switch between options

### Pattern B: Two-Level Selection

```
Source: [ Static | AI Optimized ⚙️ ]  [ Bullet ▼ ]
```

**Characteristics:**
- Clear separation between static and AI modes
- Static format dropdown only enabled when Static selected
- Horizontal grid layout for AI settings
- Discrete selectors instead of sliders

**Best for:** Emphasizing the static vs. AI choice as primary decision

### Pattern C: Radio Cards

```
○ Use static version    [ Bullet ▼ ]
● Generate with AI      [settings below]
```

**Characteristics:**
- Radio selection makes mutual exclusivity clear
- Larger touch targets
- Compact card layout for settings
- Recommended indicators use asterisks in dropdowns

**Best for:** Mobile-friendly interfaces, clearer visual hierarchy

### Live Preview

All patterns include a **live preview panel** that updates in real-time when:
- Length slider/selector changes
- Output Format changes

**Purpose:** Gives users immediate feedback on how settings affect output before committing.

---

## Open Questions

### For Design Phase

1. **Slider vs. Discrete for Length?**
   - Pattern A uses continuous slider
   - Patterns B/C use discrete buttons
   - Slider allows more precision but harder to tap exact values

2. **Settings Panel Position**
   - Currently below selector
   - Alternative: Side panel / drawer
   - Alternative: Modal overlay

3. **Mobile Responsiveness**
   - Current mockup optimized for desktop
   - Need to define mobile layout (likely stacked)

### For Implementation Phase

1. **Word Count Calibration**
   - Need to test actual AI outputs against targets
   - May need to adjust ranges based on real-world results

2. **Template Default Configuration**
   - How do admins set template defaults?
   - UI for template settings management

3. **Error Handling**
   - What if AI generation fails?
   - Timeout handling for long generations

4. **Localization**
   - Setting labels need translation
   - Tone/Focus options may need cultural adaptation

### For Future Iterations

1. **AI-Assisted Sync**
   - When user edits Raw Dump, offer to regenerate other versions
   - "Your Bullet version may be out of date. Regenerate?"

2. **Generation History**
   - Allow users to see/restore previous AI generations
   - Compare different settings results

3. **Batch Generation**
   - Generate AI versions for multiple engagements at once
   - Useful for full CV refresh

---

## Related Files

| File | Description |
|------|-------------|
| [description-format-selector.html](../description-format-selector.html) | Interactive UI mockup |
| [flexible-ai-description-generation.md](./flexible-ai-description-generation.md) | This document |

---

## Revision History

| Date | Changes |
|------|---------|
| 2026-01-31 | Initial specification created from concept discussion |
