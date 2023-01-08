isDocker := $(shell docker info > /dev/null 2>&1 && echo 1)
user := $(shell id -u)
group := $(shell id -g)

ifeq ($(isDocker), 1)
	DC := USER_ID=$(user) GROUP_ID=$(group) docker-compose
	DCE := docker-compose exec
endif

docker:
	$(DC) up

fish:
	$(DCE) php fish