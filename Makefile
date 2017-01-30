.PHONY: docs test

TITLE="\x1b[96;01mSERVER\x1b[0m"

# HELP

app\:help:
	@echo ""
	@echo ${TITLE} HELP
	@echo ""
	@echo "app:clean 		clean the build"
	@echo "app:start 		starts server"
	@echo "app:stop 		stops server"
	@echo "app:test 		run all tests"
	@echo "db:install		create database"
	@echo ""

# COMMANDS

app\:clean:
	@echo ${TITLE}
	@echo "==> CLEANING APP"
	@echo "==> APP CLEANED"

app\:stop:
	@echo ${TITLE}
	@echo "==> STOPPING APP"
	@sh ./tasks/stop.sh
	@echo "==> APP STOPPED"

app\:start:
	@make app:stop
	@echo ${TITLE}
	@echo "==> STARTING APP"
	@sh ./tasks/start.sh
	@echo "==> APP STARTED"

app\:test:
	@make db:install
	@make app:stop
	@echo ${TITLE}
	@echo "==> STARTING & TESTING APP"
	@sh ./tests/_tests.sh
	@echo "==> APP TESTED"

db\:install:
	@echo ${TITLE}
	@echo "==> INSTALLING DATABASE"
	@sh ./database/_database.sh
	@echo "==> DATABASE INSTALLED"