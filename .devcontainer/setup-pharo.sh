#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
workspace_dir="$(cd -- "$script_dir/.." && pwd)"
vm_dir="$HOME/.local/pharo"

mkdir -p "$vm_dir"

if [[ ! -x "$vm_dir/pharo" ]]; then
  cd "$vm_dir"
  curl --fail --location https://get.pharo.org/64/ | bash
fi

if [[ ! -f "$workspace_dir/Pharo.image" ]]; then
  printf 'Expected Pharo.image at %s\n' "$workspace_dir/Pharo.image" >&2
  exit 1
fi

printf 'Pharo VM ready at %s/pharo\n' "$vm_dir"#!/bin/bash
echo "=== Downloading Pharo 64-bit Linux VM and Image ==="
curl https://get.pharo.org/64/ | bash
#wget -qO- https://get.pharo.org/64/150 | bash

echo "=== Ensuring permissions are correct ==="
chmod +x pharo
chmod +x pharo-ui

echo "=== Pharo setup complete! ==="
