#!/usr/bin/env bash

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

if hash exa 2>/dev/null; then
  alias ls='exa'
  alias la='exa -aFG'
  alias ll='exa -ablF'
  alias lh='exa -blF'
else
  alias ls='ls --color=auto'
  alias la='ls -ACF'
  alias ll='ls -alhF'
  alias lh='ls -lhF'
fi

alias pull='git fetch --prune --prune-tags && git merge FETCH_HEAD'
