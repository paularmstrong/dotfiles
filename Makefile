NAME=Paul Armstrong
EMAIL=paul@spaceyak.com

basic:
	@chmod a+x scripts/*
	@./scripts/install.sh --name="${NAME}" --email="${EMAIL}"

osx: defaults homebrew prefs apps hosts

defaults:
	@./osx/defaults.sh

homebrew:
	@./osx/homebrew.sh

apps:
	@./osx/apps.sh

prefs:
	@./osx/prefs.sh

hosts:
	@./osx/hosts.sh

.PHONY: basic osx defaults homebrew apps prefs
