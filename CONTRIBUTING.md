# Contributing to SM Kelponaukenclaw Platform

Thanks for your interest in contributing! This project follows a **build-first, prove-it, then package** philosophy.

## Getting Started

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/YOUR_USERNAME/smk-platform.git
   cd smk-platform
   ```
3. Install dependencies:
   ```bash
   make install
   ```
4. Run tests:
   ```bash
   make test
   ```

## Branching Strategy
- `main` — Production-ready code (protected)
- `develop` — Integration branch for features
- `feature/JIRA-123-description` — New features
- `hotfix/JIRA-123-description` — Urgent fixes

## Commit Convention
Follow [Conventional Commits](https://www.conventionalcommits.org/):
```
feat(agent): add email monitoring capability
fix(ci): resolve test timeout issue
docs(readme): update API documentation
```

## Pull Requests
1. Open PR against `develop` for features, `main` for hotfixes
2. Ensure all CI checks pass
3. Get at least one approval
4. Squash and merge

## Code Standards
- Python 3.11+
- Follow PEP 8
- Write tests for all new functionality
- Document public interfaces

## Questions?
Join our [Discord](https://discord.gg/agency) or open an issue with the `question` label.
