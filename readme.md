FireFox
    * install betterfox
    * install ublock origin
    * install vue devtools
    * install better youtube shorts
    * install dislike button by KellyC
    * install tabnumbers
    * install react devtools (optional)

MERCURY BROWSER (optional)
    * download and install mercury browser
        ** Link: https://linuxtldr.com/installing-mercury-browser/
    * same extensions as firefox

GIT
    * Install git
    * Install xclip
        ** Link: https://zoomadmin.com/HowToInstall/UbuntuPackage/xclip
    * SSH & GPG keys setup for github
        1. ssh-keygen -t rsa -b 4096 -C '[EMAIL]'
        2. press enter 
        3. Enter passphrase
        4. Confirm passphrase
        5. eval $(ssh-agent -s)
        6. ssh-add ~/.ssh/id_rsa
        7. Enter the given passphrase
        8. xclip -sel clip < ~/.ssh/id_rsa.pub
        9. paste the key in github

NODEJS
    * Install nodejs and npm
    * Install nvm
    * Install the LTS node version
    * Install typescript globally

ALACRITTY
    * Install alacritty from snap
        ** `sudo snap install alacritty --classic`
    * clone the alacritty config

TMUX
    * Install tmux
    * clone the tmux config

ZSH
    * OhMyZsh
    * clone zshconfig
    * plugins
        ** fish like autosuggestions
        ** syntax higlighting
        ** command-not-found

FZF
    * Install fzf

NEOVIM
    * install neovim
        ** Link: https://github.com/neovim/neovim/blob/master/BUILD.md
        ** git checkout stable
    * Clone NeoConfig
    * Install ripgrep
    * Install g++
    * LSPs to install:
        * intelephense
        * pyright
        * tailwindcss
        * volar
            * Make sure the tsdk is pointing to the global typescript installation in the nvm dir for nodejs

I3
    * Install FiraCode nerdfont
    * Clone the i3config

VLC
    * `sudo snap install vlc`

Brave
    * sudo snap install brave

Discord
    * sudo snap install discord

WHATSAPP-FOR-LINUX
    * `sudo snap install whatsapp-for-linux`
