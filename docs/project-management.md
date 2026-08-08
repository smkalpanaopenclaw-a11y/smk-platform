# SMK Platform Project Board

## Labels

| Label | Color | Description |
|-------|-------|-------------|
| `bug` | #e11d21 | Something isn't working |
| `enhancement` | #34d058 | New feature or improvement |
| `documentation` | #0075ca | Documentation improvements |
| `question` | #1d7bf4 | Further information requested |
| `security` | #e11d21 | Security-related issues |
| `performance` | #e11d21 | Performance improvements |
| `refactor` | #f7c600 | Code refactoring |
| `tests` | #0684ff | Test-related changes |
| `in-progress` | #f7c600 | Currently being worked on |
| `blocked` | #e11d21 | Waiting on something external |

## Milestones

| Milestone | Target Date | Purpose |
|-----------|-------------|---------|
| `v0.1.0` | YYYY-MM-DD | MVP release |
| `v0.2.0` | YYYY-MM-DD | Feature enhancements |
| `v1.0.0` | YYYY-MM-DD | First stable release |

## Kanban Board Columns

1. **Backlog** — Ideas and planned work not yet prioritized
2. **To Do** — Prioritized work ready to start
3. **In Progress** — Work actively being done
4. **Code Review** — PR awaiting review
5. **Testing** — PR passed review, undergoing testing
6. **Done** — Merged and deployed

## Automation Rules (via GitHub Actions)

- When PR is opened: Add `needs-review` label
- When PR is merged: Remove `in-progress` label
- When issue is closed: Move to Done column
