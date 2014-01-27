basic:
	@chmod a+x scripts/*
	@./scripts/setup.sh

osx:
	@chmod a+x osx/*
	@./osx/defaults.sh
	@./osx/install.sh

.PHONY: basic osx
