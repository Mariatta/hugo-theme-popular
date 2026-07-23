+++
title = "Migrating images from another theme"
type = "docs"
weight = 62
eyebrow = "Docs"
lead = "Moving to Popular from a theme that ran images through an assets pipeline? Here's how to serve your existing images at the paths the theme expects, without reorganizing your content."
+++

## The short version

Popular references images at site-relative paths like `/images/hero.png`, and
Hugo serves anything in your `static/` directory at the site root. So the
simplest migration is: **put your images in `static/images/`** and reference
them as `/images/...`. Nothing else to configure.

If your old theme kept images somewhere else (an assets pipeline, a
`page bundle`, an `img/` folder) and you'd rather not move them, you can
*mount* that directory to `/images/` instead.

## Mounting an existing image directory

Hugo Modules can mount any directory to a virtual path. To serve
`content/media/` at `/images/`:

```toml
[[module.mounts]]
  source = "content/media"
  target = "static/images"
```

Now `content/media/hero.png` is served at `/images/hero.png`, and the theme
finds it with no content changes.

## The gotcha: mounts replace the defaults

**The moment you declare any `[[module.mounts]]`, Hugo stops applying its
default mounts.** Your `static/`, `content/`, `layouts/`, `assets/` and
`i18n/` directories silently stop being picked up, because you've replaced the
whole mount list, not added to it.

So whenever you add a mount, **re-declare the defaults you still need**:

```toml
# Defaults you must restate once you add any mount of your own:
[[module.mounts]]
  source = "content"
  target = "content"
[[module.mounts]]
  source = "static"
  target = "static"
[[module.mounts]]
  source = "layouts"
  target = "layouts"
[[module.mounts]]
  source = "assets"
  target = "assets"
[[module.mounts]]
  source = "i18n"
  target = "i18n"

# ...then your own addition:
[[module.mounts]]
  source = "content/media"
  target = "static/images"
```

If images or styles vanish right after you add a mount, this is almost always
why.

## Alt text is required

However you bring images in, the theme's CI (and good practice) requires
non-empty `alt` text on every image. Captions go in an italic line right after
the image, not in `alt`. See [the content model](/docs/content-model/).
