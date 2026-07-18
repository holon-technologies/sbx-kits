#!/usr/bin/env bash
set -euo pipefail

repository_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
found_kit=false

command -v sbx >/dev/null || {
  echo "sbx is required" >&2
  exit 1
}
command -v jq >/dev/null || {
  echo "jq is required" >&2
  exit 1
}

for spec in "$repository_root"/*/spec.yaml; do
  [[ -f "$spec" ]] || continue
  found_kit=true
  kit_directory=$(dirname "$spec")

  sbx kit validate "$kit_directory"
  sbx kit inspect "$kit_directory" --json | jq -e '
    .manifest.schemaVersion == "1" and
    (.manifest.kind == "mixin" or .manifest.kind == "sandbox") and
    (.manifest.name | test("^[a-z0-9][a-z0-9-]*$"))
  ' >/dev/null
done

[[ "$found_kit" == true ]] || {
  echo "no kit specs found" >&2
  exit 1
}

git -C "$repository_root" diff --check
echo "All kits are valid."
