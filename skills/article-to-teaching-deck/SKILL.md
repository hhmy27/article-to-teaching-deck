---
name: article-to-teaching-deck
description: Transform article URLs or article text into a teaching-first slide deck that helps a learner understand the core thesis, structure, timeline, causal chain, and key takeaways. Use when Codex needs to read a long-form article, distill it into an interactive presentation, generate Slidev or another slide format, attach source-location footers for factual claims, or end with review questions and extension prompts.
---

# Article To Teaching Deck

Turn a source article into a compact lesson, not a companion summary. The deck must stand on its own even if the learner never opens the article.

## Quick Start

1. Obtain the article content from the provided URL or from user-supplied text.
2. Extract the article's thesis, structure, evidence, timeline, and vocabulary.
3. Detect the output language from the user's current conversation language unless the user explicitly asks for a different language.
4. Rebuild the content as a standalone lesson that a first-time reader can understand without the article.
5. Build a teaching outline before writing slides.
6. Generate the deck in `Slidev` markdown unless the user explicitly asks for another format.
7. Start a local preview after generating the deck whenever the user would benefit from opening it directly.
8. Add footer-only source locators for factual slides so the learner can trace each idea back to the article.
9. End with recap, questions, and transfer prompts.

Read `references/deck-blueprint.md` before outlining if you need the default teaching flow.

## Workflow

### 1. Ingest the article

- Open the URL with the available browsing or page-extraction tools. If the page is blocked, ask the user for the article text.
- Capture the metadata that matters for teaching: title, author, publication date, section headings, and any explicit timeline markers.
- Inspect whether the article contains original figures, charts, tables, screenshots, or other embedded visuals.
- Preserve article structure while reading. Section boundaries are useful later for source locators.

### 2. Build a teachable mental model

Extract and write down:

- the single-sentence core thesis
- the 3-6 supporting ideas that make the thesis true
- the article's structure: sequence, comparison, argument, case study, or timeline
- key entities: people, organizations, systems, places, dates
- terms that deserve definition before the learner can follow the rest
- any causal chain, process, or chronological arc

Do not start slide writing until this model is clear.

### 3. Plan the lesson

Prefer a deck that can be consumed in 5-12 minutes.

- Match the slide language to the user's conversation language, not the article language.
- If the user is speaking Chinese about an English article, produce a Chinese deck.
- Only preserve source-language wording for proper nouns, product names, or short terms that would become less clear if translated.
- If the user explicitly asks for bilingual output, make that a deliberate exception rather than the default.
- Assume the learner has not read the article.
- State conclusions before background.
- Still provide enough context so the learner knows who wrote the piece, what kind of article it is, and why the source is worth attention.
- Explain concepts, not just article structure.
- Start with orientation: what this article is about, why it matters, and what the learner will be able to do after the deck.
- Reveal the logic progressively instead of putting the whole summary on one slide.
- Use interaction deliberately: pause slides, stepwise reveals, mini-checks, and compare-before-answer moments.
- When the article includes meaningful original figures or tables, give each important one its own slide instead of squeezing it into a text-heavy page.
- Include a timeline when the article has dates, phases, or turning points.
- Include a concept map or process slide when the article explains mechanisms.
- Keep each slide focused on one teaching job.

Use the sequence in `references/deck-blueprint.md` unless the article clearly needs a different order.

### 4. Generate the deck

Default to `Slidev` markdown because it supports:

- incremental reveals
- presenter-friendly notes
- embedded Mermaid diagrams
- simple quiz/checkpoint interactions
- reusable layouts and footers

If the user asks for another output, adapt the same teaching structure to that format. Keep the content architecture stable even if the rendering tool changes.

If chart-heavy slides would benefit from stronger visuals and optional companion skills are installed:

- use `$chart-visualization` for cleaner chart generation when standard Mermaid would be too weak or cramped
- use `$infographic-creator` when a hand-drawn or infographic-style visual would teach the idea better than a plain chart
- prefer those skills selectively, not on every slide
- keep the visual simple and readable; teaching clarity matters more than decoration

After generating a Slidev deck:

- treat deck generation and preview launch as one workflow, not two unrelated tasks
- if the user wants to see the result, start a local preview and return the localhost URL
- use `scripts/start_slidev_preview.sh <deck-path> [port]` when it fits the environment
- if Slidev is not installed yet, install `@slidev/cli` and `@slidev/theme-default` in the working directory before launching, asking for approval when network or sandbox rules require it
- prefer a predictable port such as `3032`, but fall back to another free port if needed
- if a preview is already running for that port, return the existing URL instead of starting duplicates

When writing slides:

- write in the user's language by default
- make the deck understandable without the article open
- prefer short teaching language over article-like prose
- use conclusion-first phrasing
- use very short lines; most bullets should fit on one line
- avoid dense paragraphs entirely
- translate dense paragraphs into bullets, diagrams, timelines, and contrasts
- define jargon before using it in later slides
- surface "why this matters" early
- end major sections with a quick learner check
- avoid making every slide a wall of conclusions
- whenever possible, show an observation, scene, example, or contrast first, then reveal the takeaway with clicks
- use Slidev interaction features such as `v-click`, `v-clicks`, and staged diagrams to create a sense of discovery
- on the cover or early context slide, include source credibility: author, role, publication, and why the experience matters
- do not state obvious meta-points such as "you do not need to read the original article" unless the user explicitly wants that wording on-slide
- if using original article visuals, size them conservatively so the whole image fits on screen without overflow
- prefer giving an original visual a dedicated page with a short explainer and click-revealed takeaway

When the user asks for accessibility for ADHD or reading difficulty:

- favor more slides over denser slides
- use one core point per slide
- keep titles concrete and question-driven
- minimize on-screen text load
- prefer simple diagrams over prose blocks
- include explicit action steps, not just interpretation
- keep a rhythm of: notice -> interpret -> conclude
- do not remove necessary context; reduce reading burden without removing the reason a claim matters

### 5. Attach source locators

For factual or interpretive claims grounded in the article, add a footer with a source locator only. Do not paste long quotes into the footer.

Good locator patterns:

- `Source: Intro, para 3`
- `Source: "Why now" section, paras 2-4`
- `Source: Timeline section, 2019 milestone`
- `Source: Conclusion`

If paragraph numbers are not easy to determine, use the nearest stable locator available:

- section heading
- subheading
- bullet label
- figure caption
- date marker

Footers should help the user audit the claim without cluttering the slide.

### 6. Finish with retention and transfer

Always close with teaching reinforcement:

- one recap slide with the article's core idea and 3-5 anchor takeaways
- 3-6 questions that check understanding, not memorization only
- 2-4 extension prompts that connect the article to broader implications, adjacent concepts, or open debates

If appropriate, include answer notes or facilitator notes after each question.

## Slide Design Rules

- Teach one idea per slide.
- Keep most slides under 35-45 words of visible text, and go shorter when possible.
- Prefer diagrams, timelines, tables, and staged reveals to dense bullet walls.
- Make titles instructional, such as `Why the platform shifted`, not generic titles like `Background`.
- Separate `fact`, `interpretation`, and `open question` when the article mixes them.
- If the article is argumentative, include at least one slide on assumptions or limitations.

If the user asks for a structured accessibility-first deck, use this default page flow:

1. cover page
2. hook question page
3. core conclusion page
4. one or more breakdown pages with fixed short-bullet structure
5. example page
6. action guide page
7. reflection questions page
8. one-sentence summary page

## Output Expectations

Unless the user says otherwise, produce:

1. a short analysis block or notes section with the thesis, audience, and teaching strategy
2. the finished Slidev deck file
3. clear placeholders for images or diagrams only when they materially improve understanding

If the article language and user language differ, keep the deck in the user language and keep source locators in a form that still maps cleanly back to the original article structure.

If you create files, use obvious names such as `article-teaching-deck.md` or a slug derived from the article title.

## Quality Bar

Before finishing, verify that the deck:

- teaches the article's central idea in under two minutes
- preserves the original argument's structure
- includes source locators for knowledge-bearing slides
- contains at least one interaction pattern beyond static bullets
- ends with questions that test conceptual understanding
