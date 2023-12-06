#!/usr/bin/env sh

# run with sudo!

# Voraussetzung: Dieses Skript und alle dazugehörigen dotfiles liegen in ~/dotfiles/
# Finde ich ganz hilfreich: https://www.youtube.com/watch?v=3dJTKsPh7kE

# bash
ln -f .bash_aliases ~/.bash_aliases
ln -f .bashrc ~/.bashrc
ln -f .profile ~/.profile

# fzf
apt install fzf
ln -s bash/ ~/.config/bash/

# Python
apt install python-pip
apt install python-venv
# TODO: setup virtualenvs via requirements.txt <25-11-2023>

# Neovim
wget "https://github.com/neovim/neovim/releases/download/stable/nvim.appimage"
chmod +x "./nvim.appimage"
mv nvim.appimage /usr/bin/
ln -s nvim/ ~/.config/nvim/
ln nvim/misc/nvim.desktop ~/.local/share/applications/
chmod 755 ~/.local/share/applications/nvim.desktop
# Some plugins like UltiSnips need python3 support
python3 -m pip install --user --upgrade pynvim


# kitty
echo "TODO: Installiere kitty, s. Wiki!"
echo "Rechte der .desktop-Dateien unter ~/.local/share/applications/"
ln kitty/ ~/.config/kitty/

# KeePassXC
apt install keepassxc
ln -s .config/keepassxc/ ~/.config/keepassxc/

# Ungoogled Chromium
flatpak install flathub com.github.Eloston.UngoogledChromium

# git
apt install git
ln -f .gitconfig ~/.gitconfig

# tlp
apt install tlp tlp-rdw
tlp start
tlp usb

# grsync
apt install grsync
ln -s .grsync ~/.grsync

# xclip
apt install xclip

# ripgrep
apt install ripgrep

# okular
mkdir -p ~/.local/share/kxmlgui5/okular/
ln .local/share/kxmlgui5/okular/part.rc ~/.local/share/kxmlgui5/okular/part.rc
ln .config/okularrc ~/.config/
ln .config/okularpartrc ~/.config/

# texlive & latexmk
apt install texlive texlive-lang-german texlive-latex-extra texlive-bibtex-extra 
apt install latexmk

# nemo
ln -fs .config/nemo ~/.config/nemo/
ln -fs .local/share/nemo ~/.local/share/nemo/

# Diverses
echo "vm.swappiness=1" >> /etc/sysctl.conf
ln -fs .local/share/fonts ~/.local/share/fonts
ln -fs .config/autostart ~/.config/autostart/
echo "Redshift installieren?"
echo "Syncthing installieren?"
