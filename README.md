# pinchOS stable downloads

This repository is the stable binary channel for
[pinchOS](https://github.com/kwad77/pinchOS), a local-first work system that
routes AI work through explicit phases and only calls an outcome verified when
the relevant gates have actually passed.

The current stable line is **v0.41.0**.

## Install

Linux and macOS:

```bash
curl -fsSL https://raw.githubusercontent.com/kwad77/pinchos-dist/main/install.sh | sh
```

Open a new terminal and run:

```bash
pinchos
```

Then open [http://localhost:4147](http://localhost:4147). `/chat` is the front
door and `/stage` is the detailed Workroom.

The installer:

1. detects the operating system and CPU architecture;
2. downloads the matching binary from the latest stable release;
3. installs it to `~/.local/bin` by default;
4. adds that directory to the shell path when needed; and
5. installs [Pincher](https://github.com/kwad77/pincher) alongside pinchOS on
   Linux and macOS when a compatible Pincher release is available.

Set `PINCHOS_BIN_DIR` to choose a different install directory. Set
`PINCHOS_SKIP_PINCHER=1` to install pinchOS without the grounding engine.

## Manual downloads

Every stable release publishes four native, standalone binaries:

| Platform | Release asset |
|---|---|
| Linux x64 | `pinchos-linux-x64` |
| Linux ARM64 | `pinchos-linux-arm64` |
| macOS Apple Silicon | `pinchos-darwin-arm64` |
| Windows x64 | `pinchos-win32-x64.exe` |

Download them from
[the latest stable release](https://github.com/kwad77/pinchos-dist/releases/latest).
The binaries include Node and do not require a separate Node.js installation.

macOS Intel and Windows ARM64 do not currently have native binaries. Install
from source on those systems.

## Verify a download

Each stable release includes `SHA256SUMS`, generated after the four source
release assets have been downloaded and byte-size checked.

Linux:

```bash
sha256sum --check SHA256SUMS
```

macOS:

```bash
shasum -a 256 pinchos-darwin-arm64
```

Compare the printed digest with the matching line in `SHA256SUMS`.

The macOS binary is ad-hoc signed, not Apple-notarized. The installer removes
the quarantine attribute from the exact file it downloads. Manual installers
may need to do that explicitly:

```bash
xattr -d com.apple.quarantine ./pinchos-darwin-arm64
chmod +x ./pinchos-darwin-arm64
```

## What v0.41.0 delivers

The browser product is organized around two surfaces:

- **Chat** captures the ask, working folder, loop choice, per-phase model
  choices, budget, and run mode before execution.
- **Workroom** keeps current work, live attempts, receipts, previews,
  revisions, comparisons, approvals, models, loops, and settings in one
  operational view.

This release adds:

- earned plans grounded in precedent research and explicit dependency probes;
- frozen outcome contracts and candidate selection before ambitious builds;
- coherent Apply, server-owned runtime checks, and integration verification;
- immutable Current and Candidate artifact versions;
- inline revision discussion, side-by-side comparison, accept, discard, and
  retry flows;
- concurrent job visibility and job termination from the work rail;
- subscription-aware model inventories and per-phase routing; and
- delivery manifests and evidence-backed learning receipts.

The full feature tour, architecture, model configuration, verification
receipts, and known limitations live in the
[source README](https://github.com/kwad77/pinchOS/blob/v0.41.0/README.md).

## Models

pinchOS can use:

- local OpenAI-compatible endpoints such as Ollama, LM Studio, and vLLM;
- authenticated subscription CLIs such as Codex and Claude; and
- explicitly configured model commands.

The app probes what is actually available and offers those choices in Chat and
Settings. It does not silently treat an unavailable provider as connected.

A model is required for model-authored work. The application still starts
without one and reports the missing capability honestly.

## Stable and beta channels

The one-line installer uses this repository's latest stable release.

To request the newest source-repository prerelease:

```bash
curl -fsSL https://raw.githubusercontent.com/kwad77/pinchos-dist/main/install.sh | sh -s -- --beta
```

Prereleases are never promoted to this repository's `latest` stable channel.

## Release integrity

The release path is deliberately split:

1. `kwad77/pinchOS` tags a version-matched source commit.
2. its `Release binaries` workflow builds each operating-system target on a
   native GitHub runner;
3. all four jobs must succeed before the source release is published;
4. this repository's `Promote stable release` workflow downloads the exact
   source assets and verifies their advertised sizes;
5. it generates and verifies `SHA256SUMS`; and
6. only then does it publish the assets here and move `releases/latest`.

`Verify stable channel` independently checks the installer contract, required
asset set, minimum sizes, and checksums after promotion.

## From source

Source installation requires Node.js 22 or newer:

```bash
git clone https://github.com/kwad77/pinchOS.git
cd pinchOS
npm run setup
npm run pinchos
```

Use the source repository for development, issues, and pull requests:

- [source](https://github.com/kwad77/pinchOS)
- [issues](https://github.com/kwad77/pinchOS/issues)
- [v0.41.0 release](https://github.com/kwad77/pinchOS/releases/tag/v0.41.0)

## License

Copyright (c) 2026 the pinchOS authors. All rights reserved.

The software is proprietary. The source repository's
[LICENSE](https://github.com/kwad77/pinchOS/blob/v0.41.0/LICENSE) and
[NOTICE](https://github.com/kwad77/pinchOS/blob/v0.41.0/NOTICE) govern use and
distribution.
