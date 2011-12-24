all: install setup

install:
	@chmod a+x scripts/*
	@./scripts/install.sh

setup:
	@chmod a+x scripts/*
	@./scripts/setup.sh

.PHONY: all setup