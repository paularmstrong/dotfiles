NO_COLOR=\x1b[0m
OK_COLOR=\x1b[32;01m
ERROR_COLOR=\x1b[31;01m
WARN_COLOR=\x1b[33;01m

all: depend install setup

depend:
ifeq ($(shell which brew),)
	@echo "$(WARN_COLOR)"
	@echo "----------------------------------------"
	@echo "Homebrew not found. Installing..."
	@echo "----------------------------------------"
	@echo "$(NO_COLOR)"
	@ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
	@brew tap phinze/homebrew-cask
	@brew install brew-cask
endif
ifeq ($(shell which node),)
	@echo "$(WARN_COLOR)"
	@echo "----------------------------------------"
	@echo "Node.js not found. Installing..."
	@echo "----------------------------------------"
	@echo "$(NO_COLOR)"
	@brew install node
endif
ifeq ($(shell which rvm),)
	@echo "$(WARN_COLOR)"
	@echo "----------------------------------------"
	@echo "RVM not found. Installing..."
	@echo "----------------------------------------"
	@echo "$(NO_COLOR)"
	@\curl -L https://get.rvm.io | bash -s stable --ruby=1.9.3
endif
	@echo "$(OK_COLOR)"
	@echo "----------------------------------------"
	@echo "All dependencies installed"
	@echo "----------------------------------------"
	@echo "$(NO_COLOR)"

install:
	@chmod a+x scripts/*
	@./scripts/install.sh

setup:
	@chmod a+x scripts/*
	@./scripts/setup.sh

.PHONY: all depend install setup
