<div align="center">

# pinchOS — download & run

**The honesty layer for AI work.**

Hand real work to any model and *trust the result* — pinchOS physically can't fake success, won't stop
when tokens run out, shows you exactly what it did, and never locks you to one vendor.

[![release](https://img.shields.io/badge/release-v0.2.0-2ea44f)](https://github.com/kwad77/pinchos-dist/releases/latest)
[![install](https://img.shields.io/badge/install-one%20line-5b8def)](#install-one-line)
[![won't lie](https://img.shields.io/badge/would%20rather-block%20than%20lie-d6336c)](#proof-not-promises)

</div>

This repo is the **prebuilt app + one-line installer**. No git, no Node, nothing to set up. *(The source
is a separate, private project; this is the public download.)*

## Install (one line)

```sh
curl -fsSL https://raw.githubusercontent.com/kwad77/pinchos-dist/main/install.sh | sh
pinchos          # then open http://localhost:4147
```

Downloads the prebuilt binary for your OS/arch from the [latest release](../../releases/latest) and puts
it on your PATH — and installs [`pincher`](https://github.com/kwad77/pincher) (the grounding engine)
alongside it, so grounded loop phases work out of the box. With nothing else installed, the chat, loops,
memory, and verification all run; answers use an **honest offline fallback** until you point pinchOS at a
model — it never fakes a result. Add a model + grounding later from **Workshop**.

## Proof, not promises

pinchOS's whole claim is honesty, so it's **measured, not asserted** — by instruments shipped in the source:

| The claim | The receipt |
|---|---|
| It won't ship work the gate didn't pass | v0.2.0 **refuses** to land a tests-red change; the prior stable silently shipped it. |
| It's more trustworthy than what came before | **11 / 11** on its own trust scorecard — vs the prior stable's **4 / 11**. |
| It does more, in fewer clicks | A 15-journey bake-off: **15 / 15** vs the prior stable's **9 / 15**, fewer clicks, zero regressions. |
| Its limits are named, not hidden | Every v0.2.0 known limitation is written down in the [release notes](../../releases/latest). |

## Manual download

Grab the file for your machine from the [latest release](../../releases/latest) and run it:
`pinchos-linux-x64` · `pinchos-darwin-arm64` (Apple Silicon) · `pinchos-win32-x64.exe`.

> **macOS:** a downloaded binary is quarantined by Gatekeeper. The installer clears it for you; for a
> manual download run `xattr -d com.apple.quarantine ./pinchos-darwin-arm64` once, then `./pinchos-darwin-arm64`.

## What's new in v0.2.0

First **stable** release (beta → stable). `/next` is the front door; the engine refuses to land tests-red
work, scores 11/11 on its own trust scorecard, and ships its known limitations in the open. Full notes on
the [release page](../../releases/latest).

---
<div align="center">
<sub>Prebuilt distribution only. The project itself is developed separately.</sub>
</div>
