# homedir

https://ohmyz.sh/

## .zshrc additions
```
ZSH_THEME="eastwood"

plugins=(git node iterm2 macos aws zsh-autosuggestions zsh-syntax-highlighting)

################## PERSONAL
setopt auto_cd
cdpath=($HOME/Projects)

unsetopt INC_APPEND_HISTORY
unsetopt SHARE_HISTORY
setopt APPEND_HISTORY

export LESS="-RFX"

## ZSH COMPLETIONS FROM BREW

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi


## GO
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
```
