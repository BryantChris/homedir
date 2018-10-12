## LoKe's ~/.bashrc
[ -z "$PS1" ] && return

# Basic options
export HISTCONTROL=ignoredups
export COLORFGBG='default;default'
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export CDPATH=.:~/Projects/:~/Projects/wonderland-root/
export GROOVY_HOME=/usr/local/opt/groovy/libexec

shopt -s checkwinsize

# Aliases
alias ls='ls -ah'
alias ll='ls -l'
alias l='ls -CF'
alias svim='sudo vim'
alias h='cd'
alias cim='vim'
alias back='cd $OLDPWD'
alias root='sudo su'
alias runlevel='sudo /sbin/init'
alias grep='grep --color=auto'
alias dfh='df -h'
alias ..='cd ..'

# Prompt
BGREEN='\[\033[1;32m\]'
GREEN='\[\033[0;32m\]'
BRED='\[\033[1;31m\]'
RED='\[\033[0;31m\]'
BBLUE='\[\033[1;34m\]'
BLUE='\[\033[0;34m\]'
NORMAL='\[\033[00m\]'
PS1="${BLUE}(${RED}\w${BLUE}) ${NORMAL}[\u] ${RED}\$ ${NORMAL}"
# PS1='\n[\u@\h]: \w\n$?> '


# X Terminal titles
case "$TERM" in
xterm*|rxvt*)
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
;;
*)
;;
esac

# Functions
extract () {
if [ -f $1 ] ; then
case $1 in
*.tar.bz2) tar xjf $1 ;;
*.tar.gz) tar xzf $1 ;;
*.bz2) bunzip2 $1 ;;
*.rar) rar x $1 ;;
*.gz) gunzip $1 ;;
*.tar) tar xf $1 ;;
*.tbz2) tar xjf $1 ;;
*.tgz) tar xzf $1 ;;
*.zip) unzip $1 ;;
*.Z) uncompress $1 ;;
*) echo "'$1' cannot be extracted via extract()" ;;
esac
else
echo "'$1' is not a valid file"
fi
}
ziprm () {
if [ -f $1 ] ; then
unzip $1
rm $1
else
echo "Need a valid zipfile"
fi
}
psgrep() {
if [ ! -z $1 ] ; then
echo "Grepping for processes matching $1..."
ps aux | grep $1 | grep -v grep
else
echo "!! Need name to grep for"
fi
}
grab() {
sudo chown -R ${USER} ${1:-.}
}
up() {
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}
dockerclean(){
    docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
    docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

# Bash completion
if [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi
if [ -f $HOME/git-completion.bash ]; then
  source $HOME/git-completion.bash
fi


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

