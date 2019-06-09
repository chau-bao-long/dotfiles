# How to install?
```bash
$ make debian
$ make redhat
$ make macos
```
# What is installed?
- git
- zsh + oh-my-zsh + completion + suggestion + theme
- vim
- tmux
- ranger 
- qutebrowser
- font
- link and copy all config files
- homebrew & homecask (package manager for macos)
- Übersicht (status bar for mac os)
- chunkwm (tilling window manager for macos)
- skhd (simple hotkey daemon for macos)

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
