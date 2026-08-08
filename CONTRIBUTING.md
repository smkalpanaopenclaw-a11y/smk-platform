# Contributing to SM Kelponaukenclaw Platform

We welcome contributions! Please follow these steps:

## Development Environment Setup

1. Fork the repository
2. Clone your fork (`git clone https://github.com/YOUR_USERNAME/smk-platform.git`)
3. Create a virtual environment:
   ```bash
   python -m venv .venv
   source .venv/bin/activate  # On Windows: .venv\Scripts\activate
   ```
4. Install dependencies:
   ```bash
   pip install -r requirements-dev.txt
   ```

## Branching Strategy

We follow a **GitHub Flow + Release Strategy**:

- `main` — production-ready code only
- Feature branches (`feature/JIRA-123-short-description`)
- Hotfix branches (`hotfix/issue-name`)

Every pull request must:
1. Pass all CI checks
2. Have at least one code review
3. Include tests for new functionality
4. Update documentation if needed

## Code Standards

- Follow PEP 8 (Python) or relevant language conventions
- Write descriptive commit messages using conventional commits:
  ```
  feat(auth): add login endpoint
  fix(api): handle null pointer exception
  docs(readme): update setup instructions
  ```

## Pull Requests

1. Open draft PR early for visibility
2. Mark as ready for review when complete
3. Address all review comments
4. Squash commits before merging

## Testing

Run tests with:
```bash
make test
```

Coverage must remain above 80%.

## Code of Conduct

See [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for details.

## Questions?

Join our community Discord: [discord.gg/kelponaukenclaw](https://discord.gg/kelponaukenclaw)
Or open an issue with the `question` label.
