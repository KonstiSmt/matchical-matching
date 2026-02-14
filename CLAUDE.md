# Matchical Development Repository

Development artifacts for Matchical: queries, prompts, mockups, and specifications.

## Platform
OutSystems ODC with Aurora PostgreSQL.

## Entity Documentation
See @docs/entities/README.md for all entity definitions.

**NEVER assume entity attributes - always ask if unsure.**

## Directory Guide

| Directory | Purpose | Rules |
|-----------|---------|-------|
| `queries/` | SQL queries | See `queries/CLAUDE.md` for OutSystems syntax |
| `prompts/` | AI pipeline prompts | See `prompts/CLAUDE.md` for conventions |
| `mockups/` | UI mockups and specifications | |
| `docs/entities/` | Entity reference documentation | |

## When Working on Queries
Always read `queries/CLAUDE.md` first. Critical syntax rules for OutSystems ODC.

## When Working on Prompts
Always read `prompts/CLAUDE.md` first. Prompt engineering conventions.

## Voice Dictation Note
User input is often transcribed via voice dictation (mVoiceDictation), which can introduce obvious spelling artifacts (e.g., "mName" instead of "Name", or garbled attribute names). If you spot these, flag them and use the obvious correction when the intent is clear.
