# pinchOS — download & run

**The honesty layer for AI work.** Hand real work to any model and trust the result — pinchOS physically
can't fake success, won't stop when tokens run out, shows exactly what it did, and never locks you to one
vendor.

This repo hosts the **prebuilt app + one-line installer**. No git, no Node, nothing to set up.

## Install (one line)

```sh
curl -fsSL https://raw.githubusercontent.com/kwad77/pinchos-dist/main/install.sh | sh
pinchos          # then open http://localhost:4147
```

It downloads the prebuilt binary for your OS/arch from this repo's [Releases](../../releases/latest) and
puts it on your PATH. If there's no build for your platform yet, it tells you so honestly. With nothing
else installed, the canvas, loops, memory, and verification all run; answers use an honest offline
fallback until you point pinchOS at a model — it never fakes a result.

## Manual download

Grab the file for your machine from the [latest release](../../releases/latest) and run it:
`pinchos-linux-x64` · `pinchos-darwin-arm64` (Apple Silicon) · `pinchos-win32-x64.exe`.

---
<sub>Prebuilt distribution only. The project itself is developed separately.</sub>
