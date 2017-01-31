#!/bin/bash

.PHONY: docs test

STATUS:="\x1b[96;01m\xE2\x80\xA2\x1b[0m"

# HELP

app\:help:
	@echo ""
	@echo ${STATUS} HELP
	@echo ""
	@echo "app:clean 		clean the build"
	@echo "app:restart		restarts server"
	@echo "app:start 		starts server"
	@echo "app:stop 		stops server"
	@echo "app:test 		run all tests"
	@echo "db:backup 		backup database"
	@echo "db:install		install database"
	@echo "db:restart		restart database"
	@echo "db:setup 		install and setup database env (mysql)"
	@echo "db:start 		start database"
	@echo "db:stop  		stop database"
	@echo ""

# FUNCTIONS
define log
	echo ${STATUS} $2
	echo "$1|"`date "+%Y%m%d-%H%M%S"` >> ./logs/`date "+%Y%m".log`
endef

# APP

app\:clean:
	@$(call log, "app:clean", "...CLEANING APP")
	@sh ./tasks/app-clean.sh
	@$(call log, "app:clean", "APP CLEANED")

app\:restart:
	@make app:stop
	@make app:start

app\:stop:
	@$(call log, "app:stop", "...STOPPING APP")
	@sh ./tasks/app-stop.sh
	@$(call log, "app:stop", "APP STOPPED")

app\:start:
	@$(call log, "app:start", "...STARTING APP")
	@sh ./tasks/app-start.sh
	@$(call log, "app:start", "APP STARTED")

app\:test:
	@make app:start
	@$(call log, "app:test", "...TESTING APP")
	@sh ./tasks/app-test.sh
	@$(call log, "app:test", "APP TESTED")
	@make app:stop

# DATABASE

db\:backup:
	@$(call log, "db:backup", "...BACKING UP DATABASE")
	@sh ./tasks/database-backup.sh
	@$(call log, "db:backup", "DATABASE BACKED UP")

db\:install:
	@make db:backup
	@$(call log, "db:install", "...INSTALLING DATABASE")
	@sh ./tasks/database-install.sh
	@$(call log, "db:install", "DATABASE INSTALLED")

db\:restart:
	@$(call log, "db:restart", "...RESTARTING DATABASE")
	@mysql.server restart
	@$(call log, "db:restart", "DATABASE RESTARTED")

db\:setup:
	@$(call log, "db:setup", "...SETTING UP DATABASE ENVIRONMENT")
	@sh ./tasks/database-setup.sh
	@$(call log, "db:setup", "DATABASE SETUP")

db\:start:
	@$(call log, "db:start", "...STARTING DATABASE")
	@mysql.server start
	@$(call log, "db:start", "DATABASE STARTED")

db\:stop:
	@$(call log, "db:stop", "...STOPPING DATABASE")
	@mysql.server stop
	@$(call log, "db:stop", "DATABASE STOPPED")