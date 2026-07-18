# Karteros Kit

A Docker Sandbox mixin for applications based on Karteros, Holon Technologies'
resilient local-first application stack.

## Included toolchain

| Component | Version |
| --- | --- |
| Rust | 1.97.1 |
| cargo-binstall | 1.21.0 |
| Dioxus CLI | 0.7.9 |
| cargo-nextest | 0.9.140 |
| cargo-llvm-cov | 0.8.7 |

The kit also installs Clippy, rustfmt, the `wasm32-unknown-unknown` target,
SQLite tooling, native build dependencies, Linux Dioxus Desktop dependencies,
and network access for Rust packages, GitHub releases, Iroh relays, and Docker
Hub image pulls.

No credentials or private configuration are included.

## Use

```sh
sbx run \
  --kit "git+https://github.com/holon-technologies/sbx-kits.git#ref=v0.2.0&dir=karteros" \
  codex /path/to/application
```

The sandbox supports shared core, coordinator, web, Compose, and Linux desktop
development. Android requires an Android SDK/NDK. iOS requires macOS and Xcode.

## Validate locally

From the repository root:

```sh
./scripts/validate.sh
./scripts/smoke-test.sh karteros
```

Docker's kit format is experimental. Revalidate after upgrading `sbx`.
