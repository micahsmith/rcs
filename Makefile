MAKEFILE_DIR:=$(strip $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))

.PHONY: all .bashrc .bash_aliases .nvimrc .tmux.conf \
	bat fzf nvim rg rustup settings.json shellcheck \
	stack starship starship.toml tmux tokei

all: .bashrc .zshrc bat exa fzf nvim rg settings.json shellcheck starship tmux tokei zellij

.bashrc: .bash_aliases
ifneq ($(strip $(SYMLINK)),)
	@ln -fs "${MAKEFILE_DIR}/bashrc" "${HOME}/.bashrc"
else
	@(test -L "${HOME}/.bashrc" && rm "${HOME}/.bashrc") || true
	@cp -f "${MAKEFILE_DIR}/bashrc" "${HOME}/.bashrc"
endif

.bash_aliases:
ifneq ($(strip $(SYMLINK)),)
	@ln -fs "${MAKEFILE_DIR}/bash_aliases" "${HOME}/.bash_aliases"
else
	@(test -L "${HOME}/.bash_aliases" && rm "${HOME}/.bash_aliases") || true
	@cp -f "${MAKEFILE_DIR}/bash_aliases" "${HOME}/.bash_aliases"
endif

.nvimrc:
ifneq ($(strip $(SYMLINK)),)
	@ln -fs "${MAKEFILE_DIR}/nvimrc" "${HOME}/.nvimrc"
else
	@(test -L "${HOME}/.nvimrc" && rm "${HOME}/.nvimrc") || true
	@cp -f "${MAKEFILE_DIR}/nvimrc" "${HOME}/.nvimrc"
endif

.tmux.conf:
ifneq ($(strip $(SYMLINK)),)
	@ln -fs "${MAKEFILE_DIR}/tmux.conf" "${HOME}/.tmux.conf"
else
	@(test -L "${HOME}/.tmux.conf" && rm "${HOME}/.tmux.conf") || true
	@cp -f "${MAKEFILE_DIR}/tmux.conf" "${HOME}/.tmux.conf"
endif

bat: rustup
ifeq ($(strip $(shell test -x $(which bat) && which bat)),)
	@cargo install bat
endif

exa: rustup
ifeq ($(strip $(shell test -x $(which exa) && which exa)),)
	@cargo install exa
endif

fzf:
ifeq ($(strip $(shell test -x $(which fzf) && which fzf)),)
	@git clone --depth 1 https://github.com/junegunn/fzf.git "${HOME}/.local/fzf"
	@"${HOME}/.local/fzf/install"
endif

nvim: .nvimrc
ifeq ($(strip $(shell test -x $(which nvim) && which nvim)),)
	@sudo snap install --beta nvim --classic
	@mkdir -p "${HOME}/.config/nvim"
	@ln -fs "${HOME}/.nvimrc" "${HOME}/.config/nvim/init.vim"
	@curl -fLo "${HOME}/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

rg: rustup
ifeq ($(strip $(shell test -x $(which rg) && which rg)),)
	@cargo install ripgrep
endif

rustup:
ifeq ($(strip $(shell test -x $(which rustup) && which rustup)),)
	@curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
endif

settings.json:
ifneq ($(strip $(SYMLINK)),)
	@ln -fs "${MAKEFILE_DIR}/settings.json" "${HOME}/.config/Code/User/settings.json"
else
	@(test -L "${HOME}/.config/Code/User/settings.json" && rm "${HOME}/.config/Code/User/settings.json") || true
	@mkdir -p "${HOME}/.config/Code/User"
	@cp -f "${MAKEFILE_DIR}/settings.json" "${HOME}/.config/Code/User/settings.json"
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

starship: rustup starship.toml
ifeq ($(strip $(shell test -x $(which starship) && which starship)),)
	@cargo install starship
endif

starship.toml:
ifneq ($(strip $(SYMLINK)),)
	@ln -fs "${MAKEFILE_DIR}/starship.toml" "${HOME}/.config/starship.toml"
else
	@(test -L "${HOME}/.config/starship.toml" && rm "${HOME}/.config/starship.toml") || true
	@mkdir -p "${HOME}/.config"
	@cp -f "${MAKEFILE_DIR}/starship.toml" "${HOME}/.config/starship.toml"
endif

tmux: .tmux.conf
ifeq ($(strip $(shell test -x $(which tmux) && which tmux)),)
	@sudo apt-get install tmux
endif

tokei: rustup
ifeq ($(strip $(shell test -x $(which tokei) && which tokei)),)
	@cargo install tokei
endif

zellij: zellij.config.kdl
ifeq ($(strip $(shell test -x $(which zellij) && which zellij)),)
	@cargo install --locked zellij
endif

zellij.config.kdl:
ifneq ($(strip $(SYMLINK)),)
	@ln -fs "${MAKEFILE_DIR}/zellij.config.kdl" "${HOME}/.config/zellij/config.kdl"
else
	@(test -L "${HOME}/.config/zellij/config.kdl" && rm "${HOME}/.config/zellij/config.kdl") || true
	@cp -f "${MAKEFILE_DIR}/zellig.config.kdl" "${HOME}/.config/zellij/config.kdl
endif

.zshrc: .zsh_aliases
ifneq ($(strip $(SYMLINK)),)
	@ln -fs "${MAKEFILE_DIR}/zshrc" "${HOME}/.zshrc"
else
	@(test -L "${HOME}/.zshrc" && rm "${HOME}/.zshrc") || true
	@cp -f "${MAKEFILE_DIR}/zshrc" "${HOME}/.zshrc"
endif

.zsh_aliases:
ifneq ($(strip $(SYMLINK)),)
	@ln -fs "${MAKEFILE_DIR}/zsh_aliases" "${HOME}/.oh-my-zsh/custom/aliases.zsh"
else
	@(test -L "${HOME}/.oh-my-zsh/custom/aliases.zsh" && rm "${HOME}/.oh-my-zsh/custom/aliases.zsh") || true
	@cp -f "${MAKEFILE_DIR}/zsh_aliases" "${HOME}/.oh-my-zsh/custom/aliases.zsh"
endif
