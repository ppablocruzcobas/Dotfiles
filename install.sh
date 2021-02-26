#! /bin/sh
#
# Install.sh
# Copyright (C) 2020 Pedro Pablo <ppablocruzcobas@gmail.com>
#
# Distributed under terms of the MIT license.
#


USER="your user here"

# pacman updates...
pacman-mirrors --fasttrack
pacman -Syu --needed --noconfirm
pacman -S yay

# utils installations...
pacman -S expac nmap npm tldr units ruby rubygems luarocks ncdu exa ripgrep the_silver_searcher bat tor nyx rofi yad --needed --noconfirm
# lts installations...
pacman -S clang ctags bash-language-server autopep8 go --needed --noconfirm
# multimedia installations...
pacman -S mpv mpd ncmpcpp playerctl youtube-dl ueberzug clipgrab --needed --noconfirm
# i3 installation...
pacman -S i3exit i3-gaps i3-lock-color scrot i3-status-rust compton feh xfce4-volumed-pulse lxappearance xclip xsel --needed --noconfirm
# general installation...
pacman -S albert redshift calibre simplescreenrecorder qutebrowser pdfjs zathura zathura-djvu zathura-pdf-poppler --needed --noconfirm
# science installations...
pacman -S r gnuplot jupyter jupyterlab graphviz --needed --noconfirm
# fonts installations...
pacman -S ttf-font-awesome --needed --noconfirm
# python installations...
pacman -S python-pip python-numpy python-matplotlib python-scipy --needed --noconfirm
# latex installations...
pacman -S texlive-bin texlive-latexextra texlive-science --needed --noconfirm
# terminal installations...
pacman -S alacritty neovim mc htop git ranger fzf zsh tmux --needed --noconfirm
# game installations...
pacman -S pychess --needed --noconfirm
# libreoffice fresh branch...
pacman -S libreoffice-fresh --needed --noconfirm


# PIP
# dependencies for some albert plugins
sudo -u $USER pip3 install pycountry tzlocal pytz colour fuzzywuzzy lxml clipboard
sudo -u $USER pip3 install --user --upgrade secrets requests cookiecutter
# i3 additional programs
sudo -u $USER pip3 install autotiling i3-workspace-names-daemon
# neovim connectors
sudo -u $USER pip3 install pynvim neovim-remote
# extras...
sudo -u $USER pip3 install subliminal ffsubsync


# NPM
npm i -g neovim
npm i -g create-react-app


# GEM
gem install colorls
gem install neovim
gem install solargraph


# AUR
sudo -u $USER yay -S googler --needed --noconfirm
sudo -u $USER yay -S mendeleydesktop-bundled --needed --noconfirm
sudo -u $USER yay -S mpdris2 --needed --noconfirm
sudo -u $USER yay -S stockfish --needed --noconfirm
sudo -u $USER yay -S zeal --needed --noconfirm
sudo -u $USER yay -S lazygit --needed --noconfirm
sudo -u $USER yay -S beamerpresenter --needed --noconfirm
sudo -u $USER yay -S skypeforlinux-stable-bin --needed --noconfirm
sudo -u $USER yay -S spotify --needed --noconfirm
sudo -u $USER yay -S postman-bin --needed --noconfirm
sudo -u $USER yay -S betterlockscreen --needed --noconfirm
sudo -u $USER yay -S masterpdfeditor-free --needed --noconfirm

# zinit
sudo -u $USERsh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

sudo -u $USER mkdir /home/$USER/.ncmpcpp
sudo -u $USER mkdir /home/$USER/.config/alacritty
sudo -u $USER mkdir /home/$USER/.config/qutebrowser
sudo -u $USER mkdir /home/$USER/.config/mpd
sudo -u $USER mkdir -p /home/$USER/.config/nvim/autoload
sudo -u $USER mkdir -p /home/$USER/.config/mpv/scripts
sudo -u $USER mkdir -p /home/$USER/.config/i3/scripts
sudo -u $USER mkdir -p /home/$USER/.config/ranger/plugins


sudo -u $USER git clone https://github.com/ppablocruzcobas/NVim-Config.git /home/$USER/.config/nvim
sudo -u $USER git clone https://github.com/ppablocruzcobas/Dotfiles

sudo -u $USER mv Dotfiles/zshrc /home/$USER/.zshrc
sudo -u $USER mv Dotfiles/p10k /home/$USER/.p10k.zsh
sudo -u $USER mv Dotfiles/alacritty.yml /home/$USER/.config/alacritty/
sudo -u $USER mv Dotfiles/albert.conf /home/$USER/.config/albert/
sudo -u $USER mv Dotfiles/mpd.conf /home/$USER/.config/mpd/
sudo -u $USER mv Dotfiles/ncmpcpp /home/$USER/.ncmpcpp/config
sudo -u $USER mv Dotfiles/rc.conf /home/$USER/.config/ranger/
sudo -u $USER mv Dotfiles/config.py /home/$USER/.config/qutebrowser/
sudo -u $USER mv Dotfiles/i3 /home/$USER/.config/.i3/config
sudo -u $USER mv Dotfiles/app-icons.json /home/$USER/.config/.i3/
sudo -u $USER mv Dotfiles/i3status-top.toml /home/$USER/.config/.i3/
sudo -u $USER mv -r Dotfiles/scripts/ /home/$USER/.config/.i3/
sudo -u $USER mv Dotfiles/snippets.fzf /home/$USER/.snippets.fzf
rm -Rf Dotfiles/

sudo -u $USER git clone https://github.com/alexanderjeurissen/ranger_devicons /home/$USER/.config/ranger/plugins

cd /home/$USER/.config/mpv/scripts/
sudo -u $USER wget -c https://github.com/kelciour/mpv-scripts/blob/master/sub-search.lua
sudo -u $USER wget -c https://github.com/mpv-player/mpv/raw/master/TOOLS/lua/autoload.lua
sudo -u $USER wget -c https://github.com/AN3223/dotfiles/raw/master/.config/mpv/scripts/auto-save-state.lua
sudo -u $USER wget -c https://github.com/kelciour/mpv-scripts/raw/master/sub-cut.lua
sudo -u $USER wget -c https://github.com/vayan/autosub-mpv/raw/master/autosub.lua
sudo -u $USER wget -c https://github.com/joaquintorres/autosubsync-mpv/raw/master/autosubsync.lua
cd /home/$USER

# CUTILS_VERSION=8.32

# wget -qc http://ftp.gnu.org/gnu/coreutils/coreutils-$CUTILS_VERSION.tar.xz
# tar -xJf coreutils-$CUTILS_VERSION.tar.xz
# rm -f coreutils-$CUTILS_VERSION.tar.xz

# cd coreutils-$CUTILS_VERSION/
# wget -qc https://raw.githubusercontent.com/jarun/advcpmv/master/advcpmv-0.8-$CUTILS_VERSION.patch
# patch -p1 -i advcpmv-0.8-$CUTILS_VERSION.patch
# ./configure
# make

# sh -c 'mv -vf src/cp /usr/bin/cp; cp -vf src/mv /usr/bin/mv'
# cd ../ && rm -rf coreutils-$CUTILS_VERSION/

# sudo -u $USER curl https://cht.sh/:cht.sh > /home/$USER/.local/bin/cht.sh
# chmod a+x /home/$USER/.local/bin/cht.sh

sudo -u $USER git clone https://github.com/zunit-zsh/zunit
cd ./zunit
sudo -u $USER ./build.zsh
chmod u+x ./zunit
sudo -u $USER cp ./zunit /home/$USER/.local/bin
cd ..
rm -Rf zunit/

# sudo -u $USER git clone https://github.com/molovo/revolver revolver
# chmod u+x revolver/revolver
# sudo -u $USER mv revolver/revolver /home/$USER/.local/bin
# rm -Rf revolver/
