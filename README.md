# How to install?
```bash
$ make debian
$ make redhat
$ make macos

$ make arch #install base package on arch linux
$ make install_softwares #install mostly used softwares
```
# What is installed?
- git
- zsh + oh-my-zsh + completion + suggestion + theme
- vim
- tmux
- ranger
- font
- link and copy all config files
- homebrew & homecask (package manager for macos)
- Übersicht (status bar for mac os)
- Amethyst (window manager for macos)
- skhd (simple hotkey daemon for macos)
- qutebrowser
- brave (browser)
- zathura (pdf viewer)
- s-search (search from terminal)
- telegram
- sxiv (image viewer)
- cmus (music player)
- mpv (video player)
- maim (take screenshoot)

# More infos!
### Install Git on CentOS 7
Create file `/etc/yum.repos.d/wandisco-git.repo with` content
```
[wandisco-git]
name=Wandisco GIT Repository
baseurl=http://opensource.wandisco.com/centos/7/git/$basearch/
enabled=1
gpgcheck=1
gpgkey=http://opensource.wandisco.com/RPM-GPG-KEY-WANdisco
```
Then run these commands
``` bash
$ sudo rpm --import http://opensource.wandisco.com/RPM-GPG-KEY-WANdisco
$ sudo yum install git
```
### Install Terminal & Setup Font
- On MacOS, we can install iTerm2 for the main terminal
- On Linux, we can install URXVT, Xterm or Konsole for the main terminal
- Setup start command of terminal as `zsh -c ranger` in order to open terminal along with ranger 
- After setup font and terminal successfully on system, remember to change font on terminal to one of powerline-based font.
### Install MailClient
Use [mutt-wizard](https://github.com/LukeSmithxyz/mutt-wizard) to faster bootstrap mail client,
which requires us to setup:
1. neomutt - the email client.
2. isync - downloads and syncs the mail.
3. msmtp - sends the email.
4. pass - safely encrypts passwords
5. w3m - view HTML email and images in neomutt.
6. libnotify/libnotify-bin - allows notifications when syncthing mail with mailsync
7. A cron manager - if you want to enable the auto-sync feature.
8. pam-gnupg - this is a more general program that I use. It automatically logs you into your GPG key on login so you will never need to input your password once logged on to your system. Check the repo and directions out here.
9. urlview - outputs urls in mail to browser.

NOTE: Bug SASL(-7) can solve by adding AuthMechs LOGIN to .mbsyncrc

More work to do:
- Extend key-binding for account by
```bash
$ cat ~/.config/mutt/muttrc-extend >> ~/.config/mutt/accounts/1-longcb.muttrc
```
- Set cron job when I'm on MacOS
```
*/1 * * * * /usr/local/bin/mailsync >/tmp/mailout.log 2>/tmp/mailerr.log
```
- To make pass in gpg-agent does not expire after max-cache-ttl (2 hours), we can set it too 400 days in gpg-agent.conf
```
max-cache-ttl 34560000
default-cache-ttl 34560000
```
### Fix Arch Linux on Mac compability
- Delayed lid switch action
```
/etc/systemd/logind.conf
...
HoldoffTimeoutSec=30s
...
```
- Set default font, add this to beginning of **/etc/fonts/fonts.conf**
```
<!-- Default font (no fc-match pattern) -->
<match>
  <edit mode="prepend" name="family">
    <string>OpenSans</string>
  </edit>
</match>
```
```bash
# list all fonts
$ fc-list
# see current default font
$ fc-match
# see order matching of fonts
$ fc-match -s "San" | less
```
