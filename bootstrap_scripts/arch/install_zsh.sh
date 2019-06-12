#! /bin/bash

sudo pacman -S --noconfirm zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
if [ ! -d ~/.zsh/zsh-autosuggestions ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-completions ]; then
  git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
fi
if [ -f ~/.oh-my-zsh/themes/agnoster.zsh-theme ]; then
  sed -i 's/blue/cyan/g' ~/.oh-my-zsh/themes/agnoster.zsh-theme
  cd ~/.oh-my-zsh
  git add . && git commit -m "just a tmp commit to keep oh-my-zsh can update properly."
  cd -·
fi
sudo chsh -s $(which zsh)
