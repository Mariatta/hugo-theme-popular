#!/usr/bin/env bash
# build-sites.sh: build the project site plus every demo into one tree, the way
# the published site is laid out (project site at the root, demos at subpaths).
#
#   scripts/build-sites.sh <base-url> <output-dir>
#   scripts/build-sites.sh "https://popular.mariatta.ca" public
#
# Used by .github/workflows/deploy-demo.yml (GitHub Pages, production) and by
# the Netlify preview build (see AGENTS.md, "Settings that live outside this
# repo"). One script so a preview cannot quietly differ from production: the
# demo bar's links only resolve when every demo is present at its subpath, so a
# preview that builds the docs site alone 404s the moment you click a demo.
#
# Not part of the theme. Adopters who copy this repo never run it.
set -euo pipefail

BASE="${1:?usage: build-sites.sh <base-url> <output-dir>}"
OUT="${2:?usage: build-sites.sh <base-url> <output-dir>}"

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
THEME="$(basename "$ROOT")"
# absolute, so the caller's working directory does not matter
case "$OUT" in /*) ;; *) OUT="$PWD/$OUT" ;; esac

# The /changelog/ page is generated from the canonical CHANGELOG.md so it can
# never go stale. Shortcode delimiters are escaped so a changelog entry that
# mentions `{{< faq >}}` renders it literally instead of executing it.
{
  printf '+++\ntitle = "Changelog"\ntype = "docs"\neyebrow = "Docs"\nlead = "Every notable change to the Popular theme, newest first."\nweight = 70\n+++\n\n'
  grep -v '^# Changelog$' "$ROOT/CHANGELOG.md" \
    | sed -e 's|{{<|{{</* |g' -e 's|>}}| */>}}|g' -e 's|{{%|{{%/* |g' -e 's|%}}| */%}}|g'
} > "$ROOT/site/content/changelog.md"

build () {  # build <source-dir> <dest-subpath ("" for the root)>
  hugo --source "$ROOT/$1" \
       --themesDir "$(dirname "$ROOT")" \
       --theme "$THEME" \
       --baseURL "$BASE/$2" \
       --destination "$OUT/$2" \
       --minify
}

build site ""
build demos/rocky-cove-aquarium aquarium/
build demos/lucky-town-foodie foodie/
build demos/kdrama-fan-club kdrama/
build demos/truly-madly-riley superfan/

echo "built the project site + 4 demos into $OUT (baseURL $BASE)"
