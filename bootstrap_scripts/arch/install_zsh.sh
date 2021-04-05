#! /bin/bash

sudo pacman -S --noconfirm zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
if [ ! -d ~/.zsh-defer ]; then
  git clone https://github.com/romkatv/zsh-defer.git ~/.zsh-defer
fi
if [ ! -d ~/.zsh/zsh-autosuggestions ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi
if [ ! -d ~/.zsh/zsh-syntax-highlighting ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
fi
if [ ! -d ~/.zsh/zsh-completions ]; then
  git clone git://github.com/zsh-users/zsh-completions.git ~/.zsh/zsh-completions 
fi
chsh -s $(which zsh)
