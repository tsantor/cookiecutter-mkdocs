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

# -----------------------------------------------------------------------------

up:  ## docker up
	docker-compose up

down:  # docker down
	docker-compose down

build:  ## build docs
	docker exec -it {{cookiecutter.project_slug}}_mkdocs mkdocs build

deploy: build  ## deploy to server
	rsync -avzp --delete site/ xstudios@{{cookiecutter.domain}}:~/{{cookiecutter.project_slug}}/site
