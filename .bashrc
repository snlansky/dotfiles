#! /bin/bash

##############################################################################
# DON'T PUT ANY CUSTOMIZATIONS HERE (THEY MAY GET OVERWRITTEN BY THE SYSTEM) #
##############################################################################

# Source global definitions
if [ -f /etc/bashrc ]; then # Fedora
    . /etc/bashrc
elif [ -f /etc/bash.bashrc ]; then # Debian
    . /etc/bash.bashrc
fi

#######################################
# USER SPECIFIC ALIASES AND FUNCTIONS #
#######################################

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

set -o vi

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias c="clear"
alias C="clear"

alias l="ls -la"
alias ll="ls -l"

alias gs="git status"
alias gp="git pull"

alias sc="vi ~/.bashrc"
alias scs=". ~/.bashrc"

alias dps="docker ps"
alias dpsa="docker ps -a"
alias di="docker images"
alias dl="docker logs"
alias drm="docker rm"
alias drmi="docker rmi"

# ack search source code
ack () {
   grep -rn $1 ./
}

# fs determine size of a file or total size of a directory
fs () {
    if du -b /dev/null > /dev/null 2>&1; then
        local arg=-sbh;
    else
        local arg=-sh;
    fi
    if [[ -n "$@" ]]; then
        du $arg -- "$@";
    else
        du $arg .[^.]* ./*;
    fi;
}
