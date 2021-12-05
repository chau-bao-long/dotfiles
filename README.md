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
- emacs
- alacritty (terminal)
- ranger
- suckless tools (dwm + dmenu + slstatus + st)
- font
- link and copy all config files
- homebrew & homecask (package manager for macos) + vimac (vimium for macos)
- Yabai (window manager for macos)
- skhd (simple hotkey daemon for macos)
- telegram
- sxiv (image viewer)
- cmus (music player)
- mpv (video player)
- maim (take screenshoot)
- neofetch (command-line system information)
- cava (console-based audio visualizer)
- pass (manage all passwords using gpg key)
- exa (modern version of ls)
- z (jump around by ranking folder)

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

### Use vim combine with IntelliJ IDEA
- Install vimidea plugin, make sure ~/.ideavimrc is copied
- Install referencer plugin, change keyboard shortcut for easier to type
- Create idea bin for vim to interact with IDEA, go to tools -> create command-line launcher

### Setup pass
- Clone pass repository from github to ~/.password-store
- Export gpg-key from old machine (key-id from `gpg --list-keys | grep -n1 topcbl`)
```bash
gpg --export-secret-keys key-id > private.key
```
- Import gpg-key to new machine
```bash
gpg --import private.key
```
- Trust the new key
```bash
gpg --edit-key key-id
gpg> trust

- To change passphrase for the key
```bash
gpg --change-passphrase topcbl
```
