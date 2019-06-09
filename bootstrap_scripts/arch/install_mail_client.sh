#! /bin/bash

sudo pacman -S -noconfirm neomutt isync msmtp pass w3m cronie
sudo systemctl enable cronie.service
sudo systemctl start cronie.service
git clone https://github.com/LukeSmithxyz/mutt-wizard
cd mutt-wizard
sudo make install
cd ..
rm -rf mutt-wizard
