NAME=Paul Armstrong
EMAIL=paul@paularmstrongdesigns.com

basic:
	@chmod a+x scripts/*
	@./scripts/install.sh --name="${NAME}" --email="${EMAIL}"

osx:
	@chmod a+x osx/*
	@./osx/defaults.sh
	@./osx/install.sh

.PHONY: basic osx
