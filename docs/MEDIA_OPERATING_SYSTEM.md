# Media Production Operating System

One recording may create many assets, but every derivative needs a declared audience, channel, purpose, owner, and approval state.

## Storage contract

Google Drive stores large binaries under `<BRAND>/<YEAR>/<production-slug>/` with `01_raw`, `02_audio`, `03_transcripts`, `04_project-files`, `05_review-renders`, `06_masters`, `07_shorts`, `08_thumbnails`, `09_substack`, and `10_delivery-and-qa`.

GitHub stores manifests, transcript text, chapters, clip decisions, metadata, edit decisions, briefs, QA, provenance, publishing records, and Drive links. Never commit raw video or final renders except tiny intentional test fixtures.

## Required packet

- `manifest.yaml`: identity, ownership, destinations, lifecycle, storage pointers.
- `transcript.md`: corrected transcript or authoritative link.
- `chapters.md`: YouTube chapters and narrative beats.
- `clips.md`: hook, in/out points, payoff, platform, caption treatment.
- `metadata.md`: titles, descriptions, tags, hashtags, pinned comment, CTA.
- `substack.md`: article angles, newsletter treatment, embed/excerpt plan.
- `qa.md`: technical and founder review evidence.

## Destination decisions

| Output | Required decisions |
|---|---|
| YouTube | channel, playlist, title, description, thumbnail, chapters, captions, tags, pinned comment |
| Short/Reel | hook, duration, crop, safe area, captions, title/caption, CTA, related full video |
| Substack | publication, lane, article/newsletter angle, embedded video, excerpt, CTA |
| Academy | lesson, module, assignment, worksheet, prerequisites |
| Archive | rights, provenance, master location, retention |

## Lifecycle

`recorded -> downloaded -> ingested -> transcribed -> editorial_review -> approved_to_edit -> editing -> qa -> awaiting_review -> approved_to_publish -> published -> measured -> archived`

Only the founder or authorized owner moves an asset to `approved_to_publish`.

Use lowercase hyphenated slugs. Local working footage is `assets/raw.mp4`. Derivatives use `<slug>--<platform>--<asset-type>--<sequence>--v<version>.<ext>`.
