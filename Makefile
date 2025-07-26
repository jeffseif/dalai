.PHONY: run
run:
	$(MAKE) down
	docker compose up -d
	docker compose logs -f


.PHONY: down
down:
	docker compose down


.PHONY: build
build:
	docker compose build
	docker compose run dalai npx dalai alpaca install 7B
