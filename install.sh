#!/bin/bash
# Installs or updates Lagoon from the latest release:
#   curl -fsSL https://raw.githubusercontent.com/jpclopes99/Lagoon/main/install.sh | bash
set -euo pipefail

REPO="jpclopes99/Lagoon"
APP="/Applications/Lagoon.app"

[ "$(uname)" = "Darwin" ] || { echo "Lagoon only runs on macOS."; exit 1; }
major=$(sw_vers -productVersion | cut -d. -f1)
[ "$major" -ge 14 ] || { echo "Lagoon needs macOS 14 Sonoma or later (this Mac has $(sw_vers -productVersion))."; exit 1; }

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

echo "→ Downloading the latest Lagoon…"
curl -fL --progress-bar -o "$tmp/Lagoon.zip" "https://github.com/$REPO/releases/latest/download/Lagoon.zip"
ditto -x -k "$tmp/Lagoon.zip" "$tmp"
[ -d "$tmp/Lagoon.app" ] || { echo "The download is not a valid Lagoon app."; exit 1; }

# Downloaded with curl, not a browser: no "unverified developer" warning on first launch.
xattr -dr com.apple.quarantine "$tmp/Lagoon.app" 2>/dev/null || true

if pgrep -x Lagoon >/dev/null; then
  echo "→ Closing the running Lagoon…"
  osascript -e 'quit app "Lagoon"' >/dev/null 2>&1 || true
  sleep 1
  pkill -x Lagoon 2>/dev/null || true
fi

echo "→ Installing in /Applications…"
if [ -w /Applications ] && { [ ! -e "$APP" ] || [ -w "$APP" ]; }; then
  rm -rf "$APP"
  ditto "$tmp/Lagoon.app" "$APP"
else
  sudo rm -rf "$APP"
  sudo ditto "$tmp/Lagoon.app" "$APP"
fi

version=$(defaults read "$APP/Contents/Info" CFBundleShortVersionString 2>/dev/null || echo "")
open "$APP"
echo "✓ Lagoon $version installed. It lives in the menu bar; macOS asks for permissions as you use each feature."
echo "  To update later, run the same command again."
