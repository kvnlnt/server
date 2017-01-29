.PHONY: docs test

TITLE="\x1b[96;01mSERVER\x1b[0m"

# HELP

help:
	@echo ""
	@echo ${TITLE} HELP
	@echo ""
	@echo "clean 		clean the build"
	@echo "db 			create database"
	@echo "test 		run all tests"
	@echo ""

# COMMANDS

clean:
	@echo ""
	@echo ${TITLE} CLEANING
	@echo ""

db:
	@echo ""
	@echo ${TITLE} CREATING DATABASE
	@echo ""
	@sh ./database/_database.sh

test:
	@make db
	@echo ""
	@echo ${TITLE} TESTING
	@echo ""
	@sh ./tests/_tests.sh
