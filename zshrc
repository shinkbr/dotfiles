#PATH
export PATH=/usr/local/bin:$HOME/.bin:$PATH
export PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH" #Ruby on Rails


#Vim binds
bindkey -v
if which vim > /dev/null; then
  export EDITOR=vim
fi


#Completion
autoload -Uz compinit
compinit


#History
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
setopt share_history
setopt hist_ignore_dups
setopt hist_reduce_blanks


#Colors
export LS_COLORS='di=00;36:ln=00;35'


#Prompts
PROMPT='%F{red}[%n-%D{%T}]%#%f '
RPROMPT='%F{yellow}[%/]%f'


#Aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lal='ls -la'
alias javac='javac -J-Duser.language=en -J-Duser.country=us'
alias glcc='gcc -lglut -lGLU -lGL -lm'
alias gl++='g++ -lglut -lGLU -lGL -lm'


#In SSH
if [ "$SSH_CLIENT" != "" ]; then
  TERM=xterm
  PROMPT='%F{green}[%n-%D{%T}]%#%f '
  RPROMPT='%F{yellow}[%/%f%F{green}@%M%f%F{yellow}]%f'
fi


#In Mac
case "$OSTYPE" in
  darwin*)
    export LSCOLORS=gxfxcxdxbxegedabagacad
    alias ls='ls -G'
    alias glcc='gcc -framework OpenGL -framework GLUT -framework Foundation "$@"'
    alias gl++='g++ -framework OpenGL -framework GLUT -framework Foundation "$@"';;
esac


#cd
setopt auto_cd
chpwd(){ls}


#Run
ls
