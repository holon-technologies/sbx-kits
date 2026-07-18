#!/usr/bin/env bash
set -euo pipefail

repository_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
kit_name=${1:-holon-local-first}
kit_directory="$repository_root/$kit_name"
sandbox_name="holon-kit-smoke-$(date +%s)"
workspace=$(mktemp -d)

cleanup() {
  sbx rm -f "$sandbox_name" >/dev/null 2>&1 || true
  rmdir "$workspace" >/dev/null 2>&1 || true
}
trap cleanup EXIT

[[ -f "$kit_directory/spec.yaml" ]] || {
  echo "kit not found: $kit_directory" >&2
  exit 1
}

sbx create --name "$sandbox_name" --kit "$kit_directory" shell "$workspace"
sbx exec "$sandbox_name" bash -lc '
  set -euo pipefail
  rustc --version
  cargo clippy --version
  cargo fmt --version
  command -v cargo-binstall
  cargo-binstall --help >/dev/null
  dx --version
  cargo nextest --version
  cargo llvm-cov --version
  sqlite3 --version
  docker compose version
  rustup target list --installed | grep -Fx wasm32-unknown-unknown
  pkg-config --exists webkit2gtk-4.1
'

echo "Smoke test passed for $kit_name."
