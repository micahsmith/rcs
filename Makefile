.PHONY: all
all: .bashrc .nvimrc .tmux.conf bat rg starship tokei

.bashrc:
	@cp bashrc "${HOME}/.bashrc"

.nvimrc:
	@cp nvimrc "${HOME}/.nvimrc"

.tmux.conf:
	@cp tmux.conf "${HOME}/.tmux.conf"

bat: rust
ifeq ($(strip $(shell test -x $(which bat) && which bat)),)
	@cargo install bat
endif

rg: rust
ifeq ($(strip $(shell test -x $(which rg) && which rg)),)
	@cargo install ripgrep
endif

rust:
ifeq ($(strip $(shell test -x $(which rustup) && which rustup)),)
	@curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
endif

starship: rust
ifeq ($(strip $(shell test -x $(which starship) && which starship)),)
	@cargo install starship
endif

tokei: rust
ifeq ($(strip $(shell test -x $(which tokei) && which tokei)),)
	@cargo install tokei
endif
