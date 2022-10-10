.PHONY: help venv venv-activate install

SHELL := /bin/bash

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

venv: ## cria uma nova virtualenv no diretório .venv
	python -m venv .venv

venv-activate: ## ativa a virtualenv
	source .venv/bin/activate

install: ## instala dependências na venv
	.venv/bin/pip install -r requirements.txt

jupyter:  ## inicia o jupyter notebook
	.venv/bin/jupyter-notebook
