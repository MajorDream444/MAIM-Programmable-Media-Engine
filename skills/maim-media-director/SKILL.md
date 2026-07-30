---
name: maim-media-director
description: Direct human-led MAIM films and programmable media productions using the canonical MAIM design system, deterministic Remotion assembly, selective generative B-roll, reusable media components, and formal visual/audio/provenance QA.
---

# MAIM Media Director

## Purpose

Turn approved human performance, stories, lessons, archives, and brand doctrine into deterministic, reusable MAIM media productions.

## Required Reading

Before production, read:

1. `design-system/MAIM_DESIGN_SYSTEM.md`
2. the production brief under `productions/<production>/docs/`
3. applicable library component documentation
4. third-party license and attribution records

## Production Priorities

1. Preserve human truth and performance.
2. Clarify the story before adding motion.
3. Use MAIM typography and brand marks deterministically.
4. Use generative footage selectively, never as the assembly engine.
5. Build reusable components when a treatment can serve future MAIM productions.
6. Inspect still frames, safe areas, transitions, captions, audio, and provenance before release.

## Tool Roles

- Remotion: typography, captions, timing, diagrams, transitions, compositing, final assembly
- FFmpeg: inspection, normalization, extraction, encoding, and technical QA
- Claude Design: design-system exploration and component specifications
- Higgsfield or other generation tools: isolated B-roll only
- GitHub: canonical code, skills, manifests, schemas, and reusable library
- Notion: brief, decisions, approvals, and human-readable production record
- Airtable: asset, shot, task, rights, and release tracking
- Google Drive: source masters, large media, reviews, and delivery packages

## Workflow

### Stage 1 — Ingest
- preserve source master
- checksum and identify every file
- create asset manifest
- extract technical metadata
- create transcript and word timing when applicable

### Stage 2 — Story Map
- identify promise, emotional progression, doctrine, proof, and call to action
- divide the timeline into narrative beats
- define what must remain human-led

### Stage 3 — Design Translation
- map the production to MAIM visual tokens
- define typography hierarchy
- select marks and safe areas
- define motion families and prohibited treatments

### Stage 4 — Shot Architecture
For every shot document:
- narrative function
- source asset
- duration and frame range
- composition
- typography
- motion grammar
- transition
- audio cue
- crop behavior
- QA criteria

### Stage 5 — Build
- implement deterministic Remotion compositions
- isolate reusable components in `library/`
- keep production-specific compositions in `productions/`
- pin all external dependencies

### Stage 6 — Audio
- analyze musical timing
- place key edits and transitions intentionally
- use sound effects sparingly
- maintain an audio cue sheet

### Stage 7 — QA
Required outputs:
- full review render
- no-music render
- clean-text or no-overlay render where applicable
- per-shot stills
- contact sheet
- safe-area overlays
- caption collision check
- audio loudness/peak report
- asset provenance manifest
- third-party notices

### Stage 8 — Release and Learn
- create platform derivatives
- record approval and version
- store final master and delivery package in Drive
- update Airtable registry
- commit reusable improvements to GitHub
- record decisions and lessons in Notion

## MAIM Welcome Film Constraint

Do not expand the full 4:34 welcome film until the deterministic approximately 30-second proof passes brand, visual, editorial, audio, safe-area, and licensing review.
