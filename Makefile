.PHONY: docs test

TITLE="\x1b[96;01mSERVER\x1b[0m"
STATUS="\x1b[96;01m\xE2\x80\xA2\x1b[0m"

# HELP

app\:help:
	@echo ""
	@echo ${TITLE} HELP
	@echo ""
	@echo "app:clean 		clean the build"
	@echo "app:restart		restarts server"
	@echo "app:start 		starts server"
	@echo "app:stop 		stops server"
	@echo "app:test 		run all tests"
	@echo "db:backup		backup database"
	@echo "db:install		install database"
	@echo "db:restart		restart database"
	@echo "db:setup			install and setup mysql"
	@echo "db:start			start database"
	@echo "db:stop			stop database"
	@echo ""

# APP

app\:clean:
	@echo ${TITLE}
	@echo ${STATUS} "CLEANING APP"
	@sh ./tasks/app-clean.sh
	@echo ${STATUS} "APP CLEANED"

app\:restart:
	@make app:stop
	@make app:start

app\:stop:
	@echo ${TITLE}
	@echo ${STATUS} "STOPPING APP"
	@sh ./tasks/app-stop.sh
	@echo ${STATUS} "APP STOPPED"

app\:start:
	@echo ${TITLE}
	@echo ${STATUS} "STARTING APP"
	@sh ./tasks/app-start.sh
	@echo ${STATUS} "APP STARTED"

app\:test:
	@echo ${TITLE}
	@echo ${STATUS} "STARTING & TESTING APP"
	@sh ./tasks/app-test.sh
	@echo ${STATUS} "APP TESTED"

# DATABASE

db\:backup:
	@echo ${TITLE}
	@echo ${STATUS} "BACKING UP DATABASE"
	@sh ./tasks/database-backup.sh
	@echo ${STATUS} "DATABASE BACKED UP"

db\:install:
	@make db:backup
	@echo ${TITLE}
	@echo ${STATUS} "INSTALLING DATABASE"
	@sh ./tasks/database-install.sh
	@echo ${STATUS} "DATABASE INSTALLED"

db\:restart:
	@echo ${TITLE}
	@echo ${STATUS} "RESTARTING DATABASE"
	@mysql.server restart
	@echo ${STATUS} "DATABASE RESTARTED"

db\:setup:
	@echo ${TITLE}
	@echo ${STATUS} "SETTING UP DATABASE"
	@sh ./tasks/database-setup.sh
	@echo ${STATUS} "DATABASE SETUP"

db\:start:
	@echo ${TITLE}
	@echo ${STATUS} "STARTING DATABASE"
	@mysql.server start
	@echo ${STATUS} "DATABASE STARTED"

db\:stop:
	@echo ${TITLE}
	@echo ${STATUS} "STOPPING DATABASE"
	@mysql.server stop
	@echo ${STATUS} "DATABASE STOPPED"