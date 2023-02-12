#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Seems this bashrc is not actually used by the Konsole terminal...

alias ls='ls --color=auto'
alias ll='ls --color=auto -lav --ignore=..'   # show long listing of all except "..

PS1='\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32m\]\\$\[\e[m\] '

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
