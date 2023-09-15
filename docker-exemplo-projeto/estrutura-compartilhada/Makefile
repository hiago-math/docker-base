include .env

setup:
	@export APP_URL=${APP_URL}; \
	@export APP_NAME=${APP_NAME}; \
	export NGINX_HOST_HTTP_PORT=${NGINX_HOST_HTTP_PORT}; \

start:
	@echo "Iniciando projeto..."
	@echo "Copiando .env.example do projeto..."
	@cp .env.example .env
	@echo "Iniciando container..."
	@docker-compose up -d
	@echo "Instalando composer..."
	@bash docker/init-docker-dev.sh
	@docker exec ms-${APP_NAME} composer install
	@echo "Gerando chave do projeto..."
	@docker exec ms-${APP_NAME} php artisan key:generate
	@echo "Rodando migrate..."
	@docker exec ms-${APP_NAME} php artisan migrate
	@echo "Comando 'make start' executado com sucesso."
	@echo "URL API ${APP_URL}:${NGINX_HOST_HTTP_PORT}/api"
	@echo "URL WEB ${APP_URL}:${NGINX_HOST_HTTP_PORT}"

shell-app:
	@sudo chmod -R 777 ./
	@docker exec ms-${APP_NAME} bash

stop:
	@docker-compose down
