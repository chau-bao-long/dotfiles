#! /bin/bash

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
echo "Installed font powerline!"
yaourt -S ttf-twemoji-color
ln -s /etc/fonts/conf.avail/56-ttf-twemoji-color.conf /etc/fonts/conf.d/56-ttf-twemoji-color.conf
echo "Installed font emoji!"
sudo pacman -S --noconfirm ttf-hack ttf-opensans
echo "Installed font hack!"
