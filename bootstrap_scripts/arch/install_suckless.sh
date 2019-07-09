#! /bin/bash

sudo pacman -S --noconfirm libx11 libxinerama libxft xorg-xinit xorg xcompmgr transset-df keynav
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
curl -o alpha.patch https://st.suckless.org/patches/alpha/st-alpha-0.8.2.diff
git apply scroll.patch
git apply alpha.patch
cd ~/suckless/dwm
curl -o alpha.patch https://dwm.suckless.org/patches/alpha/dwm-alpha-20180613-b69c870.diff
curl -o rotatestack.patch https://dwm.suckless.org/patches/rotatestack/dwm-rotatestack-20161021-ab9571b.diff
curl -o movestack.patch https://dwm.suckless.org/patches/push/dwm-6.1-push_no_master.diff
cp ~/dotfiles/suckless/dwm/shiftview.diff .
git apply alpha.patch
git apply rotatestack.patch
git apply movestack.patch
git apply shiftview.diff
# compile source
cd ~/suckless/dwm && sudo make clean install
cd ~/suckless/st && sudo make clean install
cd ~/suckless/slstatus && sudo make clean install
cd ~/suckless/dmenu && sudo make clean install

# NOTE
# Run following command to adjust resolution
# xrandr && xrandr --output Virtual1 --mode 1920x1200
