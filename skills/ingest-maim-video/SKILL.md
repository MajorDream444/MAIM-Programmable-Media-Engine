---
name: ingest-maim-video
description: Prepare a newly recorded MAIM or MAIM Academy video for local production with Herk Edit Kit. Use when a recording has been uploaded to Drive and downloaded to the Mac, or when the user asks to create a video project, locate a raw MP4/MOV in Downloads, place it in the project assets folder, normalize it to raw.mp4, verify media streams with ffprobe, or hand the verified project to Yawdie or another local editing agent.
---

# Ingest MAIM Video

Prepare footage only. Do not cut, transcribe, render, publish, delete the original, or modify Drive.

## Required inputs

Obtain a short lowercase project slug and the downloaded recording path. Omit the path only when exactly one plausible video exists in Downloads. Default the Herk root to `$HOME/Documents/MAIM-Tools/herk-edit-kit` only when it exists.

Never guess between multiple recordings. Ask the user to select one.

## Workflow

1. Confirm the source is a regular local file, not only an iCloud placeholder.
2. Confirm `ffprobe` and the Herk root exist.
3. Run `scripts/ingest_video.sh` with quoted arguments. The script creates a missing project through Herk's `new-video` command.
4. Report the project path, preserved source, working filename, size, duration, video codec, resolution, audio codec, and verification result.
5. Stop at `READY_FOR_TRANSCRIPTION`. Require a new instruction before editorial work.

```bash
bash scripts/ingest_video.sh \
  --project "model-is-the-software" \
  --source "$HOME/Downloads/The Model Is the Software—And That Changes Everything.mp4" \
  --herk-root "$HOME/Documents/MAIM-Tools/herk-edit-kit"
```

If `raw.mp4` already exists, do not overwrite it. Compare the proposed source and destination or ask for confirmation. Use `--replace` only with explicit authorization and after preserving the prior file.

## Handoff contract

Return:

```text
STATUS: READY_FOR_TRANSCRIPTION
PROJECT_SLUG: <slug>
HERK_PROJECT: <absolute project directory>
RAW_VIDEO: <absolute path>/assets/raw.mp4
SOURCE_PRESERVED: yes
FFPROBE_VERIFIED: yes
```

If verification fails, return `STATUS: BLOCKED_INGEST` with the exact failed check and one corrective action. Never claim readiness from Finder visibility alone.
