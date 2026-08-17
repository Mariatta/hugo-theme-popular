+++
title = "Introducing Popular"
date = 2026-08-17
authors = ["mariatta"]
description = "A warm, community-first theme for Hugo and Astro, built from ten years of organizing: events, docs, importers, and one-block re-theming. No third-party requests, no cookies, four demos included."
tags = ["release", "announcement"]
draft = false
+++

**Popular** is here: a warm, community-first theme for meetups, clubs, and fan communities, shipping for Hugo and Astro on day one, in parity, from the same design system.

## Why this theme exists

Most themes are built for commerce, portfolios, or personal blogs. Go looking for a community theme and the striking thing is not that you find the wrong ones: it is that the category does not exist. The Hugo theme gallery organizes its themes under twenty-one tags, and *community*, *event*, *meetup* and *conference* are none of them. Search the Astro catalogue for "community" and you get general-purpose bundles.

The closest thing on offer is usually a conference theme: one event, with ticketing, a venue map, and a countdown clock. Those work for launching a single conference. They don't work for an ongoing community, a grassroots meetup that gathers month after month, whose history is as much a part of its identity as its next event. So community organizers end up rebuilding the same site from scratch, over and over.

**Popular**'s creator has spent ten years organizing meetups and conferences, and one too many of those rebuilds. This theme is the distillation of what a community needs from its website: upcoming and past events, a blog for recaps and news, speaker and organizer profiles, and a clear path for a newcomer to show up. All of it ships in the box.

## What's in the box

- **Events, done right.** Upcoming and past split automatically, with speaker profile cards, venue pages that carry arrival notes (buzz codes and all), check-in instructions, RSVP buttons, and a "venue wanted" state.
- **An organizer docs area.** Handbook and runbooks with a scroll-tracking table of contents and checklists that remember your progress in the browser.
- **A multi-author blog.** Tag filtering, pagination, author profiles, inline guest writers.
- **A composable home page.** Hero, stats, features, member testimonials, and a closing call to action, all from config.
- **Agent and human friendly.** `AGENTS.md` is included, so AI coding agents follow the same rules as people.
- **One-block re-theming.** Change `brand.primary` and the whole site follows, derived tints included. Accessibility is enforced in CI, starting with required alt text.
- **Nothing phones home.** Fonts and icons are served by your own site, not a CDN, so no visitor's IP address is handed to anyone and the theme sets no cookies. There is no analytics, no tracker, and no consent banner to add, because there is nothing to consent to.

## Tools, not just templates

A community never runs on one thing alone: there's an RSVP platform, a CFP tool, a schedule, and usually a spreadsheet holding it all together. So Popular ships with scripts alongside the templates. One command imports your Sessionize schedule or your spreadsheet plan into content files, cross-referenced and dependency-free. Your site becomes the place where the rest of your stack lands, not another thing to update by hand.

## "But we already use Luma / Meetup / Pretalx"

Fair question. If those platforms handle RSVPs, discovery, and scheduling, why maintain a website at all?

Because each of those tools solves exactly one problem. Luma is for RSVPs. Pretalx and Sessionize are for speakers and schedules. None of them is your community's home: your recaps, your handbook, your history, your identity. Popular is not a replacement for these platforms. It's the connective tissue between them. Event pages link out to your RSVP platform; speaker pages are generated from your CFP tool. Each platform does its one job, and your site ties them into a single, independent presence.

Independence matters, while your community evolves and technology changes. What's a well-known platform this year may not be the same well-known platform ten years later. When you own your presence, a platform changing its pricing, its policies, or its priorities, is an inconvenience, not a crisis.

## "Our community lives on Discord / Slack / a forum"

Chat platforms and forums are where a community talks. They are poor at holding what a community knows.

Chat scrolls away: the venue instructions posted three months ago are buried under hundreds of newer messages. Forum threads sink under new ones. And in most setups, none of it is visible to someone who hasn't joined yet: a newcomer searching for your community finds nothing, because everything lives behind a login.

Treat chat and forums as communication, not documentation. The handbook, the runbooks, the event archive, and the "how we do things here" belong on a website: organized, searchable, and findable by people who haven't joined yet. That's what Popular's organizer docs area and event pages are built for. Keep the chat for conversation. Give the knowledge a permanent, public home.

## Communities first, but it flexes

**Popular** is built for communities, but "community" doesn't mean "tech meetup." A community is any group of people who gather around a shared thing: a hobby, a neighborhood, a fandom, even a single person and their audience. Two other shapes fall out for free. This very website is Popular running as a project site (docs, blog, no events), and it works as a personal site too (the blog as a news feed, events as appearances, no organizers page). Sections you don't create content for simply never render.

## Four demos, zero tricks

That range is why **Popular** ships with four complete fictional example sites, and not one of them is a tech meetup: Rocky Cove Aquarium Club (teal, a hobby club), Lucky Town Foodie Club (copper, people who gather to eat), KDrama Fan Club (indigo, a fandom), and Truly Madly Riley (gold, a personal site for one devoted superfan). If the theme works for all four, it will work for yours.

And if you want the real thing rather than fiction, three tech communities run **Popular** in production, across both frameworks.

[PyLadies Vancouver](https://vancouver.pyladies.com/) runs the Hugo theme: a recurring meetup, with the events, recaps and organizer handoffs that implies.

[Hidden Figures of Python](https://pypodcats.live/) runs the Hugo theme as a podcast, which is the clearest proof that the content model is not hardcoded to meetups. Events are renamed to [episodes](https://pypodcats.live/episodes/) and organizers to the team; the home page runs latest episodes, the hosts, listener quotes and a support call to action; and the about area carries the code of conduct, the financials and the disclosure statement. Same sections, different words, no template changes.

The [PyCon US Maintainer Summit](https://pycon-maintainer-summit.github.io/) runs the Astro theme: a day for the people who keep Python running, held at PyCon US. It leans on the parts a monthly meetup uses less, and it is worth looking at if your community's shape is closer to an event than a meetup: a per-edition [event page](https://pycon-maintainer-summit.github.io/events/2026-pycon-us/), a [talks archive](https://pycon-maintainer-summit.github.io/talks/), the blog renamed to News, and the docs area carrying an attendee guide, a CFP guide and the code of conduct.

Note what the summit is not. A gathering that happens every year is not the same thing as a one-off conference: it accumulates editions, and last year's is still worth reading. That is precisely the case a countdown-clock conference theme handles worst, because it assumes the event is the site, and when the event is over so is the site.

The demos show the range. These three show it holding up against real events, real episodes, real speakers and real handovers.

Diff any two of the demo configs and you'll find the entire visual difference: a `brand` block, nav labels, and copy. Zero template changes, zero CSS. Everything in them is fictional on purpose, and every link points to `example.com`, so you can safely copy a demo, search-and-replace, and publish. [Browse the demos](/docs/demos/) and pick the closest vibe.

## Install it, don't copy it

Themes are usually something you copy. That is fine on day one and a problem in
year three, when the theme has moved on, your copy has not, and updating means
diffing two trees by hand. Community sites are long-lived and change hands, and
"the last organizer customized something, we're not sure what" is how a site
quietly stops being updated at all.

So on Astro, **Popular** is a package you depend on. Your repository holds your
config, your content and your images; the theme arrives as a dependency, and
updating is one version bump. On Hugo it is a Hugo Module, which works the same
way. Either way, the next organizer inherits a site they can actually maintain.

## Get started

For Astro, scaffold a site and pick a starting point:

```bash
npm create popular-site@latest my-community
```

For Hugo, add the module to a new site and follow the
[quick start](/docs/quick-start/), which takes about five minutes for either
framework. Both paths end the same way: a setup wizard interviews you about
your community, writes the config, and records what you decided.

### Building it with an AI agent

If you would rather hand this to a coding agent, the theme is built for that.
Point it at the [quick start](/docs/quick-start/) and the
[content model](/docs/content-model/), and it has what it needs.

Both repositories ship an `AGENTS.md` that tells an agent the same things a new
human contributor would be told, and one instruction in particular: do not
hand-edit the config. Interview the organizer using the question schema, then
run the setup wizard, which is the tested write path and leaves an audit trail
of what was decided and what is still open. Bulk content has a command too, so
a season of events and speakers comes in from Sessionize or a spreadsheet
rather than being typed out.

It also tells the agent to report back. If any instruction in these docs is
wrong, stale, or fails when run, the agent is asked to say so and offer to file
it upstream rather than quietly working around it. Take it up on that: it knows
exactly which command failed.
