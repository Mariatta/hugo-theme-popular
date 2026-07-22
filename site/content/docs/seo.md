+++
title = "SEO & structured data"
type = "docs"
weight = 65
eyebrow = "Docs"
lead = "What the theme does for search engines automatically, and the few knobs worth knowing. Structured data for events, blog posts and your organization ships out of the box."
+++

## What's automatic

Every page gets a description, canonical URL, full Open Graph and Twitter card
tags, `og:locale`, and a `robots.txt` advertising your sitemap. You don't
configure any of it.

The theme also emits JSON-LD structured data:

- **Event** on event pages (rich-result eligible),
- **Organization** on the home page,
- **BlogPosting** on blog posts.

Validate any page with Google's
[Rich Results Test](https://search.google.com/test/rich-results).

## Event rich results

Event pages become eligible for Google's event rich results. The theme reads
your existing front matter, no new required fields. The event's start time is
parsed from the free-text `time` field, best effort:

| `time` value | interpreted start |
|---|---|
| `6:00 PM` | 18:00 |
| `18:30` | 18:30 |
| `12:00 AM` | 00:00 |
| `6:00 PM · doors 5:30` | 18:00 (leading token) |
| `doors at 5:30` | date only (no leading time) |
| *(absent)* | date only |

Only a leading `HH:MM[am/pm]` token is read, so **put the real start time
first**. Write `date` as a plain calendar date and the clock time in `time`.

Optional event fields:

- `cancelled = true`: marks the event cancelled (a visible badge **and** the
  structured data), so the two never disagree.
- `online = true`: an online event (virtual location, online attendance mode).
- `price`, `currency`, `cost`: for paid events (`cost` is the displayed text,
  `price`/`currency` feed the structured offer).
- `imageAlt`: alt text for the social share image.

## Knobs

`[params.seo]` (Astro: `SITE.seo`):

- `currency`: default offer currency (default `USD`).
- `noindexTaxonomies = true`: keep tag pages out of search results.
- `faqJsonLd`: emit FAQPage JSON-LD from `faq` blocks (default `true`).

See also [FAQ sections](/docs/faq/) for the `faq` shortcode.
