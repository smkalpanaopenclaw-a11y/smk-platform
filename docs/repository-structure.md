# Repository Structure

```
smk-platform/
├── .github/
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug_report.md
│   │   └── feature_request.md
│   ├── workflows/
│   │   ├── ci.yml              # CI: lint, test, build
│   │   ├── cd.yml              # CD: staging deploy
│   │   └── dependabot.yml      # Auto-update deps
│   ├── PULL_REQUEST_TEMPLATE.md
│   └── README.md
├── config/
│   ├── .env.example
│   └── README.md
├── docs/
│   ├── README.md              # Documentation index
│   ├── architecture.md        # Technical architecture
│   ├── getting-started.md     # Setup guide
│   └── contributing.md        # Dev guidelines
├── src/
│   ├── __init__.py
│   └── app.py                 # Main application
├── tests/
│   ├── __init__.py
│   └── test_basic.py          # Basic tests
├── AGENTS.md                  # Agent coordination rules
├── CLAUDE.md                  # Claude-specific guidance
├── CONTRIBUTING.md            # Community guidelines
├── CODE_OF_CONDUCT.md         # Code of conduct
├── CHANGELOG.md               # Changelog
├── LICENSE                    # MIT license
├── Makefile                   # Build automation
├── PLAN.md                    # Project plan
├── PLATFORM_PLAN.md           # Strategic plan
├── README.md                  # Project overview
├── pyproject.toml             # Project config
├── requirements.txt           # Runtime deps
└── requirements-dev.txt       # Dev deps
```
