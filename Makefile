.PHONY: all
all: dotfiles $(HOME)/.config/nvim

.PHONY: dotfiles ## Installs the dotfiles
dotfiles: # Installs the dotfiles
# add links for dotfiles
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git" -not -name ".gnupg" -not -name ".#*" -not -name ".*.swp"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done; \

$(HOME)/.config/nvim: nvim
	@echo "$(abspath $<)"	
	ln -sfn $(abspath $<) $@

.PHONY: test
test: shellcheck ## Runs all the tests on the file in the repo

.PHONY: shellcheck
shellcheck:
	./test.sh
