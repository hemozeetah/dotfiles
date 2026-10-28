SHELL := /bin/bash
BREWFILE := $(CURDIR)/Brewfile
BREW := $(shell command -v brew || echo /opt/homebrew/bin/brew)

.DEFAULT_GOAL := help
.PHONY: help homebrew brew brew-check brew-extra

help: ## show targets
	@grep -E '^[a-z-]+:.*## ' $(MAKEFILE_LIST) | awk -F ':.*## ' '{printf "  %-12s %s\n", $$1, $$2}'

homebrew: ## install homebrew if missing
	@[ -x "$(BREW)" ] || /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew: homebrew ## install packages from brewfile
	$(BREW) bundle install --file=$(BREWFILE)

brew-check: ## show what is missing from brewfile
	HOMEBREW_NO_AUTO_UPDATE=1 $(BREW) bundle check --verbose --file=$(BREWFILE)

brew-extra: ## list installed packages not in brewfile
	@HOMEBREW_NO_AUTO_UPDATE=1 $(BREW) bundle dump --no-describe --file=- | grep -vxFf $(BREWFILE) || true
