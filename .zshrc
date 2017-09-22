# Path to oh-my-zsh installation.
export ZSH=/home/mwn/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(vi-mode)
plugins=()

source $ZSH/oh-my-zsh.sh

# Set language environment
export LANG=en_US.UTF-8

# Set personal aliases
alias c="clear"
alias C="clear"

alias gs="git status"
alias gp="git pull"

alias ns="npm start"

alias sc="vi ~/.zshrc"
alias scs=". ~/.zshrc"

alias h="history | grep $*"

# Source tmux configuration
tmux source-file ~/.tmux.conf

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Load gvm
[ -s "/home/mwn/.gvm/scripts/gvm" ] && \. "/home/mwn/.gvm/scripts/gvm"

# Load autojump
. /usr/share/autojump/autojump.sh

# A simple TODO list
todo() {
    test -f $HOME/.todo || touch $HOME/.todo
    if [ $# = 0 ]
    then
        cat -n $HOME/.todo
    elif [ $1 = -c ]
    then
        > $HOME/.todo
    else
        echo $@ >> $HOME/.todo
    fi
}

ok() {
    test -f $HOME/.todo || touch $HOME/.todo
    if [ $# = 0 ]
    then
        cat -n $HOME/.todo
        echo -ne "----------------------------\nType a number to remove: "
        read NUMBER
        sed -ie ${NUMBER}d $HOME/.todo
    else
        sed -ie $1d $HOME/.todo
    fi
}
