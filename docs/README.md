# SM Kelponaukenclaw Platform — Project Structure

## Directory Layout
```
smk-platform/
├── README.md              # Project overview
├── LICENSE                # MIT License
├── .gitignore             # Environment + OS ignore rules
├── requirements.txt       # Runtime dependencies
├── requirements-dev.txt   # Dev/test dependencies
├── pyproject.toml         # Tool configs (black, ruff, mypy)
├── Makefile               # Automation recipes
├── CHANGELOG.md           # Version history
├── CONTRIBUTING.md        # How to contribute
├── CODE_OF_CONDUCT.md     # Behavioral standards
│
├── src/                   # Source code
│   └── __init__.py
│   └── app.py
│
├── tests/                 # Unit/integration tests
│   └── __init__.py
│
├── docs/                  # Documentation
│   └── README.md
│
└── .github/               # GitHub-specific config
    ├── workflows/         # CI/CD workflows
    ├── ISSUE_TEMPLATE/     # Issue templates
    └── dependabot.yml     # Automated dependency updates
```

## Conventions
- All source code lives under `src/`
- Tests live under `tests/` and mirror source structure
- Each module should have its own test file (`test_module.py`)
- Keep docs updated with new features in `docs/`
