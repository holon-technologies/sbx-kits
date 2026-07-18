# Contributing

Keep each kit in a lowercase, hyphenated top-level directory containing a
`spec.yaml` and a kit-specific `README.md`.

Before opening a pull request:

1. Pin downloaded tools and scripts to reviewed versions.
2. Declare only the network domains required by install and runtime behavior.
3. Keep credentials host-managed; never commit secret values.
4. Update documentation and `CHANGELOG.md` for user-visible changes.
5. Run `./scripts/validate.sh` and `./scripts/smoke-test.sh <kit>`.

Changes to root install commands, capabilities, credentials, or network policy
require CODEOWNER review.
