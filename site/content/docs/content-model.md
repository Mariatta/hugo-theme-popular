+++
title = "Content model"
type = "docs"
weight = 30
eyebrow = "Docs"
lead = "The front-matter fields for every content type. Identical across Hugo (TOML) and Astro (YAML, zod-validated), content moves between the two freely."
+++

{{< fwswitch >}}

## Blog posts

`title`, `date`, `description`, `image`, `tags[]`, plus authorship (see below) and an optional `speaker` block (name, title, photo, bio) for recap posts.

## Authors

Posts support three levels of authorship, mix and match:

1. **Simple byline**: `author = "Nadia"` (plain text, no page).
2. **Author profiles**: create `authors/<slug>` entries (name, `role`, `photo`, `bio`, `website`, `social[]`), then reference them from posts: `authors = ["nadia", "tom"]`. Bylines link to the author's profile page, which shows their bio card and everything they've written.
3. **Guest authors**: one-off writers who don't need a profile page: an inline `guestAuthors` list on the post (same fields as a profile). They get a "Guest" badge and a full bio card at the end of the post.

{{% fw "hugo" %}}
```toml
authors = ["nadia"]

[[guestAuthors]]
  name = "Wren Alvarez"
  title = "Guest writer · reef keeper"
  photo = "images/wren.png"
  bio = "Keeps a 90-gallon reef."
  website = "https://example.com"
```
{{% /fw %}}

{{% fw "astro" %}}
```yaml
authors: ["nadia"]
guestAuthors:
  - name: "Wren Alvarez"
    title: "Guest writer · reef keeper"
    photo: /images/wren.png
    bio: "Keeps a 90-gallon reef."
    website: https://example.com
```
{{% /fw %}}

## Events

`title`, `date` (the event's start, decides upcoming vs past automatically), `description`, `image`, `tags[]`, `time`, `rsvp`, and `venueWanted = true` for a "Venue wanted" badge.

**Where:** either `venueRef = "slug"` pointing at a [venue page](#venues) (inherits its name, address and arrival notes), or the flat `venue` + `address` fields for a one-off location.

**Who:** either `speakers = ["slug"]` referencing [speaker profiles](#speakers) (rendered as bio cards, multiple supported), or the plain `speaker` string for a one-liner.

**Getting in:** `checkin` ("Bring your registration email, print or phone, and photo ID.") and `venueNotes` ("Buzz 204 at the side door; elevator to level 2.") render in a "Before you arrive" box on the event page; `venueNotes` overrides the venue page's own notes.

{{% fw "hugo" %}}
Set `buildFuture = true` in your `hugo.toml`. Upcoming events have a future `date`, and without it Hugo treats that as a future publish date and drops them from the build.
{{% /fw %}}

## Organizers

`title` (name), `weight` (ordering), `role`, `photo`, `description` (card bio), `social[]`.

## Speakers

Speaker profiles live in `content/speakers/` with the same fields as authors: `title` (name), `role`, `photo`, `bio`, `website`, `social[]`. Each speaker gets a profile page listing every session they've led; events reference them with `speakers = ["slug"]`.

## Venues

Venue pages live in `content/venues/`: `title` (name), `address`, `photo`, `notes` (arrival instructions like a buzzer code, inherited by every event held there), `accessibility`, `website`. Each venue page lists the events it has hosted; events reference one with `venueRef = "slug"`.

## Importing content

Events, speakers and venues can be bulk-imported from **Sessionize** or from a **spreadsheet** with one command each, cross-references included. See [Importing content](/docs/importing/).

## Sponsors & other directories

The organizers layout is a general-purpose "people/partner directory", a photo-card grid built from a content section. You can reuse it for any list your community keeps:

{{% fw "hugo" %}}
Create a new section and point it at the organizers layout with `type`:

```toml
# content/sponsors/_index.md
+++
title = "Our sponsors"
type = "organizers"
eyebrow = "Sponsors"
lead = "The organizations that keep our events free."
+++
```

Then add one file per sponsor (same fields as organizers: `role`, `photo`, `description`, `social`, `weight`) and link `/sponsors/` from your menu or About page; use the photo slot for a logo. (Speakers and venues no longer need this trick, they're first-class content types above.)
{{% /fw %}}

{{% fw "astro" %}}
Copy the organizers pattern: duplicate the `organizers` collection in `src/content.config.ts` under a new name (e.g. `sponsors`), add `src/content/sponsors/*.md`, and copy `src/pages/organizers/[...page].astro` to a new route, swapping the collection name and header text.
{{% /fw %}}

## Docs pages (handbook / runbooks)

Long-form pages with an auto-generated scroll-tracking table of contents from your `##` headings. Use the callout and checklist components inside.

{{% fw "hugo" %}}
Set `type = "docs"` in front matter; write callouts/checklists with the theme's shortcodes.
{{% /fw %}}

{{% fw "astro" %}}
Put the file in `src/content/docs/` as MDX; import `<Callout>` and `<Checklist>`.
{{% /fw %}}

## Plain pages

About, code of conduct, get-involved: `title`, `eyebrow`, `lead` + prose.

## Nested pages and back links

A page inside a section directory (`content/about/financials.md`, or on Astro
`content/pages/about/financials.mdx`) renders a back link to its parent
section. The link text is the parent's title, or its optional `shortTitle`
front-matter field when the full title is long:

```toml
# content/about/_index.md   (Astro: content/pages/about.mdx)
title = "About Our Community and How We Run It"
shortTitle = "About"
```

Root-level pages have no parent and show no back link.
