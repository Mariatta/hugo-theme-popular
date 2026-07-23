+++
title = "Beyond meetups"
type = "docs"
weight = 68
eyebrow = "Docs"
lead = "Popular is built for meetups, but 'community' is bigger than that. The same content model, an event, a recap, a person, a runbook, fits a lot of groups that don't call themselves a meetup."
+++

## The theme is a shape, not a topic

Everything in the theme maps to a general community pattern:

- **Events** are anything scheduled: talks, watch parties, shifts, recording
  sessions, class meetings, gigs.
- **The blog** is anything published on a cadence: recaps, news, release
  notes, episode notes, season announcements.
- **Organizers** are the people behind it: hosts, teachers, crew, captains.
- **The docs area** is the group's operating knowledge: a handbook, runbooks,
  a code of conduct, house rules.

If your group has "things that happen", "things you write down", and "people
who run it", the theme fits, whatever you call yourselves. The section names
themselves are [renameable](/docs/configuration/#renaming-content-sections)
(hosts instead of organizers, and so on), so the vocabulary matches your group.

## Worked example: a podcast

A podcast isn't a meetup, but it maps cleanly:

- **Episodes** are events with a date and a "watch/listen" link. Past and
  upcoming split automatically; a live recording is just an upcoming event.
- **Hosts** are the organizers (rename the section to `hosts`); they also
  write the blog, so point the author section at them too.
- **The blog** carries show notes and announcements.
- **Structured data** gives each episode an Event rich-result and each post a
  BlogPosting, so search and AI answer engines understand the show.

The result is a home for the show that you own, links out to the platforms
that host the audio, and holds everything those platforms don't: the archive,
the people, the story.

## Other shapes that fit

- **A class or course**: sessions as events, a syllabus in the docs area,
  the instructor as the sole organizer.
- **A neighborhood or mutual-aid group**: work days as events, a handbook of
  how-we-do-things, a roster of coordinators.
- **A fan community**: watch parties and meetups as events, recaps as blog
  posts (see the KDrama and superfan [demos](/docs/demos/)).

## When it doesn't fit

If your site is a single event with ticketing and a countdown, use a
conference theme. Popular is for the *ongoing* group whose history is part of
its identity. That's the line.
