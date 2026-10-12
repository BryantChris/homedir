alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias gfop='git-fetch-prune.sh'
alias grm='git rebase -i origin/master'
alias gpfl='git push --force-with-lease'
alias gca='git commit -a --amend'
alias prettyhyper='pushd ~/Projects/hyperproof/java && git status -s . | awk '\''{print $2;}'\'' | xargs -I{} npx prettier --no-color --write {} && popd'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias k=kubectl
alias hpclidev="HP_CLI_TARGET_ENV=dev dotnet run --project ~/Projects/hyperproof/cs/HP"
alias hpclilocaldev="HP_CLI_TARGET_ENV=localdev dotnet run --project ~/Projects/hyperproof/cs/HP"
alias gitgone="git branch -vv | awk '/: gone]/ {print $1}'"
alias gitlocal="git branch --format "%(refname:short) %(upstream)" | awk '{if (!$2) print $1;}'"
