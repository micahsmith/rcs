#!/usr/bin/env bash

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ls='ls --color=auto'

alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'

alias pull='git fetch --prune --prune-tags && git merge FETCH_HEAD' 
