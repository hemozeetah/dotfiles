SHELL := /bin/bash
BREWFILE := $(CURDIR)/Brewfile
BREW := $(shell command -v brew || echo /opt/homebrew/bin/brew)
STOW := stow --no-folding -d $(CURDIR) -t $(HOME)

.DEFAULT_GOAL := help
.PHONY: help homebrew brew brew-check brew-extra link unlink link-check

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

link: ## link configs into home
	$(STOW) stow

unlink: ## remove config links from home
	$(STOW) -D stow

link-check: ## preview what link would change
	$(STOW) -n -v stow
