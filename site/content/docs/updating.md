+++
title = "Updating the theme"
type = "docs"
weight = 58
eyebrow = "Docs"
lead = "How to hear about new releases, read what changed, and update safely, whichever way you installed Popular. Customizing through the supported hooks keeps updates painless."
+++

## Hearing about releases

Popular is released with semver tags (`v0.2.0`), in lockstep across the Hugo
and Astro repos: one version number covers both. Three ways to hear about a
new one:

- **Watch the repo**: on GitHub, Watch → Custom → Releases. You get a
  notification per release, nothing else.
- **RSS**: subscribe to the [releases feed](https://github.com/Mariatta/hugo-theme-popular/releases.atom)
  in any feed reader.
- **The changelog**: [CHANGELOG.md](https://github.com/Mariatta/hugo-theme-popular/blob/main/CHANGELOG.md)
  ships in both repos and is the same file in each.

## Before you update

Read the release notes (or the changelog section, same text). During 0.x, a
minor version may contain breaking changes; when one does, the entry says so
and tells you what to change. The 1.0 release will mark the content model and
brand keys stable.

## Updating, per install method

{{% fw "hugo" %}}
**Hugo Module** (the recommended install):

```bash
hugo mod get -u github.com/Mariatta/hugo-theme-popular   # latest release
hugo mod get github.com/Mariatta/hugo-theme-popular@v0.2.0   # or pin one
```

**Git submodule**: update to a tag deliberately rather than tracking main:

```bash
cd themes/popular
git fetch --tags
git checkout v0.2.0
cd ../.. && git add themes/popular && git commit -m "Popular v0.2.0"
```

**Vendored copy**: see what moved between your version and the new one, then
re-copy the files you have not customized:

```bash
git -C /path/to/hugo-theme-popular diff v0.1.0..v0.2.0 --stat
```
{{% /fw %}}

{{% fw "astro" %}}
Astro sites vendor the theme (you copied the repo), so updating means pulling
the changed files in. See what moved, then re-copy what you have not
customized:

```bash
git -C /path/to/astro-theme-popular diff v0.1.0..v0.2.0 --stat
```

The usual suspects are `src/styles/` and `public/scripts/` (shared design
system, safe to re-copy wholesale unless you edited them), `src/components/`
and `src/layouts/` (re-copy unless customized), and `src/content.config.ts`
(re-copy; it validates your content). Your `src/config.ts` and `src/content/`
are yours and never need re-copying.

**Merge-based forks**: if you forked the repo and merge from upstream
instead, note that `src/content/` ships live starter samples by design;
expect to delete or replace them once, after which merges stay quiet.
{{% /fw %}}

## Customizations that survive updates

Updates are painless when your changes live in the places designed for them,
and painful when they replace theme files:

- **Config is always safe**: your `hugo.toml` / `config.ts` (brand block,
  menus, footer, strings) is never touched by an update.
- **UI strings**: override in your site's `i18n/<lang>.toml` (Hugo) or
  `STRINGS` (Astro), not in the theme's files.
- **Head markup** (analytics, verification tags): create
  `layouts/partials/head-extra.html` in your Hugo site; the theme includes it
  at the end of `<head>` and ships it empty. Astro sites edit
  `BaseLayout.astro` directly (it is your copy).
- **Extra CSS**: `customCSS` in config loads your stylesheet after the
  theme's, so overrides live in your repo.
- **Whole-file overrides** (a copied theme partial or component in your site)
  work, but you own the merge: re-compare against the theme's version on
  every update. Prefer the hooks above when one exists, and if you keep
  needing an override the theme has no hook for, that is worth
  [an issue](https://github.com/Mariatta/hugo-theme-popular/issues).

## Checking the result

After updating, build your site and skim the pages you customize most. The
changelog calls out anything that needs a config or content change; if a
build error mentions a front matter field, the content model section of the
release notes is the place to look.
