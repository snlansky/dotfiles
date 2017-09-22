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

# Little cat
cat="
              /\\_/\\
            =( °w° )=
              )   (  _     Nothing todo.
             (__ __)//     Why don't you take a little break? \n"

# A simple TODO list
todo() {
    test -f $HOME/.todo || touch $HOME/.todo
    if [ $# = 0 ]
    then
        if [[ ! -s $HOME/.todo ]]
        then
            echo $cat
        else
            cat -n $HOME/.todo
        fi
    elif [ $1 = -h ] || [ $1 = --help ]
    then
        echo '\ntodo - a simple TODO list\n'
        echo 'Usage: todo [-h] [content]'
        echo 'Option:'
        echo '    -h --help       Print usage'
        echo 'Example:'
        echo '    $ todo'
        echo '    $ todo eat your own dog food'
        echo '    $ todo --help\n'
    else
        echo $@ >> $HOME/.todo
    fi
}

# Finish TODO item
ok() {
    test -f $HOME/.todo || touch $HOME/.todo
    if [ $# = 0 ]
    then
        if [[ ! -s $HOME/.todo ]]
        then
            echo $cat
        else
            cat -n $HOME/.todo
            echo -ne "\n     Type a number to remove: "
            read NUMBER
            sed -ie ${NUMBER}d $HOME/.todo
        fi
    elif [ $1 = -h ] || [ $1 = --help ]
    then
        echo '\nok - finish TODO item\n'
        echo 'Usage: ok [-h] [number]'
        echo 'Option:'
        echo '    -h --help       Print usage'
        echo 'Example:'
        echo '    $ ok'
        echo '    $ ok 2'
        echo '    $ ok --help\n'
    else
        sed -ie $1d $HOME/.todo
    fi
}
