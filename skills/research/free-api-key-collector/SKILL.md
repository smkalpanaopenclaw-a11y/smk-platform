---
name: free-api-key-collector
description: Use to discover free API providers and curated lists.
version: 1.0.0
author: Hermes Agent
license: MIT
tags: [research, api, free-tier, github]
metadata:
  hermes:
    tags: [research, api, free-tier, github]
    homepage: https://hermes-agent.nousresearch.com/docs
---

# Free API Key Collector

Class-level workflow for discovering and classifying free developer
services, API-key providers, and unified gateways.

## 1. Trigger Conditions

- User asks for free API keys or free developer services.
- User wants multi-provider / multi-model routing research.
- User asks about specific domains: Google Calendar, RAG, finance,
  translation, scraping, agent tools, or unified gateways.
- User asks for YouTube explainers or GitHub repos in this space.
- User asks to turn findings into a reusable skill/agent/preset/runbook.

## 2. Discovery Sources

Use all three in parallel when possible:

| Source | Best query pattern | Notes |
|---|---|---|
| GitHub topic | `https://github.com/topics/free-api` | High-signal curated repos; sort by stars |
| GitHub search | `free-api`, `free AI APIs`, `OpenRouter`, `RapidAPI free`, `free calendar api`, `free RAG api` | Use browser search first; fall back to `gh search repos` or direct REST after rate-limits |
| GitHub REST API | `https://api.github.com/repos/{owner}/{repo}` | Fast verification when search is rate-limited; no auth required for public repos |
| YouTube | `free api keys 2026`, `OpenRouter tutorial`, `free AI APIs`, `Google Calendar API key`, `RAG tutorial 2026` | Prefer recent uploads and high-view explainers |

## 3. Classification Buckets

Label every finding into exactly one bucket:

- `llm-gateway` — unified LLM routers like OpenRouter, LiteLLM, OpenRelay, Chat2API
- `calendar` — calendar data/scheduling APIs with free tiers
- `rag-tooling` — embeddings, vector DBs, retrieval stacks with free tiers
- `translation` — DeepL, LibreTranslate, etc.
- `finance` — free stock/crypto/FX APIs and quant tooling
- `agent-reach` — keyless agent/scraping tools
- `developer-list` — curated public API lists like public-api-lists

## 4. Verification Rules

- Verify repo existence via GitHub REST API before listing it:
  `https://api.github.com/repos/{owner}/{repo}`. This is faster and
  more reliable than browser search when rate-limited.
- For YouTube, verify title/channel/view count from the results page;
  do not fabricate view counts.
- GitHub web search hits secondary rate limits after ~5 queries; pivot
  to topic pages, direct REST API verification, or cached browser
  snapshots rather than retrying identical queries.
- If GitHub search returns 0 repositories, pivot to topic pages or
  broader keywords rather than retrying identical queries.
- Do not claim an org account exists under a user login unless
  `gh api /user/orgs` returns a non-empty array.

## 5. Output Shape

Return a concise markdown report with:

1. Relevant GitHub repos / accounts, one table with repo, bucket, and rationale
2. YouTube videos, one table with title/channel/views/relevance
3. Global trend snapshot, 3-6 bullets on what the landscape actually shows
4. Hardware/runtime fit verdict: note whether each source is self-hosted, cloud, or local-only
5. Optional next step: whether to clone repos into a local `agency-agents-main` folder and classify them

### Staging/provisioning mode

When the user wants keys staged for multiple agents, extend the report with:

1. Master source list: source name, bucket, key status, quota/notes, calculated days-of-runway, backup key status, blockers
2. Rotation plan: primary + backup per source, 24-hour rotation loop guidance
3. Provisioning status table: `created` / `pending` / `blocked` per source
4. Local-only credentials: minted locally, no external API calls, stored in env file
5. Blocker detail: exact blocker text, not silent skips

Use `references/quota-runway-template.md` for the standard table shape and rotation rules.

### Skill packaging mode

When the user wants reusable automation from the findings, extend the report with:

1. Gap analysis against 2-3 closest local peer skills
2. Proposed skill name, trigger phrases, and classification buckets
3. Full `SKILL.md` frontmatter + body outline
4. Optional scaffold: `references/`, `templates/`, `scripts/`
5. Install/activation instructions

Do not claim a skill is installed; installation only takes effect in a new
session.

## 6. Pitfalls

- “Free forever” usually means free tier with rate/card limits; classify as
  tiered, not unlimited.
- Browser-based GitHub search may rate-limit after ~5 rapid queries; use
  topic pages, direct REST API (`/repos/{owner}/{repo}`), or `gh search repos`
  instead.
- The `calendar-api` GitHub topic is dominated by client UI libraries
  (Android, Swift, React Native); filter aggressively for actual data/API
  providers by reading descriptions.
- YouTube mixes shorts, ads, and outdated content; prefer recent uploads and
  high-view long-form over clickbait shorts.
- Do not invent providers; only list sources observed during this session.
- Do not claim an org account exists under a user/personal login unless
  `gh api /user/orgs` returns a non-empty array.
- If the user already has a closely related skill, prefer extending it instead
  of creating a narrow duplicate.

## 7. Cross-Cutting Rule

This skill is additive. It does not modify `research-toolkit` behavior; it
covers the free-API/provider-rotation class of research that `research-toolkit`
does not govern.

## 8. Related Skills

- `autonomous-signup` — companion skill for browser-based account creation,
  login, and credential storage.
- `agent-creator` — companion agent that can scaffold subagents from skill specs.
  Note: this is user-owned under `C:\Users\Windows\.agents\skills\`; do not
  patch it directly. If it is missing expected behavior, recommend
  `hermes curator adopt agent-creator`.

## 9. Reference Files

- `references/free-api-research-2026-08-15-v2.md` — verified repo tables,
  session techniques, and rate-limit workarounds from the 2026-08-15 survey.
