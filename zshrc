# PATH
export PATH=/usr/local/bin:$HOME/.bin:$PATH
eval "$(rbenv init -)" #rbenv
export PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH" # Ruby on Rails

# Vim bind
bindkey -v
if which vim > /dev/null; then
  export EDITOR=vim
fi

# Completion
autoload -Uz compinit
compinit

# History
HISTFILE=$HOME/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
setopt share_history
setopt hist_ignore_dups
setopt hist_reduce_blanks
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# Prompts
PROMPT='%F{red}[%n-%D{%T}]%#%f '
RPROMPT='%F{yellow}[%/]%f'
# In SSH
if [ ! -z $SSH_CLIENT ]
then
  PROMPT='%F{green}[%n-%D{%T}]%#%f '
  RPROMPT='%F{yellow}[%/%f%F{green}@%M%f%F{yellow}]%f'
fi

# Aliases
alias v=vim
alias vr='vim -R'
alias vimr='vim -R'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lal='ls -la'
alias javac='javac -J-Duser.language=en -J-Duser.country=us'
alias g='git'

# OS-specific configuration
case $OSTYPE in
  darwin*)
    export LSCOLORS=gxfxcxdxbxegedabagacad
    alias ls='ls -G';;
  linux-gnu)
    source $HOME/.perl5/etc/bashrc # perlbrew
    export LS_COLORS='di=00;36:ln=00;35'
    alias ls='ls --color=auto';;
esac

# Syntax highlighting
source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# cd
setopt auto_cd
chpwd(){ls}

# In SSH
if [ ! -z $SSH_CLIENT ]
then
  TERM=xterm
  if [ -z $TMUX ]
  then
    tmux attach
  fi
fi

# Run
ls
