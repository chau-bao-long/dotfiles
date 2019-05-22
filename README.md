# How to install?
```bash
$ make debian
$ make redhat
$ make macos
```
# What is installed?
- zsh
- oh-my-zsh
- vim
- tmux
- ranger 
- qutebrowser
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
### Install Terminal & Setup font
On MacOS, we can install iTerm2 for the main terminal
On Linux, we can install URXVT, Xterm or Konsole for the main terminal
After setup font and terminal successfully on system, remember to change font on terminal to one of powerline-based font.
