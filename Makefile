.DEFAULT_GOAL := help
.PHONY: style install help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

target_dirs := tests coqpit


test:	## run tests.
	coverage run -m pytest && coverage report --show-missing

style:	## update code style.
	ruff format ${target_dirs}

install:	## install 👩‍✈️ Coqpit for development.
	pip install -e .
