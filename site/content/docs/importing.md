+++
title = "Importing content"
type = "docs"
weight = 55
eyebrow = "Docs"
lead = "Populate events, speakers and venues with one command instead of retyping them: from Sessionize, or from a spreadsheet. No dependencies to install, safe to re-run, equally usable by AI agents."
+++

{{< fwswitch >}}

Both importers ship in both repos (`scripts/` directory), work for either framework (the output format is auto-detected from your site), and follow the same safety rules:

- **Existing files are never overwritten.** Import once, then edit freely; re-running skips anything you've touched. `--force` overwrites, `--dry-run` previews without writing.
- Everything lands in the theme's normal content model: events get `venueRef`, `speakers` references, check-in instructions and arrival notes; speakers get profile pages with photos and socials.
- **Standard library only**: if you have Python 3, you have everything.

## From Sessionize

If your event runs its CFP or schedule on [Sessionize](https://sessionize.com): in the Sessionize dashboard, open **API / Embeds** and create an *API* endpoint (this makes the data public, no authentication involved), then:

```bash
python3 scripts/sessionize-import.py --url https://sessionize.com/api/v2/<embed-id>/view/All --site .
```

Every session becomes an event (title, date, time range, room as venue, description) and every speaker becomes a profile (photo, tagline, bio, socials mapped to icons), already cross-referenced. Service sessions like lunch breaks are skipped. Use `--rsvp <url>` to stamp a signup link on every imported event, or `--file saved.json` to import offline.

## Storing your event's endpoint

Instead of passing `--url` every time, store the Sessionize embed id once in
`popular-import.toml` at your site root:

```toml
[sessionize]
id = "your-embed-id"
```

Then the import is just `python3 scripts/sessionize-import.py --site .`
(there's also `--id <embed-id>` as a one-off shorthand). The file is read
with Python's standard library; nothing to install.

## From a spreadsheet

Not on Sessionize? Plan in **one workbook with a tab per content type**: Speakers, Venues, Sponsors, Organizers, Events (any subset works). Generate a starter to see the expected columns:

```bash
python3 scripts/spreadsheet-import.py --make-sample community.xlsx
python3 scripts/spreadsheet-import.py --xlsx community.xlsx --site .
```

A ready-made sample also ships at `scripts/sample-community.xlsx`. The **Events tab cross-references the other tabs by name**: a Venue cell matching a Venues row becomes a `venueRef` (inheriting the venue's address and arrival notes), and comma-separated speaker names become `speakers` references; names that match nothing fall back to the plain-text fields. Check-in instructions, arrival notes, RSVP links and tags are all columns.

Prefer CSV? Export each tab as `<tab>.csv` into a folder and run with `--csv-dir folder/`.

{{% fw "hugo" %}}
The Sponsors tab writes a ready-made `/sponsors/` section using the [directory pattern](/docs/content-model/).
{{% /fw %}}

{{% fw "astro" %}}
The Sponsors tab is skipped for Astro sites (sponsors use a Hugo-side directory pattern); everything else imports identically into `src/content/`.
{{% /fw %}}

## For AI agents

The importers are the intended path for bulk content: both repos' `AGENTS.md` instruct agents to run them instead of hand-writing files. Point your agent at the Sessionize endpoint or the workbook and the site directory, and review the diff it produces.

{{% callout tone="tip" title="Other sources" %}}
pretalx exposes a public API for published schedules, and the importers' fetch-map-emit structure is easy to copy for it (or Meetup, or Luma) in your own site.
{{% /callout %}}
