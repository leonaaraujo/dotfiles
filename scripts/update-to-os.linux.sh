#!/usr/bin/env bash

proj_home="$(dirname $0)/.."

alacritty_conf="$proj_home/.config/alacritty/alacritty.linux.yml"
nvim_conf="$proj_home/.config/nvim/init.vim"
vim_conf="$proj_home/.vimrc"
vscode_conf="$proj_home/Code/User/settings.json"
tmux_conf="$proj_home/.tmux.conf"
bash_conf="$proj_home/.bashrc"
theme_file="$proj_home/.oh-my-bash/themes/gitbasher/gitbasher.theme.sh"

test -d "$HOME/.config/nvim" || mkdir -p "$HOME/.config/nvim"
test -d "$HOME/.config/alacritty" || mkdir -p "$HOME/.config/alacritty"
test -d "$HOME/.config/Code/User" || mkdir -p "$HOME/.config/Code/User"
test -d "$HOME/.oh-my-bash/themes/gitbasher" || mkdir -p "$HOME/.oh-my-bash/themes/gitbasher"

cp -v "$nvim_conf" "$HOME/.config/nvim/init.vim"
cp -v "$vim_conf" "$HOME/.vimrc"
cp -v "$alacritty_conf" "$HOME/.config/alacritty/alacritty.yml"
cp -v "$vscode_conf" "$HOME/.config/Code/User/settings.json"
cp -v "$tmux_conf" "$HOME/.tmux.conf"
cp -v "$bash_conf" "$HOME/.bashrc"
cp -v "$theme_file" "$HOME/.oh-my-bash/themes/gitbasher/gitbasher.theme.sh"
