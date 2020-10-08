# lazyload zsh - boost zsh startup time
source ~/.zsh-defer/zsh-defer.plugin.zsh
PS1="%F{12}%~%f "
RPS1="%F{240}Loading...%f"

# Backup good themes:
# ZSH_THEME="jnrowe"
# ZSH_THEME="spaceship"

# Current theme         https://github.com/sindresorhus/pure
# How to install        npm install --global pure-prompt
zstyle :prompt:pure:path color white
zstyle ':prompt:pure:prompt:*' color cyan
zstyle :prompt:pure:git:stash show yes

plugins=(
  git
  osx
  zsh-completions
  pass
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
zsh-defer source ~/Projects/dotfiles/scripts/z.sh
zsh-defer source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
zsh-defer source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
[ -f ~/.fzf.zsh ] && zsh-defer source ~/.fzf.zsh

export GPG_TTY=`tty`

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
zsh-defer -c "eval $(pyenv init -)"

# PHP to PATH
export PATH="/usr/local/opt/php@7.3/bin:$PATH"
export PATH="/usr/local/opt/php@7.3/sbin:$PATH"
export LDFLAGS="-L/usr/local/opt/php@7.3/lib"
export CPPFLAGS="-I/usr/local/opt/php@7.3/include"
export PATH="$HOME/.composer/vendor/bin:$PATH"

# CMake to PATH
export PATH="/Applications/CMake.app/Contents/bin":"$PATH"

# User bin folder to PATH
export PATH="$HOME/bin:$PATH"
export VISUAL=nvim
export EDITOR="$VISUAL"
export PASSWORD_STORE_ENABLE_EXTENSIONS=true

# Git shortcut
alias g='git'
alias gca="git add . && git commit --allow-empty --amend"
alias gst="git status"
alias gls="git log --oneline --no-merges"
alias gll="git log --graph"
alias grl="git reflog"
alias gci="git add . && git commit --allow-empty -m "
alias gcf="git add . && git commit --fixup HEAD"
alias grbi="git rebase -i --autosquash "
alias grbm="git pull origin master --rebase"
alias grbd="git pull origin develop --rebase"
alias grb="git rebase"
alias gbr="git branch"
alias gco="git checkout"
alias grbc="git add . && git rebase --continue"
alias gpf="git push -f"
alias gp="git push"
alias gpr="git rev-parse --abbrev-ref HEAD | xargs -I {} git push -u origin {}"
alias gtd="git tag -d "
alias gprb="git pull --rebase"
alias gcod="git fetch origin && git checkout origin/develop"
alias gcom="git fetch origin && git checkout origin/master"
alias gd="git diff"
alias grs="git reset"
alias grsh="git reset --hard"
alias grss="git reset --soft"
alias grsc="git reset --hard; git clean -fd"
alias gfo="git fetch origin"
grsr() { git reset --hard HEAD@{$1} }
grsn() { git reset HEAD~$1 }

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
alias kwp='watch kubectl get pod -owide'
kct () { kubectl config use-context $1 }
kns () { kubectl config set-context $(kubectl config current-context) --namespace=$1 }
kdevict() { kubectl get pods | grep Evicted | awk '{print $1}' | xargs kubectl delete pod }

# some custom alias and functions
alias v=nvim
alias pdf=zathura
alias la='exa -lahg --icons'
alias ll='exa -lhg --icons'
alias tree='exa -T -L3 --icons'
alias ping=prettyping
alias pc=~/Projects/personio/personio/perctl
plog() { echo "" > ~/Projects/personio/personio/app/storage-local/logs/laravel.log; lnav ~/Projects/personio/personio/app/storage-local/logs/laravel.log }

# quickly go to project
fper() { cd ~/Projects/personio/$(ls ~/Projects/personio/ | fzf) }
fpro() { cd ~/Projects/$(ls ~/Projects/ | fzf) }
ff() { cd ./$(ls | fzf) }

fpass() {
  local pass=$(ls ~/.password-store | fzf +m | sed "s/.gpg//g")
  local info=$(pass tail $pass)
  echo $fg[yellow] $info
  echo $info | pbcopy
  pass -c $pass | xargs -I {} echo $fg[blue] {};
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
  filepath=$(rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}")
  [[ -n "$filepath" ]] && ${EDITOR:-vim} "${filepath[@]}"
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

# fgit - git commit browser
fgit() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# fetch and checkout origin branch
gcoo() {
  git fetch origin $1 && git checkout origin/$1
}

# fetch and checkout remote branch by name
gcor() {
  local branches=$(git fetch origin && git branch -r | grep $1)
  local count=$(echo $branches | wc -l)
  echo "=> Found following branches:"
  echo $branches
  if [ $count -gt 1 ]; then
    echo " "
    read "ans?=> Please pick which branch to check out [1, 2, 3 or ...]: "
  fi
  echo $branches | head -n"${ans:-1}" | tail -n1 | xargs git checkout
}

gh() {
  local repo=$(git remote -v | head -n1 | cut -d ':' -f2 | sed 's/.git (fetch)//g')
  open "https://github.com/$repo"
}

# Open merge request on gitlab
gmr() {
  local gitlab=$(git remote -v | head -n1 | awk '{print $2}' | cut -d'@' -f2 | sed 's/.git//g' | sed 's/:/\//g')

  if [ -z "$1" ]; then
    ticket=$(git describe --all | grep -Eo "/.*\d+-" | sed 's/\/task\///g' | sed 's/-$//g')

    if [ -n "$ticket" ]; then
      echo "$ticket" | xargs -I {} open https://$gitlab/merge_requests\?state=all\&search\=\{\}
    else
      open https://$gitlab/$team/$project/merge_requests
    fi
  else
    local keyword=''
    for var in "$@"; do
      keyword=$keyword" "$var
    done
    open https://$gitlab/merge_requests\?state=all\&search\=$keyword
  fi
}

gjr() {
  local jira=https://personio.atlassian.net
  git describe --all | grep -Eo "..-\d+" | xargs -I {} open $jira/browse/\{\}
}

# Run frequently used commands
# First param take local path to set of commands, i.e. ~/local/cmds
frun() {
  echo $1
  local cmd=$(cat $1 | fzf)
  if [ -n "$cmd" ]; then
    local escape=$(echo $cmd | sed 's/[]\/$*.^[]/\\&/g')
    echo -e "$cmd\n$(cat $1 | sed "s/$escape//g" | sed '/^$/d')" > $1
    echo ""
    echo $fg[yellow] "$cmd"
    echo ""
    eval $cmd
  else
    echo $fg[red] "Run nothing!"
  fi
}

# launch app
fapp() {
  local app=$(ls /Applications | sed 's/.app//g' | fzf)
  open -a $app
}

# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

# turn on / off wifi
wifi() {
  if [ $1 = 'on' ]; then
    networksetup -setairportpower en0 on
  elif [ $1 = 'off' ]; then
    networksetup -setairportpower en0 off
  fi
}

# connect to wifi by $1 is ssid and $2 is pass
wific() {
  networksetup -setairportnetwork en0 $1 $2
}

# setup VPN commands
export PATH="/usr/local/opt/openvpn/sbin:$PATH"
vpnconnect() {
  rm /tmp/vpn.log &> /dev/null
  sudo openvpn --config ~/.vpn/client.ovpn --auth-user-pass ~/.vpn/creds &> /tmp/vpn.log & 
  tail -f /tmp/vpn.log
}
vpndisconnect() {
  local pid
  pid=$(ps -ef | sed 1d | grep "openvpn --config" | grep -v "sudo\|grep" | awk '{print $2}' | head -n 1)
  sudo kill -9 $pid
}
vpnresetconnect() {
  echo "Disconnect VPN"
  vpndisconnect
  sleep 0.5
  echo "Turn off wifi"
  wifi off
  sleep 1.5
  echo "Flush route"
  sudo route flush
  sleep 1
  echo "Turn on wifi"
  wifi on
  sleep 2
  echo "Connect VPN"
  vpnconnect
}

k8s() {
  if [ $commands[kubectl] ]; then
    source <(kubectl completion zsh)
  fi
}

# fuzzy search browse chrome history
fchrome() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  cp -f ~/Library/Application\ Support/Google/Chrome/Default/History /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}

# Change Cursor Shape for Zsh Vi-mode
# http://micahelliott.com/posts/2015-07-20-vim-zsh-tmux-cursor.html
zle-line-init () {
    zle -K viins
    echo -ne "\033]12;Gray\007"
    echo -ne "\033[4 q"
}
zle -N zle-line-init
zle-keymap-select () {
    if [[ $KEYMAP == vicmd ]]; then
        if [[ -z $TMUX ]]; then
            printf "\033]12;Green\007"
            printf "\033[2 q"
        else
            printf "\033Ptmux;\033\033]12;red\007\033\\"
            printf "\033Ptmux;\033\033[2 q\033\\"
        fi
    else
        if [[ -z $TMUX ]]; then
            printf "\033]12;Grey\007"
            printf "\033[4 q"
        else
            printf "\033Ptmux;\033\033]12;grey\007\033\\"
            printf "\033Ptmux;\033\033[4 q\033\\"
        fi
    fi
}
zle -N zle-keymap-select

# zsh frequently key binding
# prefix edddddddddd to remove all current text lines before execute command
bindkey -s "^[f" "\edddddddddd iranger\n"
bindkey -s "^[n" "\edddddddddd i~/bin/nvim-osx64/bin/nvim \n"
bindkey -s "^[r" "\edddddddddd i./run.sh "
bindkey -s "^k" "\edddddddddd ifrun ~/local/cmds\n"
bindkey -s "^u" "\edddddddddd i"
bindkey -s "^[a" "\edddddddddd ifpass\n"
bindkey '^f' forward-word

# Load pure theme afterward
autoload -U promptinit; promptinit
prompt pure

zsh-defer -c 'RPS1="%F{240}%f"'
