+++
title = "Subscribe to your events as a calendar feed"
date = 2026-11-10
authors = ["mariatta"]
description = "Starting with Popular 0.13, members can subscribe to your events as a live calendar feed in Apple Calendar, Outlook, Thunderbird or Google Calendar, instead of downloading a one-time .ics file."
tags = ["release", "events"]
draft = false
+++

Now your members can subscribe to your events as a calendar feed. They add
it once. From then on, their calendar app picks up new events and time
changes on its own.

Previously, the "Subscribe to calendar" button was a download. The theme
publishes your events as an iCalendar feed at `/events/calendar.ics`, rebuilt
on every deploy (on Hugo, once you add `Calendar` to the events outputs), but
the button linked to it over plain https, and browsers treat that as a file to
save. Members got a snapshot of the calendar as it was that day. Add an event
or move a start time, and they had to download it all over again to see it.

Starting with **v0.13**, the events list, and the empty state shown when
nothing is scheduled yet, offer three buttons:

- **Subscribe to calendar** is a `webcal://` link. One click opens Apple
  Calendar, Outlook or Thunderbird already subscribed to the live feed.
- **Add to Google Calendar** opens Google Calendar's add-calendar prompt with
  the feed filled in. Google Calendar does not register a handler for
  `webcal://` links on the web or on Android, so the subscribe button does
  nothing for its users, and they need a button of their own.
- **Download .ics** is the plain feed file, kept on purpose: it is what you
  paste into any app's "add calendar from URL" dialog, and it is there for
  anyone who does want the file.

**About the Google icon.** That middle button only works for Google Calendar,
so it carries the Google logo: Google users can see it is theirs, and everyone
else knows to use Subscribe instead. It is the only third-party logo the theme
adds to your site. The icon is a Font Awesome glyph, not an image fetched from
Google, and the button is a plain link, so your page makes no request to
Google when it loads. Google only hears from a visitor who clicks it.

![The events list header with three calendar buttons: Subscribe to calendar, Add to Google Calendar, and Download .ics](images/subscribe-buttons.png)

*The new buttons on the Rocky Cove Aquarium Club demo's events page.*

The feed itself also gained `REFRESH-INTERVAL` and `X-PUBLISHED-TTL` hints
(12 hours) for the calendar apps that honor them. Google ignores both and
refreshes subscribed feeds on its own schedule, typically within a day; worth
knowing before you wonder why a brand-new event has not appeared in a
member's Google Calendar five minutes after you published it.

## See it in the demos

Every demo ships the new buttons on its events page:
[Rocky Cove Aquarium Club](/aquarium/events/),
[Lucky Town Foodie Club](/foodie/events/),
[KDrama Fan Club](/kdrama/events/), and
[Truly Madly Riley](/superfan/events/). Or [browse all the demos](/docs/demos/)
and pick one to poke at.

The buttons show up in the empty state too, so a community between seasons
still collects subscribers:

![The no-upcoming-events empty state: a calendar medallion, the message "Nothing on the calendar right now", and buttons to join the Discord, subscribe to the calendar, add it to Google Calendar, or download the .ics file](images/subscribe-empty-state.png)

*Nothing scheduled yet, and visitors can still subscribe (and find your chat).*

## Upgrading a site

For most sites there is nothing to do beyond taking the update: bump the npm
dependency on Astro, update the theme on Hugo (see
[Updating](/docs/updating/)). Two notes:

- **Translated sites** have two new UI strings to add: `subscribeGoogle` and
  `downloadCalendar` (in `STRINGS` on Astro, your `i18n/<lang>.toml` on Hugo).
- **The webcal link is built from your configured base URL**, since a
  calendar app needs an absolute address to poll. Set it to your real domain,
  which your canonical URLs and feeds wanted anyway.

The full details are in the [changelog](/changelog/) and the
[calendar feed docs](/docs/configuration/#calendar-feed-ical).
