#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
workspace_dir="$(cd -- "$script_dir/.." && pwd)"
vm="$HOME/.local/pharo/pharo"
image="$workspace_dir/Pharo.image"
log_file="$workspace_dir/.pharo-startup.log"

if [[ ! -x "$vm" ]]; then
  printf 'Pharo VM is missing. Run the container post-create setup first.\n' >&2
  exit 1
fi

if [[ ! -f "$image" ]]; then
  printf 'Expected Pharo.image at %s\n' "$image" >&2
  exit 1
fi

if pgrep -u "$(id -u)" -f "$image" >/dev/null; then
  exit 0
fi

nohup env DISPLAY="${DISPLAY:-:1}" "$vm" "$image" \
  >"$log_file" 2>&1 &

printf 'Started Pharo IDE from %s\n' "$image"