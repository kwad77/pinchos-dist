#!/bin/sh
# pinchOS one-line installer — the "mom path". Downloads the prebuilt single-file binary for this
# machine's OS/arch and drops it on PATH. No git, no Node, no npm, no build. Usage:
#
#   curl -fsSL https://raw.githubusercontent.com/kwad77/pinchOS/main/scripts/install.sh | sh
#
# Honest by design: if there's no published build for this OS/arch yet, it says so plainly and points
# at the from-source path — it never half-installs or pretends. Set PINCHOS_BIN_DIR to override where
# it lands (default: ~/.local/bin).
set -eu

REPO="kwad77/pinchos-dist"
# Match the asset names the release workflow publishes EXACTLY (process.platform/arch style):
# pinchos-linux-x64 · pinchos-darwin-arm64 · pinchos-win32-x64.exe (see .github/workflows/release.yml).
OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m)"
case "$ARCH" in x86_64|amd64) ARCH="x64" ;; arm64|aarch64) ARCH="arm64" ;; esac
case "$OS" in mingw*|msys*|cygwin*) OS="win32" ;; esac  # keep linux/darwin as-is (NOT macos/windows)

ASSET="pinchos-${OS}-${ARCH}"
[ "$OS" = "win32" ] && ASSET="${ASSET}.exe"
DEST="${PINCHOS_BIN_DIR:-$HOME/.local/bin}"
URL="https://github.com/${REPO}/releases/latest/download/${ASSET}"

echo "pinchOS installer — looking for a prebuilt ${ASSET}…"
mkdir -p "$DEST"
if ! curl -fSL "$URL" -o "$DEST/pinchos" 2>/dev/null; then
  echo ""
  echo "  ✗ No published build for ${ASSET} yet (so this one-liner can't install it)."
  echo "    Until prebuilt downloads are published, install from source (needs Node ≥ 22):"
  echo "      git clone https://github.com/${REPO} && cd pinchOS && npm run setup && npm run pinchos"
  echo ""
  rm -f "$DEST/pinchos"
  exit 1
fi
chmod +x "$DEST/pinchos"
echo "  ✓ installed: $DEST/pinchos"
case ":$PATH:" in
  *":$DEST:"*) echo "  run:  pinchos      → then open http://localhost:4147" ;;
  *) echo "  add $DEST to your PATH, then run:  pinchos   (or run it directly: $DEST/pinchos)" ;;
esac
