.PHONY: docs test

# HELP

help:
	@echo ""
	@echo "SERVER : help"
	@echo ""
	@echo "clean"
	@echo "test"
	@echo ""

# COMMANDS

clean:
    echo "" && \
    echo "SERVER : clean " && \
    echo ""

test:
	@sh ./tests/_tester.sh
    echo "" && \
    echo "SERVER : test " && \
    echo ""
