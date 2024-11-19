FIG=docker-compose
HAS_DOCKER:=$(shell command -v $(FIG) 2> /dev/null)

ifdef HAS_DOCKER
  EXEC=$(FIG) exec app
  EXEC_DB=$(FIG) exec db
else
  EXEC=
  EXEC_DB=
endif

# Symfony command
CONSOLE=php bin/console

# Targets

check:
	$(EXEC) composer check

csfix:
	$(EXEC) composer fix

start:
	docker-compose up

start.demon:
	docker-compose up -d

stop:
	docker-compose down

restart: stop start.demon

update:
	$(EXEC) composer install

entity:
	$(EXEC) $(CONSOLE) make:entity

migration:
	$(EXEC) $(CONSOLE) make:migration

migrate:
	$(EXEC) $(CONSOLE) doctrine:migration:migrate

require:
	$(EXEC) composer require $(package)