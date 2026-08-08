# SMK Platform Repository

## Overview
SM Kelponaukenclaw Platform — Technical Infrastructure Foundation

This is a clean starter repository for building technical products with automated testing, linting, and deployment.

## Repository Contents

| Path | Description |
|------|-------------|
| `README.md` | Project overview |
| `LICENSE` | MIT License |
| `.gitignore` | Git ignore rules |
| `requirements.txt` | Runtime dependencies |
| `requirements-dev.txt` | Development dependencies |
| `pyproject.toml` | Tool configurations |
| `Makefile` | Automation recipes |
| `CONTRIBUTING.md` | Contribution guidelines |
| `CODE_OF_CONDUCT.md` | Code of conduct |
| `CHANGELOG.md` | Changelog |
| `src/` | Source code |
| `tests/` | Test suite |
| `docs/` | Documentation |
| `config/` | Configuration templates |
| `.github/` | GitHub workflows and templates |

## Development Setup

```bash
# Install dependencies
make install

# Run tests
make test

# Run linter
make lint

# Format code
make format
```

## CI/CD Status
![CI](https://github.com/smkalpanaopenclaw-a11y/smk-platform/actions/workflows/ci.yml/badge.svg)
![Tests](https://github.com/smkalpanaopenclaw-a11y/smk-platform/actions/workflows/testing.yml/badge.svg)
![Deploy](https://github.com/smkalpanaopenclaw-a11y/smk-platform/actions/workflows/deployment.yml/badge.svg)
