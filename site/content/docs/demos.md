+++
title = "Demos & deployment"
type = "docs"
weight = 60
eyebrow = "Docs"
lead = "Three fictional communities and one fictional superfan, one theme. Plus how the demo pipeline and your own deployment work."
+++

{{< fwswitch >}}

## The four demos

All four are complete example sites, every page, guides, blog and events. They exist to prove one claim: **the entire visual difference between them is one config block.** None is more "official" than the others.

- **🐠 Rocky Cove Aquarium Club**: deep teal. Show & tell nights, aquascaping workshops, shrimp swaps. Also demonstrates the multi-author blog (a profile author *and* an inline guest writer).
- **🍜 Lucky Town Foodie Club**: copper. Pierogi nights, dessert crawls, the great poutine cook-off.
- **📺 KDrama Fan Club**: indigo. Watch parties, trivia nights, OST karaoke.
- **⭐ Truly Madly Riley**: marquee gold. A *personal site* for one fictional superfan: the blog is a news feed, events are an influencer's appearances, and there's no organizers page at all.

Every community, venue and person in them is fictional, and all links point to `example.com`. Browse them with the floating demo switcher, it only renders on demo builds.

## How the demo switcher works

The floating switcher links between `/aquarium/`, `/foodie/`, `/kdrama/` and `/superfan/`, sibling paths that only exist on the **combined deployment** the GitHub Pages workflow produces. So:

- **Deployed:** all demos live under one host; the switcher hops between them.
- **Local dev:** you run *one* site at a time, the siblings don't exist, and the bar is **hidden automatically**, this is expected, not a bug.

{{% fw "hugo" %}}
For example, `hugo server --source demos/lucky-town-foodie …` serves just that demo.
{{% /fw %}}

{{% fw "astro" %}}
For example, `npm run demo:foodie && npm run dev` serves just that demo.
{{% /fw %}}

## Starting from a demo

{{% fw "hugo" %}}
Each demo is a self-contained Hugo site in the theme repo, `demos/rocky-cove-aquarium/`, `demos/lucky-town-foodie/`, `demos/kdrama-fan-club/`, `demos/truly-madly-riley/`, plus a neutral starter in `exampleSite/`. Copy one over your site root and edit.
{{% /fw %}}

{{% fw "astro" %}}
Demo sets live in `demos/{aquarium,foodie,kdrama,superfan}/`. Activate one with `npm run demo:aquarium` (copies its config + content into `src/`), then edit `src/` directly.
{{% /fw %}}

## Deploying your site

Both implementations build to plain static files, Netlify, Cloudflare Pages, GitHub Pages, anywhere.

{{% fw "hugo" %}}
```bash
hugo --minify   # output in public/
```
A ready-made GitHub Pages workflow ships in the repo (`.github/workflows/deploy-demo.yml`), it builds this docs site plus all four demos; trim it to a single `hugo` step for your own site.
{{% /fw %}}

{{% fw "astro" %}}
```bash
npm run build   # output in dist/
```
Set `site` in `astro.config.mjs` for correct RSS/OG URLs. The included Pages workflow builds all four demos behind a gallery; for your own site, deploy `dist/` at a domain root (the theme's links are root-absolute).
{{% /fw %}}

## Keeping Hugo & Astro in sync

The two implementations share a written contract, `PARITY.md` in both repos: identical CSS/JS files (checked by `scripts/sync-shared.sh --check`), a file-to-file template mapping, and the shared content-model schema. CI opens a `parity` issue whenever contract-covered files change on one side.
