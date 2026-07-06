+++
title = "{{ replace .Name "-" " " | title }}"
# The event's date & time. Upcoming vs past is decided by this.
date = {{ .Date }}
description = ""
image = ""
tags = []

time = "6:00 – 8:30 PM"

# Venue: either reference a venue page (content/venues/<slug>.md) to inherit
# its name, address and arrival notes…
venueRef = ""
# …or fill the flat fields for a one-off venue. Leave both empty (or set
# venueWanted = true) to show the "Venue wanted" badge.
venue = ""
address = ""

# Check-in instructions, e.g. "Bring your registration email (print or phone)
# and photo ID."
checkin = ""
# Venue-specific arrival notes, e.g. "Buzz 204 at the side door; elevator to
# level 2." Overrides the venue page's own notes when both exist.
venueNotes = ""

# Speakers: reference speaker pages (content/speakers/<slug>.md) for full
# profile cards, or use the plain `speaker` string for a one-liner.
speakers = []
speaker = ""

rsvp = "https://example.com/rsvp"
draft = true
+++

Describe the event here.
