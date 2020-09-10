MAKEFILE_DIR:=$(strip $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))

.PHONY: all
all: .bashrc .nvimrc .tmux.conf bat rg shellcheck stack starship tokei

.bashrc: .bash_aliases
	@ln -fs "${MAKEFILE_DIR}/bashrc" "${HOME}/.bashrc"

.bash_aliases:
	@ln -fs "${MAKEFILE_DIR}/bash_aliases" "${HOME}/.bash_aliases"

.nvimrc:
	@ln -fs "${MAKEFILE_DIR}/nvimrc" "${HOME}/.nvimrc"

.tmux.conf:
	@ln -fs "${MAKEFILE_DIR}/tmux.conf" "${HOME}/.tmux.conf"

bat: rustup
ifeq ($(strip $(shell test -x $(which bat) && which bat)),)
	@cargo install bat
endif

rg: rustup
ifeq ($(strip $(shell test -x $(which rg) && which rg)),)
	@cargo install ripgrep
endif

rustup:
ifeq ($(strip $(shell test -x $(which rustup) && which rustup)),)
	@curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
endif

shellcheck: stack
ifeq ($(strip $(shell test -x $(which shellcheck) && which shellcheck)),)
	@stack update
	@stack install ShellCheck
endif

stack:
ifeq ($(strip $(shell test -x $(which stack) && which stack)),)
	@curl --proto '=https' --tlsv1.2 -sSL https://get.haskellstack.org/ | sh
endif

starship: rustup
ifeq ($(strip $(shell test -x $(which starship) && which starship)),)
	@cargo install starship
endif

tokei: rustup
ifeq ($(strip $(shell test -x $(which tokei) && which tokei)),)
	@cargo install tokei
endif
