# Path to your oh-my-zsh installation.  export ZSH=/home/framgia/.oh-my-zsh # Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/ # Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="amuse"

plugins=(
  git
  bundler
  dotenv
  osx
  rake
  rbenv
  ruby
  zsh-completions
)

export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

alias as="studio.sh"
alias open="xdg-open"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/.local/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/framgia/.sdkman"
[[ -s "/home/framgia/.sdkman/bin/sdkman-init.sh" ]] && source "/home/framgia/.sdkman/bin/sdkman-init.sh"
export VISUAL=vim
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
alias kdelete='kubectl delete --grace-period=0 --force '
kct () { kubectl config set-context $(kubectl config current-context) --namespace=$1 }

# topcbl command
alias rgrep="grep -rn --exclude-dir=.* --exclude=.* --exclude=tags --exclude-dir=asset* --exclude-dir=log* --exclude=*log* --exclude-dir=public --exclude=*.csv"
alias agrep="grep -rn --exclude=tags --exclude-dir=build --exclude-dir=.idea"

export NVM_DIR="/home/framgia/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

if [ $commands[kubectl] ]; then
    source <(kubectl completion zsh)
fi

findfile () { find -name "*$1*" }
dm () { docker-machine $1 $2 $3 $4 $5 $6 $7 $8 $9 }
dcp () { docker-compose -f docker-compose.yml -f docker-compose.prod.yml $1 $2 $3 $4 $5 $6 }