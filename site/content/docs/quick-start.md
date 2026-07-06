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
Add the theme to your Hugo site as a git submodule (or copy the folder into `themes/popular`):

```bash
hugo new site my-community && cd my-community
git init
git submodule add https://github.com/your-org/hugo-theme-popular.git themes/popular
```
{{% /fw %}}

{{% fw "astro" %}}
Use the Astro repo as a template, it *is* a runnable site:

```bash
npm create astro@latest -- --template your-org/astro-popular my-community
cd my-community && npm install
```
{{% /fw %}}

{{% callout tone="info" title="Building with an AI agent?" %}}
Both repos ship an `AGENTS.md` written for coding agents and new contributors alike: repo layout, build commands, content how-tos, and the known gotchas. Point your agent at it before its first edit ([Hugo](https://github.com/your-org/hugo-theme-popular/blob/main/AGENTS.md) · [Astro](https://github.com/your-org/astro-popular/blob/main/AGENTS.md)), and skim it yourself, it doubles as the fastest human orientation.
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
# activate a demo set (copies its config + content into src/):
npm run demo:aquarium     # or demo:foodie / demo:kdrama
# …or the personal-site example (one person, blog as news, talks as events):
npm run demo:superfan
npm run dev
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
