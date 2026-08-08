# Architecture Overview

## Philosophy
We build and prove things on ourselves first, then package and sell them to businesses with zero digital footprint.

## Key Components

### 1. Agent Framework
- Modular architecture
- Plugin-based capabilities
- Async-first design

### 2. CI/CD Pipeline
- GitHub Actions for testing and deployment
- Multi-version Python testing
- Automated dependency updates

### 3. Storage Strategy
- All AI work on D: drive
- C: drive minimized
- Persistent configuration in D:/Hermes/Config

## Tech Stack
- **Language**: Python 3.11+
- **Testing**: pytest
- **Linting**: ruff, mypy
- **CI/CD**: GitHub Actions
- **Packaging**: setuptools

## Development Environment
See `.env.example` for required environment variables.
