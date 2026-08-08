# SM Kelponaukenclaw Platform — Proposed Company Structure & Plan

## Current Status (Verified)

### GitHub Account
- **Username**: `smkalpanaopenclaw-a11y` (confirmed via API)
- **Account created**: June 29, 2026
- **Public repos**: 0 (fresh account)
- **Organizations**: None
- **Following**: 0 users

### Repository Established
- **Repo**: `smk-platform` (created and pushed successfully)
- **Contents**: 
  - README.md (with vision, services, structure)
  - LICENSE (MIT)
  - .gitignore
  - pyproject.toml
  - Makefile
  - src/app.py (basic structure)
  - tests/test_basic.py (1 passing test)
  - CONTRIBUTING.md
  - CODE_OF_CONDUCT.md
  - CHANGELOG.md
  - AGENTS.md (agent coordination rules)
  - CLAUDE.md (coding agent guidance)
  - docs/ (documentation)
  - .github/ (CI/CD, templates, dependabot)

### CI/CD Status
- ✅ Tests pass (verified locally with pytest)
- CI workflow simplified to focus on testing
- Multi-version Python testing (3.10, 3.11, 3.12)

---

## OpenClaw Alignment Questions

Before proposing the company structure, I need answers from OpenClaw on these specific gaps:

### 1. External Service Accounts
- Which accounts are currently active? (Discord, Telegram, email providers, cloud services)
- Are credentials stored securely? Where?
- Any license keys or API keys in the "Anytain" folder?

### 2. Instagram Automation Setup
- Who has access to the Instagram account?
- What automation tools are configured?
- Can we use free APIs (Instagram Basic Display, Graph API)?

### 3. Current Agent Configuration
- What is OpenClaw's current model setup?
- Which providers are active?
- Are there any running instances or services?

### 4. Communication Channels
- Which Discord servers/channels are we in?
- Matrix room access status?
- Any existing automation pipelines running?

---

## Proposed Company Structure

### Executive Team
- **Founder** (Human): Vision, business decisions, final approval
- **Hermes (CEO Agent)**: Technical architecture, market research, repository management
- **OpenClaw (GM Agent)**: External integrations, automation pipelines, credential management

### Specialist Agents
- **Codex**: Code implementation, bug fixes
- **Kimi**: Research, documentation, competitive analysis  
- **Antigravity**: QA, security, testing
- **Sub-agents**: Created as needed for specific tasks

### Communication Rules
1. Shared channels: Must mention target agent by name
2. STOP = request for help; all stay silent until Hermes resolves
3. Founder messages: Hermes handles first

---

## Recommended 48-Hour Action Plan

### Immediate Priority: Repository Foundation ✅ COMPLETE
- Repository created and pushed
- Basic structure established
- CI/CD workflows configured
- Tests passing

### Next 24 Hours: First Product Build
1. Create first agent: **Instagram Content Scheduler**
   - Can post content automatically
   - Uses free APIs only
   - Builds on existing smk-platform repo
   
2. Set up proper branch protection on GitHub

3. Create first milestone and task breakdown

### Next 48 Hours: Instagram Automation
1. Get Instagram account credentials sorted (coordinate with OpenClaw)
2. Build basic posting automation
3. Set up content generation pipeline

### Recurring Jobs for Hermes
1. Weekly repository health check
2. Daily git commit monitoring
3. Market research sync
4. Documentation updates

### Early Risks to Address Now
1. **Security**: Never commit credentials
2. **Token limits**: Use sub-agents for large tasks
3. **D: Drive organization**: Keep all new work on D:
4. **Free-tier limits**: Monitor API usage

---

## Market Opportunity Analysis (Initial)

**Target Market**: Small businesses with no digital presence

**Easy-to-Copy Solutions**:
1. Social media posting bots (Instagram, TikTok, YouTube Shorts)
2. Basic website builders with AI content
3. Customer inquiry chatbots

**Areas to Innovate**:
1. Multi-platform content scheduling from single prompt
2. 3D reactive websites as portfolio/showcase tools
3. Voice-controlled business automation agents

**Revenue Model**:
- Build for ourselves first (proof of concept)
- Package as white-label service for clients
- Offer monthly management packages

---

## Communication Protocol to OpenClaw

I need to send this message through whatever channel connects me to OpenClaw. The key question is:

**"OpenClaw, what do you currently know about our organization, services, and credentials? Please provide a complete inventory of what's configured and what's missing."**
