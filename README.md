<div align="center">

# pinchOS — download & run

**Trust AI to do real work — and see the receipts.**

Hand a goal to any model and *trust the result*: pinchOS runs **verified** AI loops on your folder — it
physically can't fake success, won't stop when tokens run out, shows you exactly what it did, and never
locks you to one vendor.

[![release](https://img.shields.io/badge/release-v0.11.0-2ea44f)](https://github.com/kwad77/pinchos-dist/releases/latest)
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

## What it does (v0.11.0)

- **Ask, get a grounded answer** — like a normal LLM by default (pincher-grounded on **your** folder, and it
  uses your skills), with a trust verdict you can click into for the receipts. It only says "grounded" when
  it actually is — no folder, no false badge (and an *unverified* answer never wears a ✓).
- **Build a change, end to end** — ask "add a subtract(a,b) function to calc.js" and it routes to the build
  loop, grounds on your folder, runs, surfaces the verified change, and one click lands it on disk. If a build
  ask comes back as a code snippet, a one-click **▶ Build & apply** turns it into a real verified change.
- **Attach a file to chat** — drag, paste (⌘/Ctrl+V a screenshot), or 📎 an image or text/code file straight
  into the message; images go to a vision model, text/code grounds the answer.
- **Update in one click** — when a new version ships, an **Update now** button pulls + verifies + installs it
  in place (the previous version is kept as a backup); no terminal, no copy-paste.
- **Run a verified loop on your folder** — **▶ Run…** → pick which loop + how many iterations → it works,
  gate-verified each pass, and leaves a usable result you can open (`pinchos/deliverable.md`), or stashes +
  offers it to download when there's no folder. Nothing is auto-applied — you approve every change.
- **Build a jury from your subscription's models** — mint Sonnet · Haiku · Codex as named agents in one
  click, then compose them into a per-phase jury that independently reviews the work (it can only make the
  gate *stricter*, never weaker).
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

Grab the file for your machine from the [latest release](../../releases/latest), `chmod +x`, and run it:

- **macOS** (Apple Silicon) — `pinchos-darwin-arm64`
- **Windows** (x64) — `pinchos-win32-x64.exe`
- **Linux** — `pinchos-linux-x64` · `pinchos-linux-arm64`

(If a build for your exact OS/arch isn't published, the installer says so honestly — it never half-installs — and points you to the release page.)

> **macOS:** a downloaded binary is quarantined by Gatekeeper. The installer clears it for you; for a manual
> download, run `xattr -d com.apple.quarantine ./pinchos-darwin-arm64` once, then `./pinchos-darwin-arm64`.

## What's new in v0.11.0 — control it from your phone (Slack + theme restore + the loop lands UI work)

**Control pinchOS from Slack.** DM or @mention a thin bot and every message becomes a turn on your running
pinchOS — the answer comes back in-thread. All the intelligence stays in pinchOS: grounding, the self-improve
loop, verification, memory, and *every command* (`/improve <goal>`, `/loop`, `/target`) work through it, so you
can **start and steer the loop from your phone**. No public URL or tunnel (it connects out over a websocket).
The **full theme palette is back** — 8 colorways, and your choice now persists server-side across devices. And
the **self-improve loop can land UI work unattended**: it no longer flakes on its own browser suite (the heavy
gate is CI-only locally, recorded honestly so it never flips a verified result) — a fix the loop **authored
itself**. Full notes on the [release page](../../releases/latest).

---
<div align="center"><sub>Prebuilt distribution for macOS · Windows · Linux (x64/arm64).</sub></div>
