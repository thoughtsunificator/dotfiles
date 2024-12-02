# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
# append to the history file, don't overwrite it
shopt -s histappend
# ignorespace and ignoredups
HISTCONTROL=ignoreboth
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000
export EDITOR=vim
export VISUAL=vim
export PGHOST=abc
export PGPORT=1000
export PGDATABASE=postgres
export PGUSER=postgres
export PGPASSWORD=pass
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
