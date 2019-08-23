###############################################################################
# YOU FIRST NEED TO HAVE THESE PACKAGES INSTALLED:
# 1. oh-my-zsh        https://github.com/robbyrussell/oh-my-zsh
# 2. tmux             https://github.com/tmux/tmux
# 3. nvm              https://github.com/creationix/nvm
# 4. gvm              https://github.com/moovweb/gvm
# 5. autojump         https://github.com/wting/autojump
# 6. fzf              https://github.com/junegunn/fzf
###############################################################################

# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="bira"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    vi-mode                     # https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/vi-mode
    history-substring-search    # https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/history-substring-search
)

source $ZSH/oh-my-zsh.sh

# CONFIGURATIONS OF PLUGINS
c-history-substring-search () {
    # bind k and j for VI mode
    bindkey -M vicmd 'k' history-substring-search-up
    bindkey -M vicmd 'j' history-substring-search-down
}
c-history-substring-search

# Set language environment
export LANG=en_US.UTF-8

# Set personal aliases

# Source tmux configuration
[ -f /tmp/tmux-1000/default ] && tmux source-file ~/.tmux.conf

# Load autojump
[ -f /usr/share/autojump/autojump.sh ] && source /usr/share/autojump/autojump.sh

# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fs - determine size of a file or total size of a directory
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

# x - extract or unpack(uncompress) a compressed file
ex() {
    if [ -f $1 ]; then
        case $1 in
            *.tar)       tar xvf $1;;
            *.tar.bz2)   tar jxvf $1;;
            *.tbz2)      tar jxvf $1;;
            *.tar.gz)    tar zxvf $1;;
            *.tgz)       tar zxvf $1;;
            *.zip)       unzip -O gbk $1;;
            *.gz)        gunzip $1;;
            *.bz2)       bunzip2 $1;;
            *.rar)       unrar e $1;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1;;
            *)           echo "'$1' cannot be extracted via x()";
        esac
    else
        echo "'$1' is not a valid file";
    fi;
}

# sz - source xmodmap
sx () {
    xmodmap ~/.Xmodmap
}

# j - fzf integration with autojump
j () {
    if [[ "$#" -ne 0 ]]; then
        cd $(autojump $@)
        return
    fi
    cd "$(autojump -s | sed '/_____/Q; s/^[0-9,.:]*\s*//' |  fzf --height 40% --reverse --inline-info)"
}

# ch - fzf integration chrome history
ch () {
    local cols sep google_history open
    cols=$(( COLUMNS / 3 ))
    sep='{::}'

    if [ "$(uname)" = "Darwin" ]; then
        google_history="$HOME/Library/Application Support/Google/Chrome/Default/History"
        open=open
    else
        google_history="$HOME/.config/google-chrome/Default/History"
        open=xdg-open
    fi
    cp -f "$google_history" /tmp/h
    sqlite3 -separator $sep /tmp/h \
        "select substr(title, 1, $cols), url
        from urls order by last_visit_time desc" |
    awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
    fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs $open > /dev/null 2> /dev/null
}

# gshow - fzf integration git commit browser
gshow () {
    git log --graph --color=always \
        --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
    fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
        --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
                FZF-EOF"
}

# more then autojump
eval "$(fasd --init auto)"

alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

alias ll='ls -l'
alias cls=clear
alias c="clear"
alias dc='docker-compose'
alias di='docker images'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dlg='docker logs'
alias dlgf='docker logs -f'
alias dlgt='docker logs -f -t --tail=100'
alias dexc='docker exec -it'
alias gop='cd /opt/gopath/src'
alias gc='git checkout . && git clean -xdf'
alias gst='git status'
alias gs='git rev-parse --short HEAD'
alias grset='git reset --hard HEAD'
alias drma='docker stop $(docker ps -q) & docker rm $(docker ps -aq)'
alias drmno='docker rmi $(docker images -f "dangling=true" -q)'
alias untar='tar -zxvf '
alias www='python -m SimpleHTTPServer 8000'
alias ipe='curl ipinfo.io/ip'
alias time-date='date && cal'
alias ew='emacs -nw'
alias netst='sudo netstat -tunlp | grep '
alias kb=kubectl
alias grmidea='git rm -r --cached .idea'
alias r=ranger

alias sz='source ~/.zshrc'

# set kubectl command line completion
source <(kubectl completion zsh)

# set go path
export GO111MODULE=on
export GOPATH=/opt/gopath
export GOROOT=/opt/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# set rust path
export RUSTPATH=$HOME/.cargo
export PATH=$PATH:$RUSTPATH/bin
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup

# set java path
export JAVA_HOME=/home/snlan/java/jdk1.8.0_212
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin

# set mevan
export M2_HOME=/usr/local/apache-maven-3.6.1
export PATH=$PATH:${M2_HOME}/bin

# set cask path
export PATH=$PATH:$HOME/.cask/bin

export FABRIC_CFG_PATH="/opt/gopath/src/github.com/hyperledger/fabric/sampleconfig"
export FABIRC_BIN_PATH="/opt/gopath/src/github.com/hyperledger/fabric/.build/bin"
export PATH=$PATH:$FABIRC_BIN_PATH
