# PATH
export PATH=/usr/local/bin:$HOME/.bin:$PATH

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
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# Prompts
PROMPT_COLOR_USER='magenta'
PROMPT_COLOR_HOSTNAME='magenta'
PROMPT_COLOR_PWD='yellow'
PROMPT_COLOR_TIME='white'

# In SSH
if [ ! -z $SSH_CLIENT ]
then
  PROMPT_COLOR_USER='green'
  PROMPT_COLOR_HOSTNAME='green'
fi
# When root
if [ $USER = 'root' ]
then
  PROMPT_COLOR_USER='red'
  PROMPT_COLOR_HOSTNAME='red'
  PROMPT_COLOR_TIME='red'
fi
PROMPT="%U%F{${PROMPT_COLOR_HOSTNAME}}%n@%M%f%u:%F{${PROMPT_COLOR_PWD}}%/%f
%F{${PROMPT_COLOR_TIME}}[%D %*]%#%f "

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

# OS-specific configuration
case $OSTYPE in
  darwin*)
    export LSCOLORS=gxfxcxdxbxegedabagacad
    alias ls='ls -G';;
  linux-gnu)
    export LS_COLORS='di=00;36:ln=00;35'
    alias ls='ls --color=auto';;
esac

# Syntax highlighting
source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# cd
setopt auto_cd
chpwd(){ls}

# local zshrc
if [ -f $HOME/.zshrc_local ];
then
  source $HOME/.zshrc_local
fi

# Run
ls
