#!/bin/sh
# pinchOS one-line installer — the "mom path". Downloads the prebuilt single-file binary for this
# machine's OS/arch and drops it on PATH, AND installs pincher (the grounding engine) alongside it so
# grounded loop phases work out of the box. No git, no Node, no npm, no build. Usage:
#
#   curl -fsSL https://raw.githubusercontent.com/kwad77/pinchos-dist/main/install.sh | sh
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

# BETA channel: `--beta` (or PINCHOS_BETA=1) installs the latest PRERELEASE from the pinchOS repo (where beta
# tags + their binaries live). Stable stays on pinchos-dist/releases/latest. The releases API returns newest-
# first; the first tag_name with a hyphen (vX.Y.Z-beta.N / -rc) is the latest prerelease.
BETA=""
for a in "$@"; do [ "$a" = "--beta" ] && BETA=1; done
[ "${PINCHOS_BETA:-}" = "1" ] && BETA=1
if [ -n "$BETA" ]; then
  # all tag_names (newest-first), then the FIRST containing a hyphen = the latest prerelease. sed (not grep)
  # for the pick so it's portable across grep flavors.
  BTAG="$(curl -fsSL "https://api.github.com/repos/kwad77/pinchOS/releases" 2>/dev/null | sed -n 's/.*"tag_name": *"\([^"]*\)".*/\1/p' | sed -n '/-/{p;q;}' || true)"
  if [ -n "$BTAG" ]; then
    URL="https://github.com/kwad77/pinchOS/releases/download/${BTAG}/${ASSET}"
    echo "pinchOS installer — BETA channel (${BTAG})"
  else
    echo "  ⚠ no prerelease found (API rate-limited?) — falling back to the stable channel."
  fi
fi

echo "pinchOS installer — looking for a prebuilt ${ASSET}…"
mkdir -p "$DEST"
if ! curl -fSL "$URL" -o "$DEST/pinchos" 2>/dev/null; then
  echo ""
  echo "  ✗ No published build for ${ASSET} yet (so this one-liner can't install it)."
  echo "    Built platforms: linux-x64 · darwin-arm64 (Apple Silicon) · win32-x64."
  echo "    Browse the latest release, or open an issue to request ${ASSET}:"
  echo "      https://github.com/${REPO}/releases/latest"
  echo ""
  rm -f "$DEST/pinchos"
  exit 1
fi
chmod +x "$DEST/pinchos"
# macOS: a downloaded binary carries a quarantine xattr → Gatekeeper blocks it ("could not verify… free
# of malware"). You just chose to run this installer, so clear the quarantine on THIS file (you trust it)
# — the binary is ad-hoc signed so it runs. (Best-effort; full notarization is a separate step.)
[ "$OS" = "darwin" ] && xattr -d com.apple.quarantine "$DEST/pinchos" 2>/dev/null || true
echo "  ✓ installed: $DEST/pinchos"

# pincher — the code-intelligence GROUNDING engine pinchOS uses to ground a working folder. It's what
# lets grounded loop phases (e.g. Gather Context) cite real evidence; without it those phases can't
# ground and block. So install it WITH pinchOS — the happy path works out of the box. Best-effort: if it
# can't be installed, pinchOS still runs (ungrounded) and you can add pincher later from Workshop →
# Power-ups. Opt out with PINCHOS_SKIP_PINCHER=1. Skipped on Windows (pincher ships a .zip there).
if [ "${PINCHOS_SKIP_PINCHER:-}" != "1" ] && [ "$OS" != "win32" ]; then
  echo "pinchOS installer — also setting up pincher (the grounding engine)…"
  PARCH="$ARCH"; [ "$ARCH" = "x64" ] && PARCH="amd64"   # pincher uses amd64/arm64; pinchOS uses x64/arm64
  if PTAG="$(curl -fsSL https://api.github.com/repos/kwad77/pincher/releases/latest | sed -n 's/.*"tag_name": *"\([^"]*\)".*/\1/p' | head -1)" && [ -n "$PTAG" ]; then
    PASSET="pincher-${PTAG}-${OS}-${PARCH}"   # tarball holds ONE binary named for the asset, not "pincher"
    if curl -fsSL "https://github.com/kwad77/pincher/releases/download/${PTAG}/${PASSET}.tar.gz" | tar xz -C "$DEST" 2>/dev/null && [ -f "$DEST/${PASSET}" ]; then
      mv -f "$DEST/${PASSET}" "$DEST/pincher"
      chmod +x "$DEST/pincher"
      [ "$OS" = "darwin" ] && xattr -d com.apple.quarantine "$DEST/pincher" 2>/dev/null || true
      echo "  ✓ installed: $DEST/pincher ($PTAG) — grounding enabled"
    else
      echo "  ⚠ couldn't download pincher (${PASSET}) — pinchOS still runs ungrounded; add it later from Workshop → Power-ups."
    fi
  else
    echo "  ⚠ couldn't resolve the latest pincher release (GitHub API rate-limited?) — pinchOS still runs ungrounded; add it later from Workshop → Power-ups."
  fi
fi
# PATH — write it for the user (the "mom path" doesn't end at a manual PATH edit). Both pinchos AND pincher
# live in $DEST, so one entry covers both. Idempotent: only append if $DEST isn't already on PATH and the line
# isn't already in the rc. Persist into the interactive shell's rc; ~/.profile is the POSIX fallback.
case ":$PATH:" in
  *":$DEST:"*)
    echo "  run:  pinchos      → then open http://localhost:4147"
    ;;
  *)
    case "${SHELL:-}" in
      *zsh)  rc="$HOME/.zshrc" ;;
      *bash) rc="$HOME/.bashrc" ;;
      *)     rc="$HOME/.profile" ;;
    esac
    line="export PATH=\"$DEST:\$PATH\""
    if ! grep -qsF "$DEST" "$rc" 2>/dev/null; then
      printf '\n# added by the pinchOS installer (pinchos + pincher live here)\n%s\n' "$line" >> "$rc" 2>/dev/null \
        && echo "  ✓ added $DEST to your PATH in $rc" \
        || echo "  ⚠ couldn't write $rc — add this line yourself:  $line"
    else
      echo "  ✓ $DEST already configured in $rc"
    fi
    # curl|sh runs in a SUBSHELL — it cannot change THIS shell's PATH (only new shells read the rc). So lead
    # with a copy-pasteable command that works in the current terminal right now.
    echo ""
    echo "  ▶ run it now (paste this):   source $rc && pinchos       → http://localhost:4147"
    echo "    (any new terminal just needs:  pinchos)"
    ;;
esac
