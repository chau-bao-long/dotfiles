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
    sudo pacman -S --noconfirm neovim
    sudo pacman -S --noconfirm python python-pip
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
    sudo pacman -S --noconfirm tmux
    success "Installed tmux"
  fi
}

install_ranger() {
  read -r -p "Do you want to install ranger? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    sudo pacman -S --noconfirm ranger
    sudo pacman -S --noconfirm highlight
    sudo pacman -S --noconfirm fzf
    sudo pacman -S --noconfirm the_silver_searcher
    success "Installed ranger"
  fi
}

install_zsh() {
  read -r -p "Do you want to install zsh? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    sudo pacman -S --noconfirm zsh
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
    sudo pacman -S --noconfirm qutebrowser
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
    yaourt -S ttf-symbola
    success "Installed font emoji symbola!"
    sudo pacman -S --noconfirm ttf-hack
    success "Installed font hack!"
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
    sudo pacman -S --noconfirm libx11 libxinerama libxft
    rm -rf ~/suckless
    # clone repo
    git clone https://git.suckless.org/dwm ~/suckless/dwm
    git clone https://git.suckless.org/st ~/suckless/st
    git clone https://git.suckless.org/dmenu ~/suckless/dmenu
    git clone https://git.suckless.org/slstatus ~/suckless/slstatus
    # apply config
    cp ./suckless/dwm/config.h ~/suckless/dwm/
    cp ./suckless/st/config.h ~/suckless/st/
    cp ./suckless/slstatus/config.h ~/suckless/slstatus/
    # apply patch
    curl -o srcoll.patch http://st.suckless.org/patches/scrollback/st-scrollback-20190331-21367a0.diff
    git apply scroll.patch
    # compile source
    cd ~/suckless/dwm && sudo make clean install
    cd ~/suckless/st && sudo make clean install
    cd ~/suckless/slstatus && sudo make clean install
    cd ~/suckless/dmenu && sudo make clean install
    # config window manager
    echo "slstatus &
    xrandr --output Virtual-1 --mode 1440x900
    fcitx &
    dunst &
    ~/bin/startdwm" > ~/.xinitrc
    ln -s ~/.xinitrc ~/.xsession
    echo "[Desktop Entry]
    Encoding=UTF-8
    Name=DWM window manager
    Comment=Runs DWM window manager defined by xsession script
    Exec=/etc/X11/Xsession
    Type=Application" > /usr/share/xsessions/dwm-session.desktop
    success "Installed suckless app"
  fi
}

install_yaourt() {
  read -r -p "Do you want to install yaourt, which allow us to use AUR repos? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    sudo pacman -S --needed base-devel git wget yajl
    git clone https://aur.archlinux.org/package-query.git
    cd package-query/
    makepkg -si
    cd ..
    git clone https://aur.archlinux.org/yaourt.git
    cd yaourt/
    makepkg -si
    cd ..
    sudo rm -dR yaourt/ package-query/
  fi
}

core_script_n_command() {
  # copy scripts to user bin
  if [ ! -d ~/bin ]; then
    mkdir -p ~/bin
    cp ./scripts/* ~/bin
  fi
  # core command
  sudo pacman -S --noconfirm net-tools openbsd-netcat htop xclip mlocate unzip ntp
  sudo pacman -S --noconfirm alsa-utils dunst
  sudo systemctl enable ntpd
  sudo systemctl start ntpd
  sudo timedatectl set-ntp on
}

install_input_method() {
  read -r -p "Do you want to install input method framework? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    sudo pacman -S --noconfirm fcitx fcitx-unikey fcitx-im fcitx-configtool
    echo "GTK_IM_MODULE=fcitx
    QT_IM_MODULE=fcitx
    XMODIFIERS=@im=fcitx
    " > ~/.pam_environment
    # Extra Work: still need to go to $ fcitx-configtool to set hot key alt + ; and unikey method
    success "Installed input method framework"
  fi
}

install_mail_client() {
  read -r -p "Do you want to install mail client? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    sudo pacman -S -noconfirm neomutt isync msmtp pass w3m cronie
    sudo systemctl enable cronie.service
    sudo systemctl start cronie.service
    git clone https://github.com/LukeSmithxyz/mutt-wizard
    cd mutt-wizard
    sudo make install
    cd ..
    rm -rf mutt-wizard
    success "Installed mail client, you still need to do further manual jobs to make it really work!!"
  fi
}

setup_git
core_script_n_command
install_nvim
install_ranger
install_tmux
install_zsh
install_browser
copy_dotfiles
install_yaourt
install_font
install_suckless
setup_nvim

echo "---" 

echo "Finish Install!"
