#!/usr/bin/env bash
# Serve the main site, all four demos, and the exampleSite starter at once,
# each on its own port, opening a browser tab for each. Ctrl+C stops them all.
#
# Usage: scripts/serve-all.sh
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# The theme lives at the repo root, so themesDir is the parent directory
# and the theme name is the repo folder name.
THEMES_DIR="$(dirname "$REPO_ROOT")"
THEME_NAME="$(basename "$REPO_ROOT")"
LOG_DIR="${TMPDIR:-/tmp}/hugo-serve-all"
mkdir -p "$LOG_DIR"

# "<site dir relative to repo root>:<port>"
SITES=(
  "site:1313"
  "demos/kdrama-fan-club:1314"
  "demos/rocky-cove-aquarium:1315"
  "demos/lucky-town-foodie:1316"
  "demos/truly-madly-riley:1317"
  "exampleSite:1318"
)
# Fail early if any port is already taken, for example a hugo server
# you started by hand in another terminal.
for entry in "${SITES[@]}"; do
  port="${entry##*:}"
  if lsof -nP -iTCP:"$port" -sTCP:LISTEN >/dev/null 2>&1; then
    echo "Error: port $port is already in use:" >&2
    lsof -nP -iTCP:"$port" -sTCP:LISTEN >&2
    echo "Stop that server first, then re-run this script." >&2
    exit 1
  fi
done

PIDS=()
cleanup() {
  echo
  echo "Stopping all servers..."
  kill "${PIDS[@]}" 2>/dev/null || true
  wait 2>/dev/null || true
}
trap cleanup EXIT INT TERM

for entry in "${SITES[@]}"; do
  dir="${entry%%:*}"
  port="${entry##*:}"
  name="$(basename "$dir")"
  echo "Starting $name on http://localhost:$port  (log: $LOG_DIR/$name.log)"
  (
    cd "$REPO_ROOT/$dir" &&
    exec hugo server \
      --port "$port" \
      --themesDir "$THEMES_DIR" \
      --theme "$THEME_NAME"
  ) >"$LOG_DIR/$name.log" 2>&1 &
  PIDS+=($!)
done

# Wait for each server to answer before opening its tab, so the browser
# never lands on a connection error.
for entry in "${SITES[@]}"; do
  port="${entry##*:}"
  for _ in $(seq 1 60); do
    if curl -s -o /dev/null "http://localhost:$port"; then
      break
    fi
    sleep 0.5
  done
  if command -v open >/dev/null; then open "http://localhost:$port"
  elif command -v xdg-open >/dev/null; then xdg-open "http://localhost:$port"
  else echo "  → http://localhost:$port"; fi
done

echo
echo "All six sites are running. Press Ctrl+C to stop them all."
wait