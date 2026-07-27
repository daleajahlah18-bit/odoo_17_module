WEB_DB_NAME = odoo_development
DOCKER = docker
DOCKER_COMPOSE = $(DOCKER) compose
CONTAINER_ODOO = odoo
CONTAINER_DB = odoo-postgres

help:
	@echo "Available targets"
	@echo "  start       Start containers"
	@echo "  stop        Stop containers"
	@echo "  restart     Restart containers"
	@echo "  console     Odoo interactive shell"
	@echo "  psql        PostgreSQL interactive shell"
	@echo "  logs        View container logs"

start:
	$(DOCKER_COMPOSE) up -d

stop:
	$(DOCKER_COMPOSE) down

restart:
	$(DOCKER_COMPOSE) restart

console:
	$(DOCKER_COMPOSE) exec $(CONTAINER_ODOO) odoo shell -d $(WEB_DB_NAME)

psql:
	$(DOCKER_COMPOSE) exec $(CONTAINER_DB) psql -U odoo -d $(WEB_DB_NAME)

logs:
	$(DOCKER_COMPOSE) logs -f

.PHONY: help start stop restart console psql logs
