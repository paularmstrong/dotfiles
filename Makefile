all: depend install setup

depend:
	@chmod a+x scripts/*
	@./scripts/dependencies.sh

install:
	@chmod a+x scripts/*
	@./scripts/install.sh

setup:
	@chmod a+x scripts/*
	@./scripts/setup.sh

.PHONY: all depend install setup