+++
title = "Configuration reference"
type = "docs"
weight = 20
eyebrow = "Docs"
lead = "Every knob the theme exposes. Hugo reads hugo.toml [params]; Astro reads src/config.ts, same keys, same meaning."
+++

{{< fwswitch >}}

## Site identity

`title`, `tagline`, `description`, `brandName` + `brandSub` (the two-line wordmark in the header), `logo`, `ogImage`, and `landAcknowledgement` (footer slot, leave empty to hide).

{{% fw "hugo" %}}
```toml
[params]
  tagline = "A friendly coding meetup"
  brandName = "Rocky Cove"
  brandSub = "Aquarium Club"
  logo = "images/logo.png"
  landAcknowledgement = "…"
```
{{% /fw %}}

{{% fw "astro" %}}
```ts
export const SITE = {
  title: 'Rocky Cove Aquarium Club',
  tagline: 'A friendly coding meetup',
  brandName: 'Rocky Cove',
  brandSub: 'Aquarium Club',
  logo: '/images/logo.png',
  landAcknowledgement: '…',
};
```
{{% /fw %}}

## Brand tokens

The whole visual identity, one block. Only `primary` is required to re-brand; the rest have sensible defaults. See [Theming](/docs/theming/) for how derived tints work.

| Key | What it controls |
|---|---|
| `primary` / `primaryHover` / `primaryActive` | buttons, links, accents |
| `link` / `linkHover` | prose link color, when the default (derived from `primaryActive`) lacks contrast against body text |
| `secondary` | secondary buttons, persona accents |
| `accent` | occasional highlights |
| `accentHover` | accent-button hover (defaults to a darkened `accent`) |
| `ink` | headings & dark text |
| `surfaceWash` / `surfaceWashSoft` | hero wash & soft bands |
| `surfaceInk` | footer / dark strips |
| `fontSans` / `fontDisplay` | body & display faces |
| `radiusCard`, `containerMax` | card corners, page width |
| `surfacePage` / `surfaceCard` / `surfaceTertiary` / `textBody` / `textMuted` / `textOnBrand` / `borderSubtle` | dark-palette keys: page & card backgrounds, body/muted text, filled-button text, borders. Set these (plus the surfaces above) to run the theme on a dark background |

## Navigation & CTA

{{% fw "hugo" %}}
Top menu = standard Hugo menu (`[[menu.main]]`). Header button = `[params.cta]` (`label`, `url`, `icon`).
{{% /fw %}}

{{% fw "astro" %}}
Top menu = `NAV` array. Header button = `CTA` (`label`, `url`, `icon`).
{{% /fw %}}

## Footer, socials, support box

- `footer.tagline` + `footer.columns`: link columns (they lay out side by side and wrap on small screens)
- `social`: icon links in the footer. Any Font Awesome class works, so adding a channel is one entry:

{{% fw "hugo" %}}
```toml
[[params.social]]
  label = "YouTube"
  icon  = "fa-brands fa-youtube"
  url   = "https://youtube.com/@yourcommunity"
[[params.social]]
  label = "TikTok"
  icon  = "fa-brands fa-tiktok"
  url   = "https://tiktok.com/@yourcommunity"
[[params.social]]
  label = "Mastodon"
  icon  = "fa-brands fa-mastodon"
  url   = "https://fosstodon.org/@yourcommunity"
[[params.social]]
  label = "RSS"
  icon  = "fa-solid fa-rss"
  url   = "/blog/index.xml"
```
{{% /fw %}}

{{% fw "astro" %}}
```ts
export const SOCIAL = [
  { label: 'YouTube', icon: 'fa-brands fa-youtube', url: 'https://youtube.com/@yourcommunity' },
  { label: 'TikTok', icon: 'fa-brands fa-tiktok', url: 'https://tiktok.com/@yourcommunity' },
  { label: 'Mastodon', icon: 'fa-brands fa-mastodon', url: 'https://fosstodon.org/@yourcommunity' },
  { label: 'RSS', icon: 'fa-solid fa-rss', url: '/rss.xml' },
];
```
{{% /fw %}}

- `support`: optional box at the end of every blog post (badge, text, CTAs). Omit / set `null` to hide.

## Feeds & sharing defaults

These work out of the box, nothing to configure:

- **Open Graph / Twitter-card meta tags** on every page (title, description, URL, and `ogImage` or the page's own `image`), so links unfurl nicely on social platforms and chat apps.
- **RSS feed for the blog**, advertised via a `<link rel="alternate">` tag (feed readers auto-discover it) and a **"Subscribe via RSS"** link on the blog page. Tell your members they can follow new posts in any feed reader, no account needed.

{{% fw "hugo" %}}
Hugo generates the feed at `/blog/index.xml`.
{{% /fw %}}

{{% fw "astro" %}}
The feed is served at `/rss.xml`.
{{% /fw %}}

## Section headers & home page

The home page composition (hero, stats, features, team heading, testimonials, closing CTA) lives in:

{{% fw "hugo" %}}
`content/_index.md` front matter: `[hero]`, `[[stats]]`, `[featuresHead]` + `[[features]]`, `[team]`, `[testimonialsHead]` + `[[testimonials]]`, `[getInvolved]`.
{{% /fw %}}

{{% fw "astro" %}}
`HOME` in `src/config.ts` (same shape), plus `SECTIONS` for the blog/events/organizers list-page headers.
{{% /fw %}}

Each `[[testimonials]]` entry takes a `quote`, `name`, optional `role`, and optional `photo`; delete the block to hide the section.

Beyond those, the home page auto-populates the next upcoming event, the latest three posts, and your organizers from content, no config.

## Extra head markup (analytics and friends)

The theme core ships no analytics. To add a tracking snippet, verification
tag, or any other head-level markup, create `layouts/partials/head-extra.html`
in your site: the theme includes it at the end of `<head>` and ships it empty,
so your version wins without overriding the whole head partial.

## Translating the UI

All template strings (section headings, buttons, badges, empty states, dates)
are translatable; content is whatever language you write it in.

{{% fw "hugo" %}}
Set `defaultContentLanguage` in `hugo.toml`, at the top level above any
`[section]`: it drives both `<html lang>` and date formatting. Then create
`i18n/<lang>.toml` in your site root and override any key from the theme's
`i18n/en.toml`; you only need the keys you want to change.
{{% /fw %}}

{{% fw "astro" %}}
Set `SITE.locale` in `src/config.ts` (drives `<html lang>` and date
formatting), then edit the values in the `STRINGS` block. Keys match the Hugo
theme's `i18n/en.toml` one to one.
{{% /fw %}}

One site, one language: multilingual sites (several languages with a language
switcher) are not supported yet.

## Demo bar

`demoBar` (Hugo) / `DEMO_BAR` (Astro) renders the floating demo switcher on the theme's own demo builds. **Never set it on a real site** and it never appears.
