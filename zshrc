# Set terminfo
export TERM=xterm-256color

# Vim bind
bindkey -v
if which vim > /dev/null; then
  export EDITOR=vim
fi

# Completion
autoload -Uz compinit
compinit

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
setopt share_history
setopt hist_ignore_dups
setopt hist_reduce_blanks
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end

# Prompts
PROMPT_COLOR_LEFT='69'
PROMPT_COLOR_USER='69'
PROMPT_COLOR_HOSTNAME='69'
PROMPT_COLOR_PWD='220'

# In SSH
if [ ! -z $SSH_CLIENT ]
then
  PROMPT_COLOR_LEFT='green'
  PROMPT_COLOR_USER='green'
  PROMPT_COLOR_HOSTNAME='green'
fi
# When root
if [ `id -u` -eq 0 ]
then
  PROMPT_COLOR_LEFT='red'
  PROMPT_COLOR_USER='red'
  PROMPT_COLOR_HOSTNAME='red'
fi
PROMPT="%F{${PROMPT_COLOR_LEFT}}[%n-%*]%#%f "
RPROMPT="[%F{${PROMPT_COLOR_HOSTNAME}}%m%f:%F{${PROMPT_COLOR_PWD}}%~%f]"

# Aliases
alias v=vim
alias vr='vim -R'
alias vimr='vim -R'
alias c='cd'
alias l='ls'
alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -lha'
alias lal='ls -lha'
alias javac='javac -J-Duser.language=en -J-Duser.country=us'
alias g='git'
alias reload="source $HOME/.zshrc"
if which colordiff > /dev/null; then
  alias diff='colordiff -u'
fi

# OS-specific configuration
case $OSTYPE in
  darwin*)
    export LSCOLORS=gxfxcxdxbxegedabagacad
    alias ls='ls -G';;
  linux-gnu)
    export LS_COLORS='di=00;36:ln=00;35'
    alias ls='ls --color=auto';;
esac

# cd
setopt auto_cd
chpwd(){ls}

# Directory stack with completion
DIRSTACKSIZE=100
setopt AUTO_PUSHD
zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'

# Match case-insensitively
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Syntax highlighting
source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Run
ls
