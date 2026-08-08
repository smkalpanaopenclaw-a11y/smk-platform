# Makefile for SM Kelponaukenclaw Platform

.PHONY: help install dev test lint format deploy-staging deploy-prod clean

help:
	@echo "Available targets:"
	@echo "  install       - Install all dependencies"
	@echo "  dev           - Start local development server"
	@echo "  test          - Run test suite"
	@echo "  lint          - Run linting checks"
	@echo "  format        - Format code"
	@echo "  deploy-staging - Deploy to staging"
	@echo "  deploy-prod   - Deploy to production"
	@echo "  clean         - Remove generated files"

install:
	pip install -r requirements-dev.txt

dev:
	python -m app

test:
	pytest tests/ --cov=src/ --cov-report=term-missing

lint:
	ruff check src/
	mypy src/

format:
	black src/
	ruff format src/

deploy-staging:
	@echo "Deploying to staging..."
	git push origin main
	@echo "Staging deployment triggered"

deploy-prod:
	@echo "Deploying to production..."
	git tag $(shell date +%Y%m%d%H%M%S)
	git push origin --tags
	@echo "Production deployment triggered"

clean:
	find . -type d -name '__pycache__' -exec rm -rf {} +
	find . -type f -name '*.pyc' -delete
	rm -rf .pytest_cache .coverage htmlcov .mypy_cache
