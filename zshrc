export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

export FZF_BASE="${HOME}/.local/fzf"
export GOPATH="${HOME}/.local/go"
export NVM_DIR="${HOME}/.nvm"
export PATH="${HOME}/.cargo/bin:/usr/local/go/bin:${GOPATH}/bin:${HOME}/.local/bin:${PATH}"

zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 14

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

plugins=(
  fzf
  git
)


# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh

set_prompt() {
  RESTORE='%f%b'
  LBLUE='%F{blue}%B'
  LPURPLE='%F{magenta}%B'
  LCYAN='%F{cyan}%B'

  case "$TERM" in
    xterm-color|*-256color) use_color=yes;;
  esac

  if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
  fi

  if [ "${use_color}" = "yes" ]; then
    export PS1="${debian_chroot:+($debian_chroot)}${LPURPLE}[%T] ${LCYAN}%n@%m:${LBLUE}%~${RESTORE}$ "
  else
    export PS1="${debian_chroot:+($debian_chroot)}[%T] %n@%m:%~$ "
  fi
}

if hash starship 2>/dev/null; then
  eval "$(starship init zsh)"
else
  set_prompt
fi
