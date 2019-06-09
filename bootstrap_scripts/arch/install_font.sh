#! /bin/bash

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
echo "Installed font powerline!"
yaourt -S ttf-symbola
echo "Installed font emoji symbola!"
sudo pacman -S --noconfirm ttf-hack
echo "Installed font hack!"
