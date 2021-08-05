up:
	docker-compose up

down:
	docker-compose down

build:
	docker exec -it {{cookiecutter.project_slug}}_mkdocs mkdocs build

deploy: build
	rsync -avzp --delete site/ xstudios@{{cookiecutter.domain}}:~/{{cookiecutter.project_slug}}/site
