include .env
export APP=$(shell grep APP_DIR .env | cut -d '=' -f2)
export HOME=$(shell grep APP_USER_HOME .env | cut -d '=' -f2)

up:
	clear
	@mkdir -p ${APP} ${HOME}
	@docker-compose up -d

down:
	clear
	@docker-compose down

restart:
	clear
	@docker-compose restart

ps:
	clear
	@docker-compose ps

logs:
	clear
	@docker-compose logs -f

console:
	clear
	@docker exec -ti console /bin/sh
