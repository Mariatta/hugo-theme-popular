# AGENTS.md: working in hugo-theme-popular

Instructions for AI agents (and new contributors) working in this repository.

## What this repo is

**Popular** is a community/meetup theme that ships as two parallel implementations:
this repo (Hugo) and the sibling repo `astro-theme-popular` (Astro). Both implement the
same design, content model, and demos. A written contract (`PARITY.md`) plus
`scripts/sync-shared.sh --check` keep them from drifting. If the sibling repo is
checked out next to this one, many changes here must be mirrored there (see
"Parity rules" below).

## Repo layout

| Path | What it is |
|---|---|
| `layouts/`, `assets/`, `archetypes/`, `theme.toml` | The theme itself |
| `site/` | The canonical docs/project site (popular's own website) |
| `exampleSite/` | Neutral starter site adopters copy ("Your Community") |
| `demos/rocky-cove-aquarium/`, `demos/lucky-town-foodie/`, `demos/kdrama-fan-club/`, `demos/truly-madly-riley/` | Four complete fictional Hugo demo sites (three communities + one personal site) |
| `scripts/sync-shared.sh` | Parity checker/syncer against astro-theme-popular |
| `PARITY.md` | The Hugo-Astro parity contract (file mappings, content model) |

Any `public/` directory is generated build output. Never hand-edit it; it may
also contain stale orphans from older builds.

## How to build and serve

Run all commands from the repo root. The `--themesDir` trick lets the sites use
the theme from this same repo:

```bash
# Canonical docs site
hugo server --source site --themesDir ../.. --theme hugo-theme-popular

# Neutral starter
hugo server --source exampleSite --themesDir ../.. --theme hugo-theme-popular

# A demo (note the extra ../)
hugo server --source demos/rocky-cove-aquarium --themesDir ../../.. --theme hugo-theme-popular
```

Use `hugo` instead of `hugo server` for a one-off build. After changing theme
templates or content, build all four sites to make sure nothing broke.

To bulk-populate events and speakers from a Sessionize event, run
`python3 scripts/sessionize-import.py --url <sessionize view/All endpoint> --site <site dir>`
(or `scripts/spreadsheet-import.py --xlsx <workbook>` for spreadsheet-based
planning; both share the same conventions) instead of writing the files by hand; it maps sessions/speakers onto the
theme's content model and never overwrites existing files.

## Parity rules (important)

- `assets/css/**` and `assets/js/**` must stay **byte-identical** with
  `astro-theme-popular/src/styles/**` and `astro-theme-popular/public/scripts/**`.
  After editing any of these, copy the file to the sibling repo and run
  `bash scripts/sync-shared.sh --check` (image drift is known and tolerated).
- New shared JS files must be registered in three places: the bundle in
  `layouts/_default/baseof.html`, a `<script>` tag in astro-theme-popular's
  `src/layouts/BaseLayout.astro`, and the file table in both `PARITY.md`s.
- Template changes (layouts/partials/shortcodes) usually need an equivalent
  change in the mapped Astro component; the mapping table is in `PARITY.md`.
- The content model (front matter fields) is part of the contract; if you add a
  field, update both `PARITY.md`s and astro-theme-popular's `src/content.config.ts`.

## Adding content

Front matter is TOML (`+++`). Key content types (full schema in `PARITY.md`):

- **Blog post** (`content/blog/*.md`): `title`, `date`, `authors = ["slug"]`
  (matching `content/authors/<slug>.md`), `description`, `image`, `tags`.
- **Event** (`content/events/*.md`): `title`, `date`, `image`, plus venue fields.
- **Organizer** (`content/organizers/*.md`): `title`, `weight`, `role`, `photo`,
  `description`, `[[social]]` entries (`label`, `icon`, `url`).

Body images: use theme-relative paths like `images/post-1.png` (no leading
slash). A render hook (`layouts/_default/_markup/render-image.html`) passes them
through `relURL` so they work when demos deploy under subpaths. Put an italic
line right after an image for a caption.

Shortcodes: `button` (standalone: `url`, `label`, `variant`, `icon`), `callout`,
`checklist`, `persona`, `badge`. The docs site additionally has `fw`/`fwswitch`
(framework switcher) and `example` (live rendered preview below a code sample;
use it for every renderable component snippet) in `site/layouts/shortcodes/`.

## Configuration knobs

- Menus: standard `[[menu.main]]`; one level of nesting is supported via
  `parent = "<parent name>"` and renders as a dropdown.
- Branding: `[params.brand]` in a site's `hugo.toml`; `brand-vars.html` emits an
  `html:root` override block. Design tokens live in `assets/css/tokens/`.
- Footer: `[params.footer]` with `tagline`, optional `[params.footer.credit]`
  (`label`, `url`), and `[[params.footer.columns]]`.
- TOML ordering gotcha: keys like `tagline` must come **before** any sub-table
  header like `[params.footer.credit]`, or they get captured by the sub-table.

## Naming conventions

- Front-matter keys, config params, and template variables must be descriptive
  words, never single letters or cryptic abbreviations. A reader should
  understand a key without opening the template that consumes it. Example: the
  home page `[[stats]]` entries use `value` and `label` (renamed from the old
  `n` and `l`; do not reintroduce short forms like these).
- The same applies to i18n keys, CSS custom properties, and JS `data-*` hooks:
  name for meaning, and keep the names identical across both repos since the
  key names are part of the parity contract.

## Known gotchas

- Sites using the events section must set `buildFuture = true` in `hugo.toml`
  (exampleSite and all demos do). Hugo falls back to `date` as the publish
  date, so upcoming events (future `date`) are otherwise silently dropped
  from the build and the "Upcoming events" list renders empty.
- Never use `{{% fw %}}` (or any shortcode that emits a block `<div>`) inline
  inside a sentence, list item, or table cell. Browsers re-parse the misnested
  HTML and the stray `</div>` closes the docs layout's content column, pushing
  the rest of the page into the sidebar. Always use such shortcodes as
  standalone blocks separated by blank lines.
- Go template comments (`{{/* ... */}}`) must not contain a literal `*/`
  anywhere inside, including in usage examples.
- A shortcode template that references `.Inner` becomes paired: every call must
  then be closed or self-closed. Keep standalone shortcodes free of `.Inner`.
- The brand override must keep the `html:root` selector (higher specificity
  than the token files' `:root`) so it wins regardless of stylesheet order.

## Internationalization (UI strings)

- Never hardcode user-facing text in templates. Add a key to `i18n/en.toml`
  and use `{{ i18n "key" }}`; add the same key to `STRINGS` in astro-theme-popular's
  `config.ts` (the key sets must match, see PARITY.md).
- Dates: use `{{ .Date | time.Format "..." }}` (localized), never `.Date.Format`;
  prefer the predefined `:date_full` / `:date_medium` layouts for whole dates
  (natural word order per language). Localization keys off the site's
  `defaultContentLanguage`, not `languageCode`.
- Shared JS must stay language-free; pass text via `data-*` attributes on
  `<body>` (see `data-copy-label` / `data-checklist-done`).
- Site owners translate by creating `i18n/<lang>.toml` in their site root and
  setting `defaultContentLanguage` in `hugo.toml` (top level, above any
  `[section]`). Don't add `languageCode`: it's unused by the theme and emits a
  deprecation warning on Hugo ≥ 0.158.

## CI checks

- `.github/workflows/image-alt.yml` builds every site and fails if any `<img>`
  lacks a non-empty `alt` attribute, or any markdown image is written as
  `![](...)`. Always give images meaningful alt text (image captions go in an
  italic line after the image, not in `alt`).
- `.github/workflows/parity-reminder.yml` watches contract-covered files.
- `.github/workflows/helper-tests.yml` runs the Python helper-script tests
  (`python3 -m unittest discover -s scripts/tests`); run them after touching
  anything in `scripts/`.

## Writing style for content and docs

- No em dashes anywhere; use a comma or a colon instead.
- Demo copy must identify the framework: "a Hugo demo site", never just
  "a demo site". (The Astro repo says "an Astro demo site".)
- All demo/example content is fictional; every outbound link in demo content
  points to `example.com`. Do not add real organizations or people. Exception:
  license attribution must keep its real links (the Code of Conduct credits
  the Django CoC and Geek Feminism template, as CC-BY requires).
- The theme credit is "Popular. A Hugo theme by Mariatta." linking to
  https://mariatta.ca (set per site via `[params.footer.credit]`).
