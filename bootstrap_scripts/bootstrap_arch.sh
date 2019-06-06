#! /bin/bash
echo "---" 

DOTFILES_ROOT=$(pwd -P)
set -e

info () {
  printf "\r  [\033[00;34m..\033[0m] $1\n"
}

user () {
  printf "\r  [\033[0;33m??\033[0m] $1\n"
}

success () {
  printf "\r\033[2K [\033[00;32mOK\033[0m] $1\n"
}

fail () {
  printf "\r\033[2K [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

link_file () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then

        skip=true;

      else

        user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ] && [ ! -d $1 ] # "false" or empty
  then
    if [[ ! $1 =~ ^\.\/\..*\/.* ]] || [[ $1 =~ ^\.\/\..*\/.*conf.* ]]
    then
      local src="$DOTFILES_ROOT/$(echo $1 | cut -d '/' -f 2,3,4)"
      ln -s $src "$2"
      success "linked $src to $2"
    else
      cp "$1" "$2"
      success "copied file $1 to $2"
    fi
  elif [ "$skip" != "true" ]
  then
    cp -r "$1" "$2"
    success "copied directory $1 to $2"
  fi
}

copy_dotfiles() {
  info 'copying dotfiles to system'

  local overwrite_all=false backup_all=false skip_all=false

  for src in $(find . -maxdepth 3 -regextype sed -regex ".*\(conf.*\|\.\/\..*\)" -not -path '*.git*')
  do
    dst="$HOME/$(echo $src | cut -d '/' -f 2,3,4)"
    link_file "$src" "$dst"
  done
}

install_nvim() {
  read -r -p "Do you want to install neovim? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    info "Installing neovim"
    sudo pacman -S neovim
    sudo pacman -S python python-pip
    success "Installed neovim"
  fi
}

setup_nvim() {
  read -r -p "Do you want to install vim plugins now? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    info "Installing vim plugins"
    nvim +PlugInstall +qall > /dev/null 2>&1
    success "Installed vim plugins"
  else
    success "skipped. Install by running :PlugInstall within vim"
  fi
}

install_tmux() {
  read -r -p "Do you want to install tmux? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    info "Installing tmux"
    sudo pacman -S tmux
    success "Installed tmux"
  fi
}

install_ranger() {
  read -r -p "Do you want to install ranger? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    sudo pacman -S ranger
    sudo pacman -S  highlight
    success "Installed ranger"
  fi
}

install_zsh() {
  read -r -p "Do you want to install zsh? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    sudo pacman -S zsh
    sudo chsh -s $(which zsh)
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    if [ ! -d ~/.zsh/zsh-autosuggestions ]; then
      git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
    fi
    if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-completions ]; then
      git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
    fi
    success "Installed zsh"
    if [ -f ~/.oh-my-zsh/themes/agnoster.zsh-theme ]; then
      sed -i 's/blue/cyan/g' ~/.oh-my-zsh/themes/agnoster.zsh-theme
      cd ~/.oh-my-zsh
      git add . && git commit -m "just a tmp commit to keep oh-my-zsh can update properly."
      cd - 
      success "Updated Agnoster Theme"
    fi
  fi
}

install_browser() {
  read -r -p "Do you want to install qutebrowser? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    sudo pacman -S qutebrowser
    success "Installed qutebrowser"
  fi
}

install_font() {
  read -r -p "Do you want to install font? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts
    success "Installed font powerline!"
  fi
}

setup_git() {
  read -r -p "Do you want to setup git? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    git config --global user.email "chau.bao.long.vn@gmail.com" 
    git config --global user.name "Chau Bao Long" 
    success "Setup git with user.email chau.bao.long.vn@gmail.com and name is Chau Bao Long."
  fi
}

install_suckless() {
  read -r -p "Do you want to install suckless app? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    sudo pacman -S libx11 libxinerama libxft
    rm -rf ~/suckless
    git clone https://git.suckless.org/dwm ~/suckless/dwm
    git clone https://github.com/LukeSmithxyz/st.git ~/suckless/st
    git clone https://git.suckless.org/dmenu ~/suckless/dmenu
    git clone https://git.suckless.org/slstatus ~/suckless/slstatus
    cp ./suckless/dwm/config.h ~/suckless/dwm/
    cp ./suckless/st/config.h ~/suckless/st/
    cp ./suckless/slstatus/config.h ~/suckless/slstatus/
    cd ~/suckless/dwm && sudo make clean install
    cd ~/suckless/st && sudo make clean install
    cd ~/suckless/slstatus && sudo make clean install
    cd ~/suckless/dmenu && sudo make clean install
    echo "exec dwm" > ~/.xinitrc
    ln -s ~/.xinitrc ~/.xsession
    echo "[Desktop Entry]
    Encoding=UTF-8
    Name=DWM window manager
    Comment=Runs DWM window manager defined by xsession script
    Exec=/etc/X11/Xsession
    Type=Application" > /usr/share/xsessions/dwm-session.desktop
    # xrandr && xrandr --output Virtual1 --mode 1920x1200
    success "Installed suckless app"
  fi
}

setup_git
install_nvim
install_ranger
install_tmux
install_zsh
install_browser
install_suckless
copy_dotfiles
setup_nvim
install_font

echo "---" 

echo "Finish Install!"
