<div align="center">

# pinchOS — download & run

**The honesty layer for AI work, packaged as a single app.**

Hand real work to any model and *trust the result*: pinchOS grounds the work in your files, runs checked
loops, shows the receipts, and refuses to pretend when something is missing.

[![release](https://img.shields.io/badge/release-v0.14.0-2ea44f)](https://github.com/kwad77/pinchos-dist/releases/latest)
[![install](https://img.shields.io/badge/install-one%20line-5b8def)](#install-one-line)
[![would rather block than lie](https://img.shields.io/badge/would%20rather-block%20than%20lie-d6336c)](#proof-not-promises)

</div>

This repo is the public distribution channel: prebuilt binaries, checksums, and the one-line installer.
The source lives in [`kwad77/pinchOS`](https://github.com/kwad77/pinchOS).

## Install One Line

```sh
curl -fsSL https://raw.githubusercontent.com/kwad77/pinchos-dist/main/install.sh | sh
pinchos          # then open http://localhost:4147
```

The installer downloads the latest stable binary for your OS/arch and puts it on your PATH. On macOS and
Linux it also installs [`pincher`](https://github.com/kwad77/pincher), the grounding engine, next to
pinchOS. If a build is unavailable, it says so plainly and points to the source install path.

Published assets:

| Platform | Asset |
|---|---|
| Linux x64 | `pinchos-linux-x64` |
| Linux arm64 | `pinchos-linux-arm64` |
| macOS Apple Silicon | `pinchos-darwin-arm64` |
| Windows x64 | `pinchos-win32-x64.exe` |

Manual download: open the [latest release](../../releases/latest), download the matching asset, make it
executable if needed, and run it.

## What You Get In v0.14

v0.14 is the refined Workroom release. The app opens on `/next`, the conversation-first Job home, and every
major capability has a direct journey:

- **My work** shows active and past work without pretending an unavailable board is empty.
- **Models** is the workshop for answer order, local models, Claude/Codex/Gemini apps, named helpers, and
  specialist presets.
- **Skills** is the workshop for reusable know-how: add, import, adopt, distill, and remove skills.
- **Pick a folder** and **Browse files** keep file work scoped to the project you chose.
- **Try another way** compares two approaches and shows the winner with evidence.
- **Connected tools** owns tool servers, schedules, and local power-ups.
- **Receipts & savings** shows what happened, what it cost, and what was actually saved.
- **Readiness** tells you what is available now and what is missing before a feature can work.
- **ALPO capture** uses an explicit screenshot utility, user-customizable shortcuts, and durable evidence
  artifacts for tickets and remediation.

The key v0.14 improvement is honesty in the small paths: failed roster reads, missing metrics, unavailable
history, and disconnected stores are shown as retryable unavailable states, not as "nothing here yet."

## Proof, Not Promises

pinchOS is built around one product rule: it would rather block than lie.

| Claim | Receipt |
|---|---|
| It cannot fake a verified result | The gate only admits work after real checks and evidence. Failed checks stay failed. |
| It avoids false empty states | v0.14 browser coverage exercises retryable unavailable states across Workroom doors. |
| Every visible control has a path | `/next` affordance coverage reports zero untested interactive click paths. |
| The Workroom is walked end to end | The journey walker opens every destination and reports `breaks: 0` before release. |
| The installer is honest | Missing platform assets fail with a clear source-install path instead of half-installing. |

## Start With Nothing

No account or cloud key is required to open the app. With no model connected, pinchOS starts honestly and
tells you what is missing. Add a model later from **Models**, add reusable guidance from **Skills**, and pick
a project folder when you want grounded file work.

Optional power-ups:

- `pincher` for code grounding and cited project context.
- Claude, Codex, Gemini, Ollama, LM Studio, vLLM, or another OpenAI-compatible model backend.
- `git` and GitHub CLI for the final mile: commit and PR creation through your own credentials.

## Update

Run the installer again to replace the binary with the latest stable release:

```sh
curl -fsSL https://raw.githubusercontent.com/kwad77/pinchos-dist/main/install.sh | sh
```

Inside the app, Readiness and Settings expose update/recovery paths when a newer dist release is available.

## Limitations

- The binary is unsigned/not notarized. The installer clears macOS quarantine for the downloaded app; manual
  macOS downloads may need `xattr -d com.apple.quarantine ./pinchos-darwin-arm64`.
- A model is optional at startup but required for real AI answers.
- Grounded code work is strongest with `pincher` installed and a project folder selected.
- The app refuses more often than a chatbot. That is intentional: unknown, unavailable, or unverified states
  are shown as such.

---

<div align="center"><sub>Prebuilt distribution for macOS · Windows · Linux x64/arm64.</sub></div>
