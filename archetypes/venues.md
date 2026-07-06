+++
title = "{{ replace .Name "-" " " | title }}"
eyebrow = "Venue"
address = ""
photo = ""
# Arrival notes shown on this page and inherited by events held here,
# e.g. "Buzz 204 at the side door; elevator to level 2."
notes = ""
# e.g. "Step-free access via the main entrance; accessible washroom on site."
accessibility = ""
website = ""
draft = true
+++

Describe the venue: the room, the vibe, anything a first-time visitor should
know. Reference it from an event with `venueRef = "{{ .Name }}"` to inherit
the name, address and arrival notes.
