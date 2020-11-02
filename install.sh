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
pacman -S expac nmap npm tldr units ruby rubygems ncdu --needed --noconfirm
# lts installations...
pacman -S clang ctags bash-language-server autopep8 
# multimedia installations...
pacman -S mpv mpd ncmpcpp playerctl youtube-dl ueberzug --needed --noconfirm
# i3 installation...
pacman -S i3exit i3-gaps i3-lock-color i3-scrot i3-status-rust compton feh xfce4-volumed-pulse xss-lock lxappearance wmctrl xclip xsel xdotool --needed --noconfirm
# general installation...
pacman -S albert redshift calibre telegram-desktop simplescreenrecorder qutebrowser pdfjs zathura zathura-djvu zathura-pdf-poppler --needed --noconfirm
# science installations...
pacman -S r gnuplot jupyter jupyterlab --needed --noconfirm
# fonts installations...
pacman -S powerline-fonts ttf-font-awesome ttf-nerd-fonts-symbols ttf-inconsolata awesome-terminal-fonts --needed --noconfirm
# python installations...
pacman -S python-pip python-matplotlib python-scipy python-pyopenssl tk --needed --noconfirm
# latex installations...
pacman -S texlive-bin texlive-latexextra texlive-science --needed --noconfirm
# terminal installations...
pacman -S alacritty neovim mc htop git ranger fzf manjaro-zsh-config zsh zsh-autosuggestions zsh-syntax-highlighting zsh-theme-powerlevel10k --needed --noconfirm
# game installations...
pacman -S pychess gnugo --needed --noconfirm


# PIP
# dependencies for some albert plugins
sudo -u $USER pip3 install pycountry tzlocal pytz colour fuzzywuzzy lxml clipboard
sudo -u $USER pip3 install --user --upgrade secrets requests googler cookiecutter
# i3 additional programs
sudo -u $USER pip3 install i3-instant-layout autotiling i3-workspace-names-daemon
# neovim connectors
sudo -u $USER pip3 install pynvim neovim-remote


# NPM
npm i -g flow-language-server
npm i -g neovim


# GEM
gem install colorls
gem install nvim


# AUR
sudo -u $USER yay -S googler --needed --noconfirm
sudo -u $USER yay -S mendeleydesktop-bundled --needed --noconfirm
sudo -u $USER yay -S mpdris2 --needed --noconfirm
sudo -u $USER yay -S stockfish --needed --noconfirm
sudo -u $USER yay -S zeal --needed --noconfirm


# oh-my-zsh
sudo -u $USER sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo -u $USER ln -s /usr/share/zsh/plugins/zsh-syntax-highlighting/ /home/$USER/.oh-my-zsh/custom/plugins/
sudo -u $USER ln -s /usr/share/zsh/plugins/zsh-autosuggestions/ /home/$USER/.oh-my-zsh/custom/plugins/

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

cd Dotfiles/
sudo -u $USER mv zshrc /home/$USER/.zshrc
sudo -u $USER mv alacritty.yml /home/$USER/.config/alacritty/
sudo -u $USER mv albert.conf /home/$USER/.config/albert/
sudo -u $USER mv mpd.conf /home/$USER/.config/mpd/
sudo -u $USER mv autoload.lua /home/$USER/.config/alacritty/
sudo -u $USER mv auto-save-state.lua /home/$USER/.config/mpv/scripts/
sudo -u $USER mv alacritty.yml /home/$USER/.config/mpv/scripts/
sudo -u $USER mv ncmpcpp /home/$USER/.ncmpcpp/config
sudo -u $USER mv rc.conf /home/$USER/.config/ranger/
sudo -u $USER mv config.py /home/$USER/.config/qutebrowser/
sudo -u $USER mv i3 /home/$USER/.config/.i3/config
sudo -u $USER mv app-icons.json /home/$USER/.config/.i3/
sudo -u $USER mv i3status-top.toml /home/$USER/.config/.i3/
sudo -u $USER mv -r scripts/ /home/$USER/.config/.i3/
rm -Rf Dotfiles/

cd /home/$USER/.config/ranger/plugins
sudo -u $USER git clone https://github.com/alexanderjeurissen/ranger_devicons
