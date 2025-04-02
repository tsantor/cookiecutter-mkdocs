# Cookiecutter MkDocs

## Quickstart

Install the latest Cookiecutter if you haven't installed it yet (this requires Cookiecutter 1.4.0 or higher):

```bash
python3 -m pip install -U cookiecutter
```

Generate a MkDocs project:

```bash
cookiecutter https://github.com/tsantor/cookiecutter-mkdocs.git

# cd into the project dir
make env
make install_editable
```

## Contributing
As a developer, it is assumed you have `docker`, `uv` and `make` installed.

```bash
make env
make install_editable
```

To get list of all available commands run `make`.

## Not Exactly What You Want?
This is what I want. _It might not be what you want_. If you have differences in your preferred setup, I encourage you to fork this to create your own version.
