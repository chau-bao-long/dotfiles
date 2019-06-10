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
    ./bootstrap_scripts/arch/install_nvim.sh
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
    ./bootstrap_scripts/arch/install_ranger.sh
    success "Installed ranger"
  fi
}

install_zsh() {
  read -r -p "Do you want to install zsh? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    ./bootstrap_scripts/arch/install_zsh.sh
    success "Installed zsh"
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
    ./bootstrap_scripts/arch/install_font.sh
    success "Installed font!"
  fi
}

setup_git() {
  read -r -p "Do you want to setup git? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    ./bootstrap_scripts/arch/setup_git.sh
    success "Setup git with user.email chau.bao.long.vn@gmail.com and name is Chau Bao Long."
  fi
}

install_suckless() {
  read -r -p "Do you want to install suckless app? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    ./bootstrap_scripts/arch/install_suckless.sh
    success "Installed suckless app"
  fi
}

install_yaourt() {
  read -r -p "Do you want to install yaourt, which allow us to use AUR repos? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    ./bootstrap_scripts/arch/install_yaourt.sh
    success "Installed yaourt"
  fi
}

install_input_method() {
  read -r -p "Do you want to install input method framework? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    ./bootstrap_scripts/arch/install_input_method.sh
    success "Installed input method framework"
  fi
}

install_mail_client() {
  read -r -p "Do you want to install mail client? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    ./bootstrap_scripts/arch/install_input_method.sh
    success "Installed mail client, you still need to do further manual jobs to make it really work!!"
  fi
}

install_pdf_viewer() {
  read -r -p "Do you want to install pdf viewer? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    sudo pacman -S --noconfirm zathura zathura-pdf-mupdf
    success "Installed pdf viewer"
  fi
}

setup_git
./bootstrap_scripts/arch/arch_core.sh
install_nvim
install_ranger
install_tmux
install_zsh
install_browser
copy_dotfiles
install_yaourt
install_font
install_suckless
install_pdf_viewer
setup_nvim

echo "---" 

echo "Finish Install!"
