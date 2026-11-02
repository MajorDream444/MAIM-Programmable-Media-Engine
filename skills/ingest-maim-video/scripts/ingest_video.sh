#!/usr/bin/env bash
set -euo pipefail

project=""
source_file=""
herk_root="${HOME}/Documents/MAIM-Tools/herk-edit-kit"
replace=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project) project="${2:-}"; shift 2 ;;
    --source) source_file="${2:-}"; shift 2 ;;
    --herk-root) herk_root="${2:-}"; shift 2 ;;
    --replace) replace=1; shift ;;
    *) printf 'Unknown argument: %s\n' "$1" >&2; exit 2 ;;
  esac
done

[[ "$project" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]] || {
  printf 'Project must be a lowercase hyphenated slug.\n' >&2
  exit 2
}
[[ -d "$herk_root" ]] || { printf 'Herk root not found: %s\n' "$herk_root" >&2; exit 3; }
command -v ffprobe >/dev/null || { printf 'ffprobe is not installed.\n' >&2; exit 3; }

if [[ -z "$source_file" ]]; then
  candidates=()
  while IFS= read -r item; do candidates+=("$item"); done < <(
    find "$HOME/Downloads" -maxdepth 1 -type f \( -iname '*.mp4' -o -iname '*.mov' -o -iname '*.m4v' \) -print
  )
  [[ ${#candidates[@]} -eq 1 ]] || {
    printf 'Expected exactly one video in Downloads; found %s. Supply --source.\n' "${#candidates[@]}" >&2
    exit 4
  }
  source_file="${candidates[0]}"
fi

[[ -f "$source_file" ]] || { printf 'Local source file not found: %s\n' "$source_file" >&2; exit 4; }
ffprobe -v error -show_entries format=duration -of default=nw=1:nk=1 "$source_file" >/dev/null || {
  printf 'Source is not locally readable media: %s\n' "$source_file" >&2
  exit 5
}

project_dir="$herk_root/video-projects/$project"
if [[ ! -d "$project_dir" ]]; then
  (cd "$herk_root" && npm run new-video -- "$project")
fi

assets_dir="$project_dir/assets"
destination="$assets_dir/raw.mp4"
mkdir -p "$assets_dir"
if [[ -e "$destination" && $replace -ne 1 ]]; then
  printf 'Destination already exists: %s\nUse --replace only after preserving it and receiving approval.\n' "$destination" >&2
  exit 6
fi

temporary="$assets_dir/.raw.mp4.ingest"
trap 'rm -f "$temporary"' EXIT
cp -p "$source_file" "$temporary"
ffprobe -v error "$temporary" >/dev/null
mv -f "$temporary" "$destination"
trap - EXIT

duration="$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$destination")"
video="$(ffprobe -v error -select_streams v:0 -show_entries stream=codec_name,width,height -of csv=p=0 "$destination")"
audio="$(ffprobe -v error -select_streams a:0 -show_entries stream=codec_name -of csv=p=0 "$destination" || true)"
size="$(du -h "$destination" | awk '{print $1}')"

printf 'STATUS: READY_FOR_TRANSCRIPTION\n'
printf 'PROJECT_SLUG: %s\n' "$project"
printf 'HERK_PROJECT: %s\n' "$project_dir"
printf 'RAW_VIDEO: %s\n' "$destination"
printf 'SOURCE_PRESERVED: yes\n'
printf 'FFPROBE_VERIFIED: yes\n'
printf 'SIZE: %s\nDURATION_SECONDS: %s\nVIDEO: %s\nAUDIO: %s\n' "$size" "$duration" "$video" "${audio:-none}"
