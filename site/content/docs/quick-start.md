+++
title = "Quick start"
type = "docs"
weight = 10
eyebrow = "Docs"
lead = "From zero to a running community site. Pick your framework once: the docs remember your choice."
+++

{{< fwswitch >}}

## 1 · Get the theme

{{% fw "hugo" %}}
Add the theme to your Hugo site as a git submodule (or copy the folder into `themes/popular`; Hugo Modules users can instead import `github.com/Mariatta/hugo-theme-popular`, see the README):

```bash
hugo new site my-community && cd my-community
git init
git submodule add https://github.com/Mariatta/hugo-theme-popular.git themes/popular
```
{{% /fw %}}

{{% fw "astro" %}}
Use the Astro repo as a template, it *is* a runnable site:

```bash
npm create astro@latest -- --template Mariatta/astro-theme-popular my-community
cd my-community && npm install
```
{{% /fw %}}

{{% callout tone="info" title="Building a site with an AI agent?" %}}
Point your agent at this page plus the [content model](/docs/content-model/) and let it drive. The brief it needs to *use* the theme:

- **Scaffold** with step 1 above, then start from a demo (step 2), rather than building pages from scratch.
- **One config file** holds site name, colours, nav, footer, and feature toggles: `hugo.toml` under `[params]` for Hugo, `src/config.ts` for Astro. See the [configuration reference](/docs/configuration/).
- **Content** is Markdown with front matter under `content/` (Hugo) or `src/content/` (Astro); the fields are identical across both frameworks. See the [content model](/docs/content-model/).
- **Bulk content** like events and speakers should be [imported](/docs/importing/) from Sessionize or a spreadsheet with one command, not typed by hand.
- **Preview** with `hugo server` (Hugo) or `npm run dev` (Astro); both output a fully static site you can deploy anywhere.

*Modifying or contributing to the theme itself* is different work: point the agent at the repo's `AGENTS.md` first ([Hugo](https://github.com/Mariatta/hugo-theme-popular/blob/main/AGENTS.md) · [Astro](https://github.com/Mariatta/astro-theme-popular/blob/main/AGENTS.md)) for repo layout, parity rules, and the known gotchas. It doubles as the fastest human orientation.
{{% /callout %}}

## 2 · Start from an example

The fastest path is to copy one of the four demo sites (each ships as both a Hugo site and an Astro site) and make it yours: three fictional communities plus one personal site. All four are complete example sites, pick whichever vibe is closest.

{{% fw "hugo" %}}
```bash
# starter skeleton (neutral):
cp -r themes/popular/exampleSite/* .
# …or start from a full demo, e.g. the aquarium club:
cp -r themes/popular/demos/rocky-cove-aquarium/* .
hugo server
```
{{% /fw %}}

{{% fw "astro" %}}
```bash
npm run dev               # boots the neutral starter skeleton
# …or activate a full demo first (copies its config + content into src/):
npm run demo:aquarium     # or demo:foodie / demo:kdrama / demo:superfan
```
When you're ready, edit `src/content/` and `src/config.ts` directly and delete `demos/`.
{{% /fw %}}

## 3 · Make it yours

Open the config file and change the obvious things, name, logo, colours, links:

{{% fw "hugo" %}}
Everything lives under `[params]` in `hugo.toml`. See the [configuration reference](/docs/configuration/).
{{% /fw %}}

{{% fw "astro" %}}
Everything lives in `src/config.ts`. See the [configuration reference](/docs/configuration/).
{{% /fw %}}

{{% callout tone="tip" title="The one-file re-brand" %}}
Change `brand.primary` and the theme derives coherent tints for badges, tags and hovers automatically. Fonts, surfaces and radii are one line each. Details in [Theming](/docs/theming/).
{{% /callout %}}

## 4 · Add your content

Blog posts, events, organizers and authors are plain Markdown files with front matter, the fields are identical in both frameworks. See the [content model](/docs/content-model/). Running your event on Sessionize, or planning in a spreadsheet? [Import everything with one command](/docs/importing/) instead of retyping it.

## 5 · Deploy

Both implementations output a fully static site. Deploy anywhere: GitHub Pages workflows are included in each repo. See [Demos & deployment](/docs/demos/).

## 6 · Support the theme

Enjoying Popular? **Star the repo** so other organizers can find it, **tell others about it** (or use it for your next community site), and if it saves you real time, [sponsor the work on GitHub](https://github.com/sponsors/Mariatta).
