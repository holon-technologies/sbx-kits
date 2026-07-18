# Holon Docker Sandbox Kits

Public, versioned [Docker Sandbox](https://docs.docker.com/ai/sandboxes/)
kits maintained by Holon Technologies.

Each top-level kit directory is independently loadable. Public releases are
tagged for Git consumption and mirrored to GitHub Container Registry.

## Available kits

| Kit | Purpose |
| --- | --- |
| [`holon-local-first`](holon-local-first/) | Rust, Dioxus, SQLite, Iroh, and Docker Compose development for the Holon local-first stack. |

## Use a released kit

Allow the Holon GitHub organization as a kit publisher once:

```sh
sbx settings set kit.allowedSources \
  '["docker.io/","github.com/holon-technologies/","ghcr.io/holon-technologies/"]'
```

Load the Git release into a new sandbox:

```sh
sbx run \
  --kit "git+https://github.com/holon-technologies/sbx-kits.git#ref=v0.1.0&dir=holon-local-first" \
  codex .
```

Pin a release tag or commit in normal use. Tracking `main` makes sandbox creation
dependent on unpublished changes.

## Develop locally

Requirements:

- Docker Sandboxes CLI (`sbx`) 0.35.0 or newer.
- `jq` for repository validation.
- Docker Desktop with Docker Sandboxes enabled for the smoke test.

```sh
./scripts/validate.sh
./scripts/smoke-test.sh holon-local-first
```

The smoke test creates an isolated temporary sandbox, verifies the installed
toolchain, and removes the sandbox and temporary workspace on exit.

## Versioning and releases

This repository uses repository-wide Semantic Versioning while its kits evolve
together. Kits remain on `0.x` releases while Docker's kit format is experimental.

Every release must:

1. Update [`CHANGELOG.md`](CHANGELOG.md).
2. Pass validation and the real-sandbox smoke test.
3. Use an annotated, immutable `vX.Y.Z` tag.
4. Publish each changed kit as a versioned OCI artifact without moving a `latest` tag.

## Security

Kit install commands can run as root. All capability, network, credential, and
install-command changes require review. Kits must not contain secret values. See
[`SECURITY.md`](SECURITY.md) for reporting instructions.

Licensed under the Apache License 2.0.
