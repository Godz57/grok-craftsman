#!/usr/bin/env bash
set -euo pipefail
KIT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MODE="${1:-global}"

if [[ "$MODE" == "project" ]]; then
  BASE="$(pwd)/.grok"
  echo "Install mode: PROJECT -> $BASE"
else
  BASE="${HOME}/.grok"
  echo "Install mode: GLOBAL -> $BASE"
fi

SKILLS="$BASE/skills"
COMMANDS="$BASE/commands"
DST="$SKILLS/code-craftsman"

mkdir -p "$SKILLS" "$COMMANDS" "$DST"
cp -R "$KIT_ROOT/skills/code-craftsman/." "$DST/"
echo "  skill: code-craftsman"

FLAG="$DST/state/enabled.flag"
mkdir -p "$(dirname "$FLAG")"
if [[ ! -f "$FLAG" ]]; then
  printf 'on' >"$FLAG"
fi
echo "  flag: $(cat "$FLAG")"

for f in "$KIT_ROOT"/commands/*.md; do
  cp -f "$f" "$COMMANDS/"
  echo "  command: $(basename "$f")"
done

echo ""
echo "Done. Try: /craftsman-status | /craftsman-on | /code-craftsman"
