# -----------------------------------------------------------------------------
# Generate help output when running just `make`
# -----------------------------------------------------------------------------
.DEFAULT_GOAL := help

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("%-20s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT

help:
	@python3 -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

.PHONY: build

PROJECT={{cookiecutter.project_slug}}_mkdocs

# -----------------------------------------------------------------------------
# Docker Development (if you have Docker installed)
# -----------------------------------------------------------------------------

up_build:  ## Build docker images
	docker compose up --build

up:  ## Docker up
	docker compose up

down:  # Docker down
	docker compose down

build:  ## Build docs
	docker exec -it ${PROJECT} mkdocs build

# -----------------------------------------------------------------------------
# Local Development (if you have UV installed)
# -----------------------------------------------------------------------------

env:  ## Create virtual environment (uses `uv`)
	uv venv

env_remove:  ## Remove virtual environment
	rm -rf .venv

env_from_scratch: env_remove env  ## Create environment from scratch

pip_install:  ## Install dependencies
	uv pip install .

mkdocs_serve: ## Serve docs for development
	mkdocs serve --dev-addr=0.0.0.0:8989

mkdocs_build:  ## Build docs
	mkdocs build

# -----------------------------------------------------------------------------
# Optimize images
# -----------------------------------------------------------------------------

optimize_pngs:  ## Optimize PNGs
	find . -name 'docs/img/*.png' -exec pngquant 64 --ext .png -f --skip-if-larger {} \;

optimize_jpgs:  ## Optimize JPGs
	open -a ImageOptim docs/img

# -----------------------------------------------------------------------------
# Deploy
# -----------------------------------------------------------------------------

deploy:  ## Deploy to server
	bash deploy.sh

# deploy: build  ## deploy to server
# 	rsync -avzp --delete site/ xstudios@{{cookiecutter.domain}}:~/{{cookiecutter.project_slug}}/site
