#!/usr/bin/env bash

proj_home="$(dirname $0)/.."

sudo apt update

# Install os packages
sudo apt install -y curl wget git silversearcher-ag

# Install python
command -v python3 || {
  sudo apt install -y build-essential
  sudo apt install -y python3.8 python3-pip
  sudo rm -rfv /usr/bin/python
  ln -s /usr/bin/python3 /usr/bin/python
}

# Install tmux
sudo apt install -y tmux

# Install pip required modules
python -m pip install --upgrade pip
pip install -r "$proj_home/requirements.txt"

# Install dotnet sdk
wget https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-5.0
sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y aspnetcore-runtime-5.0

# Install alacritty
sudo apt update
sudo apt install -y alacritty

# Install neovim
sudo apt-get install -y luajit
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt update
sudo apt install -y neovim

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install oh-my-bash
bash -c "$(curl -sSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# Install vscode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install -y code

# TODO: install vscode plugins.

# Install tmux plugin manager
git clone git@github.com:tmux-plugins/tpm ~/.tmux/plugins/tpm

make update-to-os
nvim +PlugInstall +qall
