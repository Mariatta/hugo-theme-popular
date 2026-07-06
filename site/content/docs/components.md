+++
title = "Components & shortcodes"
type = "docs"
weight = 50
eyebrow = "Docs"
lead = "The building blocks you use inside your content, and the interactive bits that come free."
+++

{{< fwswitch >}}

## Callout

Info, tip and warning boxes with an optional title.

{{% fw "hugo" %}}
```markdown
{{%/* callout tone="tip" title="Two-deep rule" */%}}
Aim for **two** organizers at every event.
{{%/* /callout */%}}
```
{{% /fw %}}

{{% fw "astro" %}}
```mdx
import Callout from '../../components/Callout.astro';

<Callout tone="tip" title="Two-deep rule">
  Aim for **two** organizers at every event.
</Callout>
```
{{% /fw %}}

{{< example >}}
{{% callout tone="tip" title="Two-deep rule" %}}
Aim for **two** organizers at every event.
{{% /callout %}}
{{< /example >}}

## Checklist (persistent)

One item per line / array entry. Progress is saved in the visitor's browser (`localStorage`), so organizers can close the tab mid-runbook and resume. The `key`/`id` must be unique across the site.

{{% fw "hugo" %}}
```markdown
{{%/* checklist key="rb-venue" */%}}
Shortlist 2–3 venues
Confirm step-free access
{{%/* /checklist */%}}
```
{{% /fw %}}

{{% fw "astro" %}}
```mdx
import Checklist from '../../components/Checklist.astro';

<Checklist id="rb-venue" items={[
  'Shortlist 2–3 venues',
  'Confirm step-free access',
]} />
```
{{% /fw %}}

{{< example >}}
{{% checklist key="rb-venue" %}}
Shortlist 2–3 venues
Confirm step-free access
{{% /checklist %}}
{{< /example >}}

## Buttons & badges

{{% fw "hugo" %}}
```markdown
{{</* button url="https://example.com/rsvp" label="RSVP" variant="primary" icon="fa-solid fa-calendar" */>}}
{{%/* badge tone="success" soft="true" */%}}Confirmed{{%/* /badge */%}}
```
Variants: `primary` · `secondary` · `outline` · `ghost` · `dark`; sizes `sm` / `lg`.
{{% /fw %}}

{{% fw "astro" %}}
Use the CSS classes directly, they're part of the theme's stylesheet:
```html
<a class="g-btn g-btn--primary" href="https://example.com/rsvp">RSVP</a>
<span class="g-badge g-badge--success g-badge--soft">Confirmed</span>
```
{{% /fw %}}

{{< example >}}
{{< button url="https://example.com/rsvp" label="RSVP" variant="primary" icon="fa-solid fa-calendar" >}}
{{% badge tone="success" soft="true" %}}Confirmed{{% /badge %}}
{{< /example >}}

## Persona

A bio card with a portrait, used for speakers and members, the same card that powers author boxes.

## Free interactive behaviour

These ship as small vanilla-JS files, no framework runtime:

- **Blog tag filter**: pill buttons above the post grid
- **Scroll-spy TOC**: on all docs pages
- **Checklist persistence**: see above
- **Mobile nav**: hamburger below 920px
