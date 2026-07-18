# Changelog

All notable changes to this repository are documented here.

## [0.2.0] - 2026-07-18

### Changed

- Renamed the canonical kit and directory from `holon-local-first` to `karteros`.
- Renamed the display name to Karteros while retaining resilient and local-first
  as its architectural descriptors.
- Changed the OCI artifact path to `ghcr.io/holon-technologies/sbx-kit-karteros`.

The immutable `v0.1.1` tag retains the previous `holon-local-first` identifier
and directory for existing consumers.

## [0.1.1] - 2026-07-18

### Fixed

- Made the public, pinned Git source the documented distribution path.
- Kept the GHCR mirror authenticated until an organization package admin makes
  its visibility public through GitHub Package settings.

## [0.1.0] - 2026-07-18

### Added

- Initial `holon-local-first` mixin kit.
- Pinned Rust, Dioxus, cargo-nextest, and cargo-llvm-cov toolchain.
- Repository validation, real-sandbox smoke testing, and OCI release workflow.
