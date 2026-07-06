+++
title = "Theming"
type = "docs"
weight = 40
eyebrow = "Docs"
lead = "How to re-brand the whole theme from one config block, and where to go deeper when you need to."
+++

{{< fwswitch >}}

## The one-block re-brand

Every colour, font and radius in the theme resolves through CSS custom properties (design tokens). The `brand` config block overrides the important ones at render time:

{{% fw "hugo" %}}
```toml
[params.brand]
  primary       = "#0f766e"   # the only line you *need*
  primaryHover  = "#0d5f59"
  primaryActive = "#0b4f4a"
  secondary     = "#0b4f4a"
  accent        = "#b45309"
  ink           = "#142a36"
  surfaceWash   = "#d7ece9"   # hero / section wash
  surfaceInk    = "#142a36"   # footer / dark bands
  fontSans      = "Inter, system-ui, sans-serif"
  fontDisplay   = "Quantico, Inter, sans-serif"
```
{{% /fw %}}

{{% fw "astro" %}}
```ts
export const BRAND: Record<string, string> = {
  primary: '#0f766e',        // the only line you *need*
  primaryHover: '#0d5f59',
  primaryActive: '#0b4f4a',
  secondary: '#0b4f4a',
  accent: '#b45309',
  ink: '#142a36',
  surfaceWash: '#d7ece9',    // hero / section wash
  surfaceInk: '#142a36',     // footer / dark bands
  fontSans: 'Inter, system-ui, sans-serif',
  fontDisplay: 'Quantico, Inter, sans-serif',
};
```
{{% /fw %}}

## Derived tints

Set `primary` and the theme computes coherent companions with `color-mix()`: the soft tint behind badges and tag hovers, and the light variant used on dark stat strips. That's why a one-line palette change doesn't leave stale pink accents behind.

## The four demos are the proof

[Rocky Cove Aquarium Club](/docs/demos/) (teal), Lucky Town Foodie Club (copper), KDrama Fan Club (indigo) and Truly Madly Riley (gold) run identical theme code, their entire visual difference is this one block. Diff any two demo configs to see exactly what a re-brand touches.

## Going deeper

- **Full palette surgery**: edit the token files (`tokens/colors.css` etc.); every component reads tokens, none hardcode colours.
- **Custom fonts**: point `fontSans`/`fontDisplay` at your faces and load them via `customCSS` (Hugo) or your own `<link>` (Astro).
- **Component CSS**: everything is plain, commented CSS with a stable `g-*` class API. Override any rule downstream; the class names are covered by the parity contract, so they won't churn between releases.

{{% callout tone="warn" title="Contrast check" %}}
If you pick a light primary (gold, yellow, pastel), darken it for `primary` and keep the bright version for `surfaceWash`, button text must stay readable. This site does exactly that with its gold.
{{% /callout %}}
