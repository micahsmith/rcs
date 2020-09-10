# shellcheck disable=SC2039
# shellcheck source=/dev/null

# environment

case $- in
  *i*) ;;
  *) return;;
esac

HISTCONTROL=ignoreboth
HISTFILESIZE=2000
HISTSIZE=1000

shopt -s checkwinsize
shopt -s histappend

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
[ -s ~/.bash_aliases ] && source ~/.bash_aliases

export EDITOR=/usr/bin/nvim
export NVM_DIR="${HOME}/.nvm"
export PATH="${HOME}/.cargo/bin:${PATH}"

# completion

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

[ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh"
[ -s "${NVM_DIR}/bash_completion" ] && \. "${NVM_DIR}/bash_completion"

[ -s ~/.fzf.bash ] && source ~/.fzf.bash

# prompt

set_prompt() {
  RESTORE='\033[0m'
  LBLUE='\033[01;34m'
  LPURPLE='\033[01;35m'
  LCYAN='\033[01;36m'

  case "$TERM" in
    xterm-color|*-256color) use_color=yes;;
  esac

  if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
  fi

  if [ "${use_color}" = "yes" ]; then
    export PS1="${debian_chroot:+($debian_chroot)}${LPURPLE}[\t] ${LCYAN}\u@\h:${LBLUE}\w${RESTORE}$ "
  else
    export PS1="${debian_chroot:+($debian_chroot)}[\t] \u@\h:\w$ "
  fi
}

if hash starship 2>/dev/null; then
  eval "$(starship init bash)"
else
  set_prompt
fi
