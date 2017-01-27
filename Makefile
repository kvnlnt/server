.PHONY: docs test

TITLE="\x1b[96;01mSERVER\x1b[0m"

# HELP

help:
	@echo ""
	@echo ${TITLE} HELP
	@echo ""
	@echo "clean 		clean the build"
	@echo "test 		run all tests"
	@echo ""

# COMMANDS

clean:
	@echo ""
	@echo ${TITLE} CLEAN
	@echo ""

test:
	@echo ""
	@echo ${TITLE} TEST
	@echo ""
	@sh ./tests/_tester.sh
