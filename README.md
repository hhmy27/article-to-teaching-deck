# article-to-teaching-deck

A Codex skill for turning article URLs or article text into standalone, teaching-first slide decks.

The skill is designed for decks that:
- teach the article without requiring the learner to read the original
- follow the user's conversation language by default
- favor progressive reveal, diagrams, timelines, and checks for understanding
- include source-location footers for factual claims
- work especially well for accessibility-first decks, including ADHD / reading-difficulty friendly formats

## Repo layout

```text
skills/
  article-to-teaching-deck/
    SKILL.md
    agents/
      openai.yaml
    references/
      deck-blueprint.md
```

## Install into Codex

If this repo is published at `hhmy27/article-to-teaching-deck`, install it with:

```bash
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo hhmy27/article-to-teaching-deck \
  --path skills/article-to-teaching-deck
```

Then restart Codex.

## Example prompt

```text
Use $article-to-teaching-deck to turn this article into a standalone teaching deck in Chinese with progressive reveal and source-location footers.
```

## Optional companion skills

If installed, these can improve chart-heavy slides:
- `chart-visualization`
- `infographic-creator`

## Development

Edit the files inside `article-to-teaching-deck/` and commit normally.


## npx skills install

This repo is also structured for the `skills` CLI. After publishing to GitHub, users can install it with:

```bash
npx skills add hhmy27/article-to-teaching-deck --skill article-to-teaching-deck
```

For Codex global install:

```bash
npx skills add hhmy27/article-to-teaching-deck --skill article-to-teaching-deck -a codex -g
```
