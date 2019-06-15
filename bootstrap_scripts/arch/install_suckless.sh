#! /bin/bash

sudo pacman -S --noconfirm libx11 libxinerama libxft xorg-xinit xorg
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
cd ~/suckless/st
curl -o scroll.patch http://st.suckless.org/patches/scrollback/st-scrollback-20190331-21367a0.diff
git apply scroll.patch
# compile source
cd ~/suckless/dwm && sudo make clean install
cd ~/suckless/st && sudo make clean install
cd ~/suckless/slstatus && sudo make clean install
cd ~/suckless/dmenu && sudo make clean install

# NOTE
# Run following command to adjust resolution
# xrandr && xrandr --output Virtual1 --mode 1920x1200
