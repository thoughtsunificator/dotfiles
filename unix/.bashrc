# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
# append to the history file, don't overwrite it
shopt -s histappend
# ignorespace and ignoredups
export HISTCONTROL=ignoreboth
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=-1
export HISTFILESIZE=-1
# and even this is not enough. Visudo also needs to be told what Default editor to expect...
export EDITOR=vim
export VISUAL=vim
export BROWSER=w3m
# feed psql default credentials
export PGHOST=localhost
export PGPORT=5433
export PGDATABASE=postgres
export PGUSER=postgres
export PGPASSWORD=mysecretpassword
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git --exclude package-lock.json'
