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

## Gallery

A photo grid for recaps: no JavaScript, no lightbox (each photo links to its full-size image, the deliberate [non-feature](/docs/beyond-meetups/#deliberate-non-features)). `alt` is **required**, a missing `alt` fails the build with a clear message, which is how the image-alt check stays green by construction.

{{</* gallery */>}}
  {{</* photo src="images/recap-1.jpg" alt="Attendees around the demo table" caption="Show & tell" */>}}
  {{</* photo src="images/recap-2.jpg" alt="A speaker mid-talk" */>}}
{{</* /gallery */>}}

## Pull-quote

A styled blockquote with optional attribution, for a testimonial in a recap or on the home page. Use the `{{%/* */%}}` form so the quote renders as Markdown.

{{%/* pullquote cite="A happy member" */%}}The best Tuesday of my month.{{%/* /pullquote */%}}

{{< example >}}
{{% pullquote cite="A happy member" %}}The best Tuesday of my month.{{% /pullquote %}}
{{< /example >}}

### Recap posts

A recap is just a blog post that uses these two: tag it `recap`, open with a line linking back to the event, drop in a `gallery` and a `pullquote`, and you have social proof for everyone who did not make it. Low effort, and it is exactly the evidence lurkers look for. The KDrama demo's "OST karaoke night in photos" is a worked example.

## Free interactive behaviour

These ship as small vanilla-JS files, no framework runtime:

- **Blog tag filter**: pill buttons above the post grid
- **Scroll-spy TOC**: on all docs pages
- **Checklist persistence**: see above
- **Mobile nav**: hamburger below 920px
