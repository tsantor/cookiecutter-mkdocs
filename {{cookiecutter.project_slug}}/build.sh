#!/usr/bin/env bash

docker exec -it {{cookiecutter.project_slug}}_mkdocs mkdocs build
rsync -avzp --delete site/ xstudios@{{cookiecutter.domain}}:~/{{cookiecutter.project_slug}}/site
