#=================================================#
# Customized bashrc
# Author    : freematrix
# Homepage  : http://funhacks.net/
# Date      : 2015/06/02
#=================================================#

# iterm2 PS1 configuration
#export CLICOLOR=1
#export LSCOLORS=GxFxCxDxBxegedabagaced
#export LSCOLORS=gxfxaxdxcxegedabagacad
#export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
#export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#export PS1="\W \$ "
export PS1="\[\e[32;1m\]\A:\[\e[31;1m\]\w \$ \[\e[0m\]"

# use vi mode in terminal
set -o vi

# useful alias
alias .ee='vi ~/.bashrc'
alias .ss='source ~/.bashrc'
alias .vv='vi ~/.vimrc'
alias ll='ls -lrth'
alias la='ls -a'
alias cls='clear;ll'

if brew list | grep coreutils > /dev/null ; then
    PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
    #alias ls='ls -F --show-control-chars --color=auto'
    alias grep='grep --color'
    alias egrep='egrep --color'
    alias fgrep='fgrep --color'
    eval `gdircolors -b $HOME/.dir_colors`
fi

if [ -x /usr/local/opt/coreutils/libexec/gnubin/dircolors ]; then
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias tree='tree -C'
fi

alias vi="/Applications/MacVim.app/Contents/MacOS/Vim" 

# export variable
export PATH=${PATH}:/usr/local/texlive/2012/bin/x86_64-darwin
export PATH=${PATH}:/Applications/Qt5.0.2/5.0.2/clang_64/bin
export PATH=${PATH}:/usr/local/share/npm/lib/node_modules/hexo-cli/bin
export PATH=${PATH}:/usr/local/ffmpeg/bin
export QT_PLUGIN_PATH="/usr/local/qwt-6.1.0/plugins:$QT_PLUGIN_PATH"

## docker export
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/freematrix/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin 

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM


# utf-8
# export LC_ALL=en

# javac
# alias javac="javac -J-Dfile.encoding=utf8"
