all: install setup

install:
	@./scripts/install.sh
	
setup:
	@./scripts/setup.sh
	
.PHONY: all setup