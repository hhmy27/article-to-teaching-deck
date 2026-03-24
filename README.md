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
article-to-teaching-deck/
  SKILL.md
  agents/
    openai.yaml
  references/
    deck-blueprint.md
```

## Install into Codex

If this repo is published at `YOUR_GITHUB_NAME/article-to-teaching-deck`, install it with:

```bash
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo YOUR_GITHUB_NAME/article-to-teaching-deck \
  --path article-to-teaching-deck
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
