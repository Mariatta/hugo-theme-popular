# Popular: a Hugo theme for meetups & communities

> *Built to make your community seen and famous.* (Yes, it's named after *Pop!ular* by Darren Hayes.)

> **AI agents / automated contributors:** read [AGENTS.md](AGENTS.md) before making changes. It covers the repo layout, build commands, the Hugo-Astro parity contract, and content conventions.

**Popular** is a warm, community-first [Hugo](https://gohugo.io) theme for meetups, user
groups and small events. It ships everything a chapter needs:

- A composable **home page** (hero, stats, "what we do", auto next-event, latest posts, organizers, testimonials, CTA)
- A **blog** with tag filtering and per-post speaker bios
- An **events** section that splits into *upcoming* and *past* automatically, with speaker
  profiles, venue pages (address, buzz-code arrival notes, accessibility) and check-in instructions
- An **organizers / team** page
- A **docs area** for a handbook & step-by-step **runbooks**, with a scroll-tracking table of
  contents and **checklists that remember your progress** (saved in the browser)
- A dark footer with a **land-acknowledgement** slot and social links
- **Alt text, required**: CI builds every site and fails if any image lacks alt text
- **One-command imports**: populate events, speakers and venues from Sessionize or a
  spreadsheet (`scripts/`), cross-referenced, dependency-free, never overwriting your edits
- **Agent & human friendly**: ships [`AGENTS.md`](AGENTS.md) so AI coding agents follow the same rules as human contributors
- **Translatable UI**: every template string lives in one place (Hugo `i18n/`, Astro `STRINGS` config), so a site can run in any language

Every colour and font is driven from your site config, so you can **re-brand the whole theme
without touching a line of CSS**.

> **Product site + four demos.** `site/` is the theme's own documentation site
> (dogfooded on the theme: docs with a Hugo|Astro switcher, blog, about).
> `demos/` holds four complete fictional example sites, **Rocky Cove Aquarium
> Club** (teal), **Lucky Town Foodie Club** (copper), **KDrama Fan Club** (indigo),
> and **Truly Madly Riley** (gold, a personal site for one fictional superfan),
> all running the same theme code with different configs. `exampleSite/` is a
> neutral starter skeleton. The deploy workflow publishes the product site at the
> Pages root with the demos at subpaths, linked by a floating demo switcher
> (`params.demoBar`: never set it on a real site and it never appears).
> All demo communities, venues and people are made up for demonstration.

**Multi-author blogging:** posts support `authors = ["slug"]` (profiles in
`content/authors/` with bio, photo, socials, website → linked profile pages
listing their posts) and inline `[[guestAuthors]]` blocks for one-off guest
writers: plus the plain `author = "Name"` string as a fallback.

---

## Requirements

- **Hugo Extended is _not_ required.** Popular uses plain CSS (no SCSS), so standard Hugo works.
- Hugo **v0.126.0 or newer** (uses `.Fragments.Headings` for the docs TOC).
- Icons come from **Font Awesome 6** (loaded from a CDN by default; see *Icons* below).

---

## Quick start

### 1. Add the theme

**As a Git submodule** (recommended):

```bash
git submodule add https://github.com/your-org/hugo-theme-popular.git themes/popular
```

…or copy the `hugo-theme-popular/` folder into your site as `themes/popular`.

### 2. Start from the example

The fastest way to learn the structure is to copy the example site's config and content:

```bash
cp themes/popular/exampleSite/hugo.toml .
cp -r themes/popular/exampleSite/content .
cp -r themes/popular/exampleSite/static .
hugo server
```

Then open <http://localhost:1313>. Edit `hugo.toml` and the files under `content/` to make it yours.

---

## Making it your own

### Colours & fonts (no CSS needed)

Everything visual is a **design token**. Override the ones you want under `[params.brand]` in
`hugo.toml`:

```toml
[params.brand]
  primary       = "#fa023c"   # buttons, links, accents
  primaryHover  = "#d4023a"
  primaryActive = "#c8102e"
  secondary     = "#c8102e"
  accent        = "#2e2f93"
  ink           = "#142a36"   # headings / dark text
  surfaceWash   = "#fad3e2"   # hero / section wash
  surfaceInk    = "#142a36"   # footer / dark bands
  fontSans      = "Inter, system-ui, sans-serif"
  fontDisplay   = "Quantico, Inter, sans-serif"
  # radiusCard   = "1rem"
  # containerMax = "1140px"
```

Change `primary` and the theme derives coherent tints for soft badges, tags and hovers
automatically. For a deeper re-palette (the full colour ramps), edit
`themes/popular/assets/css/tokens/colors.css`. The other token files
(`typography.css`, `spacing.css`, `elevation.css`) are yours to tune too.

If you use custom web fonts, add them via `[params.brand].fontSans` / `fontDisplay` and load the
font files with `params.customCSS` (a list of extra stylesheet URLs) or by editing
`assets/css/tokens/fonts.css`.

### Header, footer, socials, CTA

All configured in `hugo.toml` under `[params]`:

- `logo`, `brandName`, `brandSub`, `tagline`, `landAcknowledgement`
- `[params.cta]`: the header button (`label`, `url`, `icon`)
- `[[params.social]]`: footer & organizer icons (`label`, `icon`, `url`)
- `[params.footer]`: `tagline` + `[[params.footer.columns]]` link columns
- `[params.support]`: the support box shown at the end of each blog post

The top navigation is a normal Hugo menu, edit the `[[menu.main]]` entries.

### Icons

Components accept **Font Awesome 6** class strings (e.g. `fa-solid fa-calendar`,
`fa-brands fa-github`). By default the theme loads Font Awesome from a CDN. To self-host or pin a
different version, set `params.fontAwesome` to your stylesheet URL.

---

## Content model

| Path | What it is | Layout |
|---|---|---|
| `content/_index.md` | Home page composition (hero/stats/features/CTA in front matter) | `index.html` |
| `content/about.md`, `content/code-of-conduct.md`, `content/get-involved.md` | Standalone pages | `_default/single` |
| `content/blog/` | Blog posts (section) | `blog/list`, `blog/single` |
| `content/events/` | Events (section): upcoming vs past by `date` | `events/list`, `events/single` |
| `content/organizers/` | Team members (section), ordered by `weight` | `organizers/list` |
| `content/speakers/` | Speaker profiles, referenced from events via `speakers = ["slug"]` | `speakers/list`, `speakers/single` |
| `content/venues/` | Venue pages (address, arrival notes), referenced via `venueRef` | `venues/list`, `venues/single` |
| `content/handbook.md`, `content/runbooks.md` | Docs pages (`type = "docs"`) with TOC, sidebar ordered by `weight` (set it on every docs page) | `docs/single` |

Create new content with the bundled archetypes:

```bash
hugo new blog/my-recap.md
hugo new events/august-meetup.md
hugo new organizers/jordan.md
hugo new speakers/rowan.md
hugo new venues/community-hall.md
```

### Home page

The home sections live in `content/_index.md` front matter: `[hero]`, `[[stats]]`,
`[featuresHead]` + `[[features]]`, `[testimonialsHead]` + `[[testimonials]]` (member quotes:
`quote`, `name`, optional `role` and `photo`), and `[getInvolved]`. Beyond those, the page **auto-populates**
the next upcoming event, the latest three posts, and your organizers from your content, no extra
config.

### Events

Each event is a page in `content/events/`. The event's `date` is its start time; anything in the
future shows under **Upcoming**, anything past under **Past**. Useful front-matter fields:
`time`, `rsvp`, `tags`, and `venueWanted = true` to show a "Venue wanted" badge. Venues come
from `venueRef = "slug"` (a `content/venues/` page whose address and arrival notes the event
inherits) or the flat `venue` + `address` fields. Speakers come from `speakers = ["slug"]`
(`content/speakers/` profiles rendered as bio cards) or the plain `speaker` string. `checkin`
and `venueNotes` render in a "Before you arrive" box ("Bring your registration email and photo
ID", "Buzz 204 at the side door"). A `meetupUrl` field is accepted as metadata by convention
(e.g. a Meetup.com listing); the theme deliberately renders no external links on event rows.

### Organizers

Each organizer is a page in `content/organizers/` with `role`, `photo`, a short `description`
(the card bio), `weight` (ordering) and optional `[[social]]` links.

---

## Shortcodes

Use these inside any Markdown page:

```markdown
{{</* button url="https://example.com/rsvp" label="RSVP" variant="primary" icon="fa-solid fa-calendar" */>}}

{{%/* badge tone="success" soft="true" */%}}Confirmed{{%/* /badge */%}}

{{%/* callout tone="tip" title="Two-deep rule" */%}}
Aim for **two** organizers at every event.
{{%/* /callout */%}}

{{%/* persona name="Linda Lee" title="Defang" photo="images/linda.jpg" */%}}
Short bio goes here.
{{%/* /persona */%}}

{{%/* checklist key="rb-venue" */%}}
Shortlist 2–3 venues
Confirm step-free access
Send a written confirmation
{{%/* /checklist */%}}
```

- **button**: `variant`: `primary` · `secondary` · `outline` · `ghost` · `dark`; `size`: `sm` · `lg`.
- **callout**: `tone`: `info` · `tip` · `warn`. Use the `{{%/* %*/%}}` form so the body renders as Markdown.
- **checklist**: one item per line. `key` must be **unique across the site**, it namespaces the
  saved progress in the visitor's browser.

---

## Project structure

```
popular/
├── assets/css/        tokens/ + base.css + components.css  (plain CSS)
├── assets/js/         checklist, toc, blog-filter, nav
├── layouts/
│   ├── _default/      baseof, single, list, term
│   ├── partials/      head, header, footer, brand-vars, cards…
│   ├── blog/ events/ organizers/ docs/
│   ├── index.html     home
│   └── shortcodes/
├── archetypes/
├── exampleSite/       neutral starter skeleton, copy to bootstrap your site
├── demos/             four full Hugo demo sites (aquarium, foodie, kdrama, superfan)
└── site/              the theme's own product/docs site (dogfooded)
```

---

## Helper scripts

- `scripts/sessionize-import.py`: populate `content/events/` and `content/speakers/` from a
  [Sessionize](https://sessionize.com) event's public "API / Embeds" endpoint (`view/All`).
  One command imports every session and speaker; existing files are never overwritten, so
  edit freely after importing:

  ```bash
  python3 scripts/sessionize-import.py --url https://sessionize.com/api/v2/<embed-id>/view/All --site .
  ```

- `scripts/spreadsheet-import.py`: the same import from **one spreadsheet** with tabs for
  Speakers, Venues, Sponsors, Organizers and Events, for communities that plan in a sheet
  instead of Sessionize. Dependency-free (.xlsx or per-tab CSVs); the Events tab
  cross-references the others by name. Generate a starter workbook with:

  ```bash
  python3 scripts/spreadsheet-import.py --make-sample community.xlsx
  ```

  (A ready-made one ships at `scripts/sample-community.xlsx`.)

- `scripts/serve-all.sh`: run the product site, all four demos and the exampleSite at once.
- `scripts/update-sponsors.py`: regenerate the product site's sponsors section from GitHub Sponsors.
- `scripts/sync-shared.sh --check`: verify the Hugo ⇄ Astro shared files haven't drifted.

The helper scripts have a dependency-free test suite: `python3 -m unittest discover -s scripts/tests` (also run in CI).

## Deploying

Popular is a static site, deploy the `public/` folder anywhere (Netlify, GitHub Pages, Cloudflare
Pages, etc.). Set `baseURL` in `hugo.toml` and build with `hugo --minify`.

---

## Support the theme

Popular is free and MIT licensed. If it made your community site easier, there are three
ways to support the work:

- **Star the repo** so other organizers can find it
- **Tell others about it**: share it with another meetup, club or community, or use it
  yourself for your next community site
- **[Sponsor on GitHub](https://github.com/sponsors/Mariatta)**

---

## Credits & license

- Typography: **Inter** and **Quantico** (Google Fonts).
- Icons: **Font Awesome 6**.
- Released under the **MIT License**, see `LICENSE`. Fork it, adapt it, and share your community's
  version.
