# CLAUDE.md

This file provides guidance to Claude (and other coding agents) working in this repository.

## Project Overview
SM Kelponaukenclaw Platform — AI-first infrastructure for building and selling automation agents.

## Commands
```bash
make test      # pytest tests/
make lint      # ruff check src/
make dev       # python -m src.app
make docs      # mkdocs serve
```

## Architecture Notes
- Python 3.11+ primary language
- Async-first design
- Modular agent architecture
- Each capability is a separate plugin/module

## Coding Standards
- PEP 8 compliant
- Type hints required (mypy strict)
- Docstrings for all public functions
- 80% test coverage minimum
