include .env

setup:
	@export APP_URL=${APP_URL}; \
	export NGINX_HOST_HTTP_PORT=${NGINX_HOST_HTTP_PORT}; \

start:
	@echo "Iniciando projeto..."
	@echo "Copiando .env.example do projeto..."
	@cp .env.example .env
	@echo "Iniciando container..."
	@docker-compose up -d --build
	@echo "Instalando composer..."
	@docker-compose exec app composer install
	@echo "Gerando chave do projeto..."
	@docker-compose exec app php artisan key:generate
	@echo "Rodando migrate..."
	@docker-compose exec app php artisan migrate
	@echo "Comando 'make start' executado com sucesso."
	@echo "URL ${APP_URL}:${NGINX_HOST_HTTP_PORT}"

shell-app:
	@docker-compose exec app bash

stop:
	@docker-compose down
