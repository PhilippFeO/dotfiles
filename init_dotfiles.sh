#!/usr/bin/env sh

# run with sudo!

# Voraussetzung: Dieses Skript und alle dazugehörigen dotfiles liegen in ~/dotfiles/
# Finde ich ganz hilfreich: https://www.youtube.com/watch?v=3dJTKsPh7kE

locale-gen en_US.utf8 # Wird in Neovim gesetzt und sollte deswegen vorhanden sein (im WSL muss man es bspw. nachinstallieren).

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
# pipx ist im Prinzip wie pip, nur dass Pakete „isoliert“ installiert werden: https://pipx.pypa.io/stable/
apt install python3-pip pipx
apt install python3-venv
# TODO: setup virtualenvs via requirements.txt <25-11-2023>


echo "********************** Lua **********************"
# https://github.com/luarocks/luarocks/blob/main/docs/download.md
# https://github.com/luarocks/luarocks/blob/main/docs/installation_instructions_for_unix.md
sudo apt install build-essential libreadline-dev unzip
mkdir -p ~/Downloads
cd ~/Downloads
curl -L -R -O https://www.lua.org/ftp/lua-5.1.5.tar.gz
tar xzf lua-5.1.5.tar.gz
cd lua-5.1.5
# Ohne diese Aufrufe gibt es vllt. eine Fehlermeldung, dass readline.h fehle
sudo apt install libreadline-dev
make linux-readline
make test
echo "********************** Luarocks **********************"
# Für Links s. oben
wget https://luarocks.github.io/luarocks/releases/luarocks-3.13.0.tar.gz
tar xzpf luarocks-3.13.0
cd luarocks-3.13.0
./configure --with-lua-include=/usr/local/include
make
make install


echo "********************** Neovim **********************"
wget "https://github.com/neovim/neovim/releases/download/stable/nvim.appimage"
chmod +x "./nvim.appimage"
mv nvim.appimage /usr/bin/
ln -s nvim/ ~/.config/nvim/
ln nvim/misc/nvim.desktop ~/.local/share/applications/
chmod 755 ~/.local/share/applications/nvim.desktop
echo "********************** Python-Provider **********************"
echo "s. Skript"
# Some plugins like UltiSnips need python3 support, s. `h provider-python`.
# pipx install pynvim
# oder per apt
# apt install python3-pynvim
echo "********************** Debugpy **********************"
mkdir ~/.venv
cd ~/.venv
python3 -m venv debugpy-for-nvim
./debugpy-for-nvim/bin/python -m pip install debugpy

# nodejs, npm für bash-LSP und bash-DAP
# Installation, LTS-Version
# curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - &&\
# sudo apt-get install -y nodejs
# Deinstallation
# apt-get purge nodejs &&\
# rm -r /etc/apt/sources.list.d/nodesource.list &&\
# rm -r /etc/apt/keyrings/nodesource.gpg


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
