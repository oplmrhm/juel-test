.PHONY: help install run dev-install clean test docker-build docker-run docker-stop format lint

help:
	@echo "Available commands:"
	@echo "  install        Setup virtual environment and install dependencies"
	@echo "  run            Run the application locally"
	@echo "  dev-install    Install development dependencies (e.g., linters, formatters)"
	@echo "  clean          Clean up temporary files (e.g., __pycache__, venv)"
	@echo "  test           Run tests (not implemented yet)"
	@echo "  docker-build   Build Docker image (Dockerfile not created yet)"
	@echo "  docker-run     Run with docker-compose (docker-compose.yml not created yet)"
	@echo "  docker-stop    Stop docker-compose services"
	@echo "  format         Format code (e.g., with black - not configured yet)"
	@echo "  lint           Run linting checks (e.g., with flake8 - not configured yet)"

install:
	@echo "Setting up virtual environment and installing dependencies..."
	python3 -m venv venv
	@echo "Virtual environment 'venv' created."
	@echo "To activate, run: source venv/bin/activate"
	./venv/bin/pip install -r requirements.txt
	@echo "Dependencies installed."
	@echo "Remember to create a .env file from .env.example and add your API keys."

run:
	@echo "Starting the FastAPI application..."
	@echo "Make sure your virtual environment is active or run 'source venv/bin/activate'"
	./venv/bin/uvicorn main:app --reload --host 0.0.0.0 --port 8000

# Placeholder for future dev dependencies
dev-install:
	@echo "Installing development dependencies..."
	# ./venv/bin/pip install black flake8 pytest
	@echo "Development dependencies (like black, flake8, pytest) can be added here."

clean:
	@echo "Cleaning up..."
	rm -rf venv
	rm -rf .pytest_cache
	rm -rf .mypy_cache
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	@echo "Cleaned."

test:
	@echo "Tests not implemented yet."
	# ./venv/bin/pytest

# Docker related commands will need Dockerfile and docker-compose.yml
docker-build:
	@echo "Dockerfile not created yet. Cannot build image."
	# docker build -t qagent-dev .

docker-run:
	@echo "docker-compose.yml not created yet. Cannot run with Docker Compose."
	# docker-compose up

docker-stop:
	@echo "docker-compose.yml not created yet. Cannot stop services."
	# docker-compose down

format:
	@echo "Code formatting (e.g., black) not configured yet."
	# ./venv/bin/black .

lint:
	@echo "Linting (e.g., flake8) not configured yet."
	# ./venv/bin/flake8 .
