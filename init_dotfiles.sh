#!/usr/bin/env sh

# run with sudo!

# Voraussetzung: Dieses Skript und alle dazugehörigen dotfiles liegen in ~/dotfiles/
# Finde ich ganz hilfreich: https://www.youtube.com/watch?v=3dJTKsPh7kE


echo "********************** systemd **********************"
mkdir -p ~/.config/systemd
ln -s ~/dotfiles/.config/systemd/user/ user/
mv user/ ~/.config/systemd
systemctl --user enable push-repos.service pull-repos.service


echo "********************** bash **********************"
ln -f .bash_aliases ~/.bash_aliases
ln -f .bashrc ~/.bashrc
ln -f .profile ~/.profile


echo "********************** fzf **********************"
# Are files in ~/.config/bash/ sourced in .bashrc?
apt install fzf
ln -s bash/ ~/.config/bash/


echo "********************** Python **********************"
apt install python-pip
apt install python-venv
# TODO: setup virtualenvs via requirements.txt <25-11-2023>


echo "********************** Neovim **********************"
wget "https://github.com/neovim/neovim/releases/download/stable/nvim.appimage"
chmod +x "./nvim.appimage"
mv nvim.appimage /usr/bin/
ln -s nvim/ ~/.config/nvim/
ln nvim/misc/nvim.desktop ~/.local/share/applications/
chmod 755 ~/.local/share/applications/nvim.desktop
# Some plugins like UltiSnips need python3 support
python3 -m pip install --user --upgrade pynvim
# nodejs, npm für bash-LSP und bash-DAP
# Installation, LTS-Version
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - &&\
sudo apt-get install -y nodejs
# Deinstallation
apt-get purge nodejs &&\
rm -r /etc/apt/sources.list.d/nodesource.list &&\
rm -r /etc/apt/keyrings/nodesource.gpg


echo "********************** kitty **********************"
echo "TODO: Installiere kitty, s. Wiki!"
echo "Rechte der .desktop-Dateien unter ~/.local/share/applications/"
ln kitty/ ~/.config/kitty/


echo "********************** KeePassXC **********************"
apt install keepassxc
ln -s .config/keepassxc/ ~/.config/keepassxc/


echo "********************** Ungoogles Chromium **********************"
flatpak install flathub com.github.Eloston.UngoogledChromium


echo "********************** git **********************"
apt install git
ln -f .gitconfig ~/.gitconfig


echo "********************** tlp **********************"
apt install tlp tlp-rdw
tlp start
tlp usb


echo "********************** grsync **********************"
apt install grsync
ln -s .grsync ~/.grsync


echo "********************** xclip **********************"
apt install xclip


echo "********************** ripgrep **********************"
apt install ripgrep


echo "********************** okular **********************"
mkdir -p ~/.local/share/kxmlgui5/okular/
ln .local/share/kxmlgui5/okular/part.rc ~/.local/share/kxmlgui5/okular/part.rc
ln .config/okularrc ~/.config/
ln .config/okularpartrc ~/.config/


echo "********************** texlive & latexmk **********************"
apt install texlive texlive-lang-german texlive-latex-extra texlive-bibtex-extra 
apt install latexmk


echo "********************** nemo **********************"
ln -fs .config/nemo ~/.config/nemo/
ln -fs .local/share/nemo ~/.local/share/nemo/


echo "********************** Diverses **********************"
echo "vm.swappiness=1" >> /etc/sysctl.conf
ln -fs .local/share/fonts ~/.local/share/fonts
ln -fs .config/autostart ~/.config/autostart/
echo "Redshift installieren?"
echo "Syncthing installieren?"
