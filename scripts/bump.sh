#!/usr/bin/env bash
# Point the showpoint cask at a published release.
#   ./scripts/bump.sh 0.2.0
# Downloads that release's DMG, computes its sha256, and rewrites the cask.
set -euo pipefail

VERSION="${1:?usage: bump.sh <version, e.g. 0.2.0>}"
REPO="oleksii-stepanenko/showpoint"
URL="https://github.com/${REPO}/releases/download/v${VERSION}/Showpoint.dmg"
CASK="$(cd "$(dirname "$0")/.." && pwd)/Casks/showpoint.rb"

echo "Fetching ${URL}"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
curl -fsSL -o "$TMP/Showpoint.dmg" "$URL"
SHA="$(shasum -a 256 "$TMP/Showpoint.dmg" | awk '{print $1}')"
echo "sha256 = ${SHA}"

sed -i '' -E "s/^  version \".*\"/  version \"${VERSION}\"/" "$CASK"
sed -i '' -E "s/^  sha256 \".*\"/  sha256 \"${SHA}\"/" "$CASK"

echo "Updated cask to ${VERSION}. Review the diff, then commit & push:"
echo "  git commit -am \"showpoint ${VERSION}\" && git push"
