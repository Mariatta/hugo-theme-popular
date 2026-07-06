+++
title = "{{ replace .Name "-" " " | title }}"
eyebrow = "Speaker"
role = ""              # e.g. "Quizmaster" or "Guest speaker"
photo = "images/speaker.png"
bio = ""               # short bio shown on cards and the profile hero
website = ""           # optional personal site

# [[social]]
#   label = "Mastodon"
#   icon = "fa-brands fa-mastodon"
#   url = ""
draft = true
+++

Optional longer bio: shown on the speaker's profile page, above the sessions
they've led. Reference this profile from an event with `speakers = ["{{ .Name }}"]`.
