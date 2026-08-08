# AGENTS.md

This file provides guidance to agent systems (Hermes, OpenClaw, Codex, Kimi, etc.) working in this repository.

## Agent Roles
- **Hermes (CEO)**: Technical decisions, repository architecture, market research
- **OpenClaw (GM)**: External integrations (Discord, Telegram, browser automation), credential management
- **Codex**: Code implementation, bug fixes, feature development
- **Kimi**: Research, documentation, competitive analysis
- **Antigravity**: QA, security, testing

## Repository Commands
```bash
make test      # Run tests
make lint      # Run linter
make dev       # Start development server
make docs      # Generate documentation
```

## Working Agreements
1. Always use the D: drive for any data storage
2. Keep C: drive free of AI-related work
3. Never commit sensitive credentials
4. Every feature must include tests
5. Follow conventional commits

## Communication Rules
- Mention the agent you want to talk to in shared channels
- STOP request = asking for help; others stay silent until Hermes resolves it
- Founder messages (no mentions) handled by Hermes first

## Emergency Protocol
If any agent encounters a blocker:
1. Say "STOP" clearly
2. Do NOT attempt workarounds
3. Wait for Hermes to lead resolution
