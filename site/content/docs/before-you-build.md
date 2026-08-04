+++
title = "Before you build"
type = "docs"
weight = 5
eyebrow = "Docs"
lead = "A community site is a set of decisions before it is a set of files. Make the calls here, then install: the setup wizard turns your answers into config."
+++

Popular ships a setup wizard that writes your config, a code-of-conduct seed
page, and a `DECISIONS.md` audit trail from a short interview. It works best
when you have already thought about the questions below, so this page is that
interview on paper.

Everything here is generated from the same schema the wizard reads, so the two
can never disagree. This checklist ticks and remembers your progress as you
decide over days, that is the theme's persistent-checklist feature, running on
the theme's own docs before you have installed anything.

{{< setup-worksheet >}}

Nothing here is a gate. Skip every question and the wizard still produces a
clean starter config you can grow into. The decisions in the first group have no
default because they are judgement calls, not settings: the wizard records
whatever you decide (or that you have not yet) so the reasoning outlives you.

## When you're ready

{{< fwswitch >}}

Install the theme, then run the wizard (or fill the config in by hand). Your
answers land in one file:

{{% fw "hugo" %}}
`hugo.toml`, under `[params]`. Run the wizard with
`python3 scripts/setup.py`, or edit the file directly, the
[configuration reference](/docs/configuration/) documents every key.
{{% /fw %}}

{{% fw "astro" %}}
`src/config.ts`. Run the wizard with `python3 scripts/setup.py`, or edit the
file directly, the [configuration reference](/docs/configuration/) documents
every export.
{{% /fw %}}

Next: **[Quick start](/docs/quick-start/)** walks through installing, starting
from a demo, and deploying.
