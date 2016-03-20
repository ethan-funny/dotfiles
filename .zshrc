# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="steeef"
#ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git, autojump)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"i

#=================================================#
# Customized zshrc
# Author    : freematrix
# Homepage  : http://funhacks.net/
# Date      : 2015/06/02
#=================================================#

# iterm2 PS1 configuration
#export PS1="\W \$ "
#export PS1="$(print '%{\e[1;34m%}%n%{\e[0m%}'):$(print '%{\e[0;34m%}%~%{\e[0m%}')$ "
#export PS1="$(print '%{\e[1;34m%}%m:%{\e[0m%}')$(print '%{\e[0;34m%}%~%{\e[0m%}')$(print '%{\e[0;32m%}[%T] $%{\e[0m%}') "
export PS1="$(print '%{\e[1;34m%}%n@%m:%{\e[0m%}')$(print '%{\e[0;34m%}%.%{\e[0m%}')$(print '%{\e[0;32m%}[%T] $%{\e[0m%}') "
# use vi mode in terminal
# set -o vi
# bindkey -M viins 'ff' vi-cmd-mode

# bindkey
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# useful alias
alias vi="/Applications/MacVim.app/Contents/MacOS/Vim" 
alias .ee='vi ~/.zshrc'
alias .ss='source ~/.zshrc'
alias .vv='vi ~/.vimrc'
alias ll='ls -lrth'
alias la='ls -a'
alias cls='clear'
alias ff='pwd | pbcopy'


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


# export variable
export PATH=${PATH}:/usr/local/bin
export PATH=${PATH}:/usr/local/Cellar/node/5.6.0/bin
export PATH=${PATH}:/usr/local/texlive/2012/bin/x86_64-darwin
export PATH=${PATH}:/Applications/Qt5.0.2/5.0.2/clang_64/bin
export PATH=${PATH}:/usr/local/ffmpeg/bin
export PATH=${PATH}:/usr/local/sbin
export QT_PLUGIN_PATH="/usr/local/qwt-6.1.0/plugins:$QT_PLUGIN_PATH"

## docker export
# export DOCKER_HOST="tcp://192.168.99.100:2376"
# export DOCKER_CERT_PATH=/Users/freematrix/.docker/machine/machines/default
# export DOCKER_TLS_VERIFY=1

## export pycurl
export PYCURL_CURL_CONFIG=/usr/bin/curl-config
export PYCURL_SSL_LIBRARY=openssl

## export JAVA_HOME
export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin 

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

## utf-8
# export LC_ALL=en
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

## Boost
BOOST_INCLUDE=/usr/local/include
export BOOST_INCLUDE

BOOST_LIB=/usr/local/lib
export BOOST_LIB

## javac
#alias javac="javac -J-Dfile.encoding=utf8"


## perl
PATH="/Users/freematrix/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/Users/freematrix/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/freematrix/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/freematrix/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/freematrix/perl5"; export PERL_MM_OPT;


export NVM_DIR="/Users/freematrix/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
