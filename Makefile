.DEFAULT_GOAL:=help

.PHONY: dev
dev: ## Installs adapter in develop mode along with development dependencies
	@\
	pip install -e . -r dev-requirements.txt && pre-commit install

.PHONY: ubuntu-py311
ubuntu-py311: ## Builds and runs an Ubuntu Python 3.11 development container
	docker build -f docker_dev/ubuntu.Dockerfile -t dbt-bigquery-ubuntu-py311 .
	docker run --rm -it --name dbt-bigquery-ubuntu-py311 -v $(shell pwd):/opt/code dbt-bigquery-ubuntu-py311

.PHONY: ubuntu-py39
ubuntu-py39: ## Builds and runs an Ubuntu Python 3.9 development container
	docker build -f docker_dev/ubuntu.Dockerfile -t dbt-bigquery-ubuntu-py39 . --build-arg version=3.9
	docker run --rm -it --name dbt-bigquery-ubuntu-py39 -v $(shell pwd):/opt/code dbt-bigquery-ubuntu-py39

.PHONY: ubuntu-py38
ubuntu-py38: ## Builds and runs an Ubuntu Python 3.8 development container
	docker build -f docker_dev/ubuntu.Dockerfile -t dbt-bigquery-ubuntu-py38 . --build-arg version=3.8
	docker run --rm -it --name dbt-bigquery-ubuntu-py38 -v $(shell pwd):/opt/code dbt-bigquery-ubuntu-py38
