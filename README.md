<div align="center">

# pinchOS — download & run

**Trust AI to do real work — and see the receipts.**

Hand a goal to any model and *trust the result*: pinchOS runs **verified** AI loops on your folder — it
physically can't fake success, won't stop when tokens run out, shows you exactly what it did, and never
locks you to one vendor.

[![release](https://img.shields.io/badge/release-v0.4.0-2ea44f)](https://github.com/kwad77/pinchos-dist/releases/latest)
[![install](https://img.shields.io/badge/install-one%20line-5b8def)](#install-one-line)
[![would rather block than lie](https://img.shields.io/badge/would%20rather-block%20than%20lie-d6336c)](#proof-not-promises)

</div>

This repo is the **prebuilt app + one-line installer**. No git, no Node, nothing to set up. *(The source is
developed separately; this is the public download.)*

## Install (one line)

```sh
curl -fsSL https://raw.githubusercontent.com/kwad77/pinchos-dist/main/install.sh | sh
pinchos          # then open http://localhost:4147
```

Downloads the prebuilt binary for your OS/arch from the [latest release](../../releases/latest) and puts it
on your PATH — and installs [`pincher`](https://github.com/kwad77/pincher) (the grounding engine) alongside
it, so grounded loops work out of the box. With nothing else installed, chat / loops / memory / verification
all run; answers use an **honest offline fallback** until you add a model — it never fakes a result. Add a
model under **Models & agents** (one click to make a frontier model your default), point pinchOS at a
**Folder**, then ask.

## What it does (v0.4.0)

- **Ask, get a grounded answer** — like a normal LLM by default (pincher-grounded, and it uses your skills),
  with a trust verdict you can click into for the receipts.
- **Run a verified loop on your folder** — **▶ Run…** → pick which loop + how many iterations → it works,
  gate-verified each pass, and leaves a usable result you can open (`pinchos/deliverable.md`), or stashes +
  offers it to download when there's no folder. Nothing is auto-applied — you approve every change.
- **Drive its own self-improvement loop** — point it at a goal and watch it iterate, each pass trying to do
  better, with a live "🔧 self-improving · k/N".
- **Never locked in** — local-first (free) by default, or one click to make claude / codex / gemini your default.

## Proof, not promises

Honesty is the whole claim, so it's **measured, not asserted** — by instruments shipped in the source:

| The claim | The receipt |
|---|---|
| Won't ship work the gate didn't pass | **refuses** to land a tests-red change (ADR 0013); the gate is never self-relaxed. |
| Trustworthy by its own bar | **11 / 11** on its trust scorecard — capability honesty · refuse-rather-than-lie · honest failure · no silent dead-ends. |
| Its own loop goes green *honestly* | the self-improve loop authors a **verified** fix, and a 3-critic jury rejects an incomplete one — no fabricated pass. |
| Every control is exercised | **0** untested `/next` click-paths (measured affordance coverage). |
| Limits named, not hidden | every known limitation is written in the [release notes](../../releases/latest). |

## Manual download

Grab the file for your machine from the [latest release](../../releases/latest):

- **linux-arm64** — `pinchos-linux-arm64` → `chmod +x ./pinchos-linux-arm64 && ./pinchos-linux-arm64`

A build for your exact OS/arch may not be published yet — the installer says so honestly (it never
half-installs) and points you to the release page. **Open an issue to request a build for your platform.**

> **macOS:** a downloaded binary is quarantined by Gatekeeper. The installer clears it for you; for a manual
> download, run `xattr -d com.apple.quarantine ./pinchos-darwin-arm64` once, then `./pinchos-darwin-arm64`.

## What's new in v0.4.0 — the loop, drivable from the UI

Type a goal, pick a loop + iterations, watch it run, get a verified result — **all from `/next`**. Plus
frontier-as-default in one click, usable artifacts always displayed (folder or stashed), a frictionless
first-run and run journey, and crash-guards so a glitch never freezes the screen. Full notes on the
[release page](../../releases/latest).

---
<div align="center"><sub>Prebuilt distribution. Open an issue for a build for your platform.</sub></div>
