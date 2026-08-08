# Branching Strategy

## Overview
This project follows a hybrid GitFlow + GitHub Flow approach.

## Branches

| Branch | Purpose | Protection |
|--------|---------|------------|
| `main` | Production-ready code | ✅ Required PR review, ✅ Required status checks, ✅ No force pushes |
| `develop` | Integration branch for features | ✅ Required status checks |
| `feature/*` | New features | Create PR to `develop` |
| `hotfix/*` | Urgent fixes to production | Create PR to both `main` and `develop` |
| `release/*` | Preparing for a new release | Create PR to both `main` and `develop` |

## Naming Convention
- `feature/JIRA-NUM-description`
- `bugfix/JIRA-NUM-description`
- `hotfix/JIRA-NUM-description`
- `release/vX.Y.Z`

## Merging
- Use squash-and-merge for feature branches
- Use merge commits for hotfix/release branches to preserve history
- Delete branch after merge
