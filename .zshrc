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

export LC_ALL=en_US.UTF-8
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
export PATH="$HOME/.pyenv:$PATH"
eval "$(pyenv init -)"

# PHP to PATH
export PATH="/usr/local/opt/php@7.3/bin:$PATH"
export PATH="/usr/local/opt/php@7.3/sbin:$PATH"
export LDFLAGS="-L/usr/local/opt/php@7.3/lib"
export CPPFLAGS="-I/usr/local/opt/php@7.3/include"
export PATH="$HOME/.composer/vendor/bin:$PATH"

# User bin folder to PATH
export PATH="$HOME/bin:$PATH"

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

# search shortcut
alias sa="s -p amazon"
alias sw="s -p wikipedia"
alias sc="s -p codepen"
alias sd="s -p dockerhub"
alias sg="s -p github"
alias si="s -p imdb"
alias sim="s -p imgur"
alias sm="s -p medium"
alias sn="s -p nhaccuatui"
alias sq="s -p quora"
alias ssc="s -p soundcloud"
alias sy="s -p youtube"

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
kct () { kubectl config use-context $1 }
kns () { kubectl config set-context $(kubectl config current-context) --namespace=$1 }
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
alias m='neomutt'
alias ms='mailsync'
alias pdf='zathura'
alias v='nvim'
alias ping='prettyping'
alias pc=~/Projects/personio/personio/perctl
alias pa=~/Projects/personio/admin-panel-service/run.sh
alias pro=~/Projects
alias per=~/Projects/personio
alias mono=~/Projects/personio/personio
alias micro=~/Projects/personio/admin-panel-service
alias dot=~/Projects/dotfiles

rgrep() { grep -rn --exclude-dir=.* --exclude=.* --exclude=tags --exclude-dir=asset* --exclude-dir=log* --exclude=*log* --exclude-dir=public --exclude=*.csv $1 . }
agrep() { grep -rn --exclude=tags --exclude-dir=build --exclude-dir=.idea $1 . }
findfile () { find -name "*$1*" }
dm () { docker-machine $1 $2 $3 $4 $5 $6 $7 $8 $9 }
dcp () { docker-compose -f docker-compose.yml -f docker-compose.prod.yml $1 $2 $3 $4 $5 $6 }
pkill() {
  ps aux | grep $1 | awk '{print $2}' | xargs kill -9
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# setup VPN commands
export PATH="/usr/local/opt/openvpn/sbin:$PATH"
vpnconnect() { sudo openvpn --config ~/.vpn/client.ovpn --auth-user-pass ~/.vpn/creds &> /dev/null & }
vpndisconnect() {
    local pid
    pid=$(ps -ef | sed 1d | grep "openvpn --config" | grep -v "sudo\|grep" | awk '{print $2}' | head -n 1)
    sudo kill -9 $pid
}

# cd faster
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# search, preview and open file
fo() {
  local files
  IFS=$'\n' files=($(fzf --preview "bat --color \"always\" {}" --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# search content and open file
fg() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

# search and kill proccess
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs sudo kill -${1:-9}
  fi
}

# checkout git branch/tag with preview 
fco() {
  local tags branches target
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
        --ansi --preview="git --no-pager log -150 --pretty=format:%s '..{2}'") || return
  git checkout $(awk '{print $2}' <<<"$target" )
}

# fshow - git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# c - browse chrome history
c() {
  local cols sep google_history open
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  if [ "$(uname)" = "Darwin" ]; then
    google_history="$HOME/Library/Application Support/Google/Chrome/Default/History"
    open=open
  else
    google_history="$HOME/.config/google-chrome/Default/History"
    open=xdg-open
  fi
  cp -f "$google_history" /tmp/h
  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs $open > /dev/null 2> /dev/null
}

# lazy load
loadnode() {
  export NVM_DIR="/Users/chau.bao.long/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
}
loadnode

loadk8s() {
  if [ $commands[kubectl] ]; then
    source <(kubectl completion zsh)
  fi
}

# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

# turn on / off wifi
wifi() {
  if [ $1 = 'on' ]; then
    networksetup -setairportpower en0 on
  elif [$1 = 'off' ]; then
    networksetup -setairportpower en0 off
  fi
}

# connect to wifi by $1 is ssid and $2 is pass
wific() {
  networksetup -setairportnetwork en0 $1 $2
}

# show system info at terminal startup
neofetch
