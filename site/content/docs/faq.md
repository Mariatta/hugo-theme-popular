+++
title = "FAQ sections"
type = "docs"
weight = 66
eyebrow = "Docs"
lead = "A native, zero-JavaScript FAQ block for the questions newcomers actually ask, readable by people and by AI answer engines alike."
+++

## Why

First-timers have the same handful of questions: do I need experience, is it
free, how do I find the room. Answer them where people land. The FAQ block
also gives AI answer engines (ChatGPT, Perplexity, AI Overviews) clean
question → answer text to quote.

Note: classic FAQ **rich results** are not a goal. Google restricts them to
government and health sites, so don't expect snippets. The value is on-page
clarity and AI-friendliness.

## Authoring

{{% fw "hugo" %}}
```
## Common questions

{{</* faq */>}}
{{</* question q="Do I need experience?" open="true" */>}}
No, beginners are the point. Come as you are.
{{</* /question */>}}
{{</* question q="Is it free?" */>}}
Yes, always **free**.
{{</* /question */>}}
{{</* /faq */>}}
```
{{% /fw %}}

{{% fw "astro" %}}
```mdx
import FAQ from '../../components/FAQ.astro';
import FAQItem from '../../components/FAQItem.astro';

## Common questions

<FAQ>
  <FAQItem q="Do I need experience?" open>No, beginners are the point. Come as you are.</FAQItem>
  <FAQItem q="Is it free?">Yes, always **free**.</FAQItem>
</FAQ>
```
{{% /fw %}}

Answer bodies are markdown. `open` renders an item expanded; open the most
important one. Put a normal `## Common questions` heading above the block: the
FAQ doesn't emit its own. It renders native `<details>`, so it's accessible and
works with zero JavaScript.

## Writing good answers

- Ask questions the way people do: "Do I need a laptop?", not "Equipment".
- Answer in the first sentence, elaborate after.
- Keep answers self-contained, an AI agent will quote them without context.

A good starter set: what is this, who is it for, do I need experience, is it
free, can I just watch, how do I find the room.
