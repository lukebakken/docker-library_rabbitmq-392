.PHONY: up down restart import

up:
	docker compose up --detach

down:
	docker compose down

restart:
	docker compose down
	docker compose up

import:
	docker compose cp $(CURDIR)/definitions.json rabbitmq:/var/lib/rabbitmq
	docker compose exec rabbitmq rabbitmqctl import_definitions /var/lib/rabbitmq/definitions.json
