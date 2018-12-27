# Set terminfo
export TERM=xterm-256color

# Vim bind
if which vim > /dev/null; then
  export EDITOR=vim
fi

# History
HISTFILE=$HOME/.bash_history
HISTSIZE=100000
SAVEHIST=100000

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
alias c='cd'
alias l='ls'
alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -lha'
alias lal='ls -lha'
alias v='vim'
alias vr='vim -R'
alias vimr='vim -R'
alias g='git'
alias be='bundle exec'
alias tm='tmux'
alias reload='source $HOME/.bashrc'
if which colordiff &> /dev/null
then
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

# Run
ls
