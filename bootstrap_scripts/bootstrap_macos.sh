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

install_homebrew() {
  read -r -p "Do you want to install homebrew? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew tap caskroom/cask
    success "Installed homebrew"
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
    brew install neovim
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
    brew install tmux
    success "Installed tmux"
  fi
}

install_ranger() {
  read -r -p "Do you want to install ranger? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    info "Installing ranger"
    brew install ranger
    brew install highlight
    success "Installed ranger"
  fi
}

install_zsh() {
  read -r -p "Do you want to install zsh? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install zsh
    sudo chsh -s $(which zsh)
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    if [ ! -d ~/.zsh/zsh-autosuggestions ]; then
      git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
    fi
    if [ ! -d ~/.zsh/zsh-syntax-highlighting ]; then
      git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
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

install_browser() {
  read -r -p "Do you want to install qutebrowser? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew cask install qutebrowser
    success "Installed qutebrowser"
  fi
}

install_skhd() {
  read -r -p "Do you want to install simple hotkey daemon? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install koekeishiya/formulae/skhd
    brew services start skhd
    success "Installed simple hotkey daemon"
  fi
}

install_window_manager() {
  read -r -p "Do you want to install window manager? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew cask install amethyst
    cp ./mac_config/Amethyst/com.amethyst.Amethyst.plist ~/Library/Preferences/com.amethyst.Amethyst.plist
    success "Installed window manager"
  fi
}

install_ubersicht() {
  read -r -p "Do you want to install ubersicht status bar? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew cask install ubersicht
    cp -r mac_config/Ubersicht/* ~/Library/Application Support/Übersicht
    success "Installed ubersicht status bar"
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

install_terminal() {
  read -r -p "Do you want to install terminal? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew cask install alacritty
    success "Installed terminal"
  fi
}

install_tool() {
  read -r -p "Do you want to setup search? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install s-search
    brew install ripgrep
    brew install neofetch
    brew install pgcli
    brew install mycli
    brew install bat
    brew install httpie
    success "Installed terminal search tool"
  fi
}

install_maccy() {
    read -r -p "Do you want to setup maccy - smarter copy/paste tool? [y|N] " response
    if [[ $response =~ (y|yes|Y) ]];then
        brew cask install maccy
        defaults write org.p0deje.Maccy historySize 100
        defaults write org.p0deje.Maccy hotKey command+shift+v
        defaults write org.p0deje.Maccy pasteByDefault true
        defaults write org.p0deje.Maccy fuzzySearch true
        success "Installed maccy"
    fi
}

install_zathura_pdf() {
  read -r -p "Do you want to install zathura to read pdf file? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew cask install xquartz
    brew tap zegervdv/zathura
    brew install zathura
    brew install zathura-pdf-poppler
    mkdir -p $(brew --prefix zathura)/lib/zathura
    ln -s $(brew --prefix zathura-pdf-poppler)/libpdf-poppler.dylib $(brew --prefix zathura)/lib/zathura/libpdf-poppler.dylib
    success "Installed zathura successfully"
  fi
}

setup_git
install_homebrew
install_nvim
install_ranger
install_tmux
install_browser
install_skhd
install_window_manager
install_ubersicht
install_font
install_terminal
install_tool
install_zsh
copy_dotfiles
setup_nvim
install_zathura_pdf
copy_dotfiles

echo "---" 

echo "Finish Install!"
#! /bin/bash
