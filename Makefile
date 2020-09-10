MAKEFILE_DIR:=$(strip $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))

.PHONY: all
all: .bashrc bat fzf nvim rg shellcheck stack starship tmux tokei

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

fzf:
ifeq ($(strip $(shell test -x $(which fzf) && which fzf)),)
	@git clone --depth 1 https://github.com/junegunn/fzf.git "${HOME}/.local/fzf"
	@"${HOME}/.local/fzf/install"
endif

nvim: .nvimrc
ifeq ($(strip $(shell test -x $(which nvim) && which nvim)),)
	@sudo snap install --beta nvim --classic
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

tmux: .tmux.conf
ifeq ($(strip $(shell test -x $(which tmux) && which tmux)),)
	@sudo apt-get install tmux
endif

tokei: rustup
ifeq ($(strip $(shell test -x $(which tokei) && which tokei)),)
	@cargo install tokei
endif
