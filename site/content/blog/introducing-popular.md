+++
title = "Introducing Popular"
date = 2026-07-06
authors = ["mariatta"]
description = "A warm, community-first theme for Hugo and Astro, built from ten years of organizing: events, docs, importers, and one-block re-theming. Four demos included."
tags = ["release", "announcement"]
+++

Popular is here: a warm, community-first theme for meetups, clubs, and fan communities, shipping for Hugo and Astro on day one, in parity, from the same design system.

## Why this theme exists

Most themes are built for commerce, portfolios, or personal blogs. Search any theme gallery for "community" and what you'll find are conference themes: one event, with ticketing, a venue map, and a countdown clock. Those work for launching a single conference. They don't work for an ongoing community, a grassroots meetup that gathers month after month, whose history is as much a part of its identity as its next event. Community organizers end up rebuilding the same site from scratch, over and over.

Popular's creator has spent ten years organizing meetups and conferences, and one too many of those rebuilds. This theme is the distillation of what a community needs from its website: upcoming and past events, a blog for recaps and news, speaker and organizer profiles, and a clear path for a newcomer to show up. All of it ships in the box.

## What's in the box

- **Events, done right.** Upcoming and past split automatically, with speaker profile cards, venue pages that carry arrival notes (buzz codes and all), check-in instructions, RSVP buttons, and a "venue wanted" state.
- **An organizer docs area.** Handbook and runbooks with a scroll-tracking table of contents and checklists that remember your progress in the browser.
- **A multi-author blog.** Tag filtering, pagination, author profiles, inline guest writers.
- **A composable home page.** Hero, stats, features, member testimonials, and a closing call to action, all from config.
- **Agent and human friendly.** `AGENTS.md` is included, so AI coding agents follow the same rules as people.
- **One-block re-theming.** Change `brand.primary` and the whole site follows, derived tints included. Accessibility is enforced in CI, starting with required alt text.

## Tools, not just templates

A community never runs on one thing alone: there's an RSVP platform, a CFP tool, a schedule, and usually a spreadsheet holding it all together. So Popular ships with scripts alongside the templates. One command imports your Sessionize schedule or your spreadsheet plan into content files, cross-referenced and dependency-free. Your site becomes the place where the rest of your stack lands, not another thing to update by hand.

## "But we already use Luma / Meetup / Pretalx"

Fair question. If those platforms handle RSVPs, discovery, and scheduling, why maintain a website at all?

Because each of those tools solves exactly one problem. Luma is for RSVPs. Pretalx and Sessionize are for speakers and schedules. None of them is your community's home: your recaps, your handbook, your history, your identity. Popular is not a replacement for these platforms. It's the connective tissue between them. Event pages link out to your RSVP platform; speaker pages are generated from your CFP tool. Each platform does its one job, and your site ties them into a single, independent presence.

Independence matters. Community evolves. Technology changes. Because the community owned its own website, the move was a link update, not a migration. The URL stayed. The archive stayed. Members didn't have to find the group again. When you own your presence, a platform changing its pricing, its policies, or its priorities is an inconvenience, not a crisis.

## "Our community lives on Discord / Slack / a forum"

Chat platforms and forums are where a community talks. They are poor at holding what a community knows.

Chat scrolls away: the venue instructions posted three months ago are buried under hundreds of newer messages. Forum threads sink under new ones. And in most setups, none of it is visible to someone who hasn't joined yet: a newcomer searching for your community finds nothing, because everything lives behind a login.

Treat chat and forums as communication, not documentation. The handbook, the runbooks, the event archive, and the "how we do things here" belong on a website: organized, searchable, and findable by people who haven't joined yet. That's what Popular's organizer docs area and event pages are built for. Keep the chat for conversation. Give the knowledge a permanent, public home.

## Communities first, but it flexes

Popular is built for communities, but "community" doesn't mean "tech meetup." A community is any group of people who gather around a shared thing: a hobby, a neighborhood, a fandom, even a single person and their audience. Two other shapes fall out for free. This very website is Popular running as a product site (docs, blog, no events), and it works as a personal site too (the blog as a news feed, events as appearances, no organizers page). Sections you don't create content for simply never render.

## Four demos, zero tricks

That range is why Popular ships with four complete fictional example sites, and not one of them is a tech meetup: Rocky Cove Aquarium Club (teal, a hobby club), Lucky Town Foodie Club (copper, people who gather to eat), KDrama Fan Club (indigo, a fandom), and Truly Madly Riley (gold, a personal site for one devoted superfan). If the theme works for all four, it will work for yours.

Diff any two configs and you'll find the entire visual difference: a `brand` block, nav labels, and copy. Zero template changes, zero CSS. Everything in them is fictional on purpose, and every link points to `example.com`, so you can safely copy a demo, search-and-replace, and publish. [Browse the demos](/docs/demos/) and pick the closest vibe.

## Get started

The [quick start](/docs/quick-start/) takes about five minutes for either framework.
