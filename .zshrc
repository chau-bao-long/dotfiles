# Path to your oh-my-zsh installation.  export ZSH=/home/framgia/.oh-my-zsh # Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/ # Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

plugins=(
  git
  osx
  zsh-completions
  vi-mode
)

# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

# Hightlight syntax for manual page
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # cyan
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) # yellow on blue
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7) # white
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)
export GROFF_NO_SGR=1         # For Konsole and Gnome-terminal

autoload -U compinit && compinit

export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Add android PATH
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/.local/bin"

# Python to PATH
export PATH="$PATH:$HOME/Library/Python/3.7/bin"

# User bin folder to PATH
export PATH="$PATH:$HOME/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export VISUAL=nvim
export EDITOR="$VISUAL"

# Git shortcut
alias g='git'
alias gca="git add . && git commit --amend"
alias gst="git status"
alias gls="git log --oneline"
alias gll="git log --graph"
alias gci="git add . && git commit -m "
alias grs="git reset --hard"
alias grbm="git pull origin master --rebase"
alias grbd="git pull origin develop --rebase"
alias grb="git rebase"
alias gbr="git branch"
alias gco="git checkout"
alias grbc="git add . && git rebase --continue"
alias gpf="git push -f"
alias gp="git push"
alias gtd="git tag -d "
alias gprb="git pull --rebase"
alias gcod="git fetch origin && git checkout origin/develop"
alias gcom="git fetch origin && git checkout origin/master"

# docker shortcut
alias d='docker'
alias dc="docker-compose $1"
alias dcr="docker-compose down && docker-compose up -d"
alias dcu="docker-compose up -d"
alias dcub="docker-compose up -d --build"
alias dcd="docker-compose down"
alias da="docker attach $1"
alias dp="docker ps"

# kubernetes shortcut
alias k='kubectl'
alias kk='kubectl get all'
alias wk='watch kubectl get all'
alias kga='kubectl get --all-namespaces'
alias kg='kubectl get'
alias kc='kubectl create -f'
alias ka='kubectl apply -f'
alias kdel='kubectl delete -f'
alias kcdel='kubectl delete configmap'
alias kd='kubectl describe'
alias kl='kubectl logs'
alias ke='kubectl exec -it'
alias kcontext='kubectl config set-context $(kubectl config current-context)' # add --namespace=<ns>
alias kdelete='kubectl delete --grace-period=0 --force po'
kct () { kubectl config set-context $(kubectl config current-context) --namespace=$1 }
kdevict() { kubectl get pods | grep Evicted | awk '{print $1}' | xargs kubectl delete pod }

# zeus shortcut
# more details: gem install --pre 0.15.15 and zeus --log /dev/stderr start
alias zst="unset RAILS_ENV; zeus start"
alias z="unset RAILS_ENV; zeus rake"
alias zc="unset RAILS_ENV; zeus console"
alias zr="unset RAILS_ENV; zeus runner"
alias zs="unset RAILS_ENV; zeus server"
alias zg="unset RAILS_ENV; zeus generate"
alias zd="unset RAILS_ENV; zeus destroy"
alias zt="unset RAILS_ENV; zeus test"

# some custom alias and functions
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
alias f='ranger'

rgrep() { grep -rn --exclude-dir=.* --exclude=.* --exclude=tags --exclude-dir=asset* --exclude-dir=log* --exclude=*log* --exclude-dir=public --exclude=*.csv $1 . }
agrep() { grep -rn --exclude=tags --exclude-dir=build --exclude-dir=.idea $1 . }
findfile () { find -name "*$1*" }
dm () { docker-machine $1 $2 $3 $4 $5 $6 $7 $8 $9 }
dcp () { docker-compose -f docker-compose.yml -f docker-compose.prod.yml $1 $2 $3 $4 $5 $6 }
pkill() {
  ps aux | grep $1 | awk '{print $2}' | xargs kill -9
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# lazy load
loadnode() {
  export NVM_DIR="/Users/chau.bao.long/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
}

loadk8s() {
  if [ $commands[kubectl] ]; then
    source <(kubectl completion zsh)
  fi
}
