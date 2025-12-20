#!/usr/bin/env bash

proj_home="$(dirname $0)/.."

alacritty_conf="$HOME/.config/alacritty/alacritty.yml"
nvim_conf="$HOME/.config/nvim/init.vim"
vim_conf="$HOME/.vimrc"
vscode_conf="$HOME/.config/Code/User/settings.json"
tmux_conf="$HOME/.tmux.conf"
bash_conf="$HOME/.bashrc"
theme_file="$HOME/.oh-my-bash/themes/gitbasher/gitbasher.theme.sh"

test -f "$nvim_conf" && cp -v "$nvim_conf" "$proj_home/.config/nvim/init.vim"
test -f "$vim_conf" && cp -v "$vim_conf" "$proj_home/.vimrc"
test -f "$alacritty_conf" && cp -v "$alacritty_conf" "$proj_home/.config/alacritty/alacritty.linux.yml"
test -f "$vscode_conf" && cp -v "$vscode_conf" "$proj_home/Code/User/settings.json"
test -f "$tmux_conf" && cp -v "$tmux_conf" "$proj_home/.tmux.conf"
test -f "$bash_conf" && cp -v "$bash_conf" "$proj_home/.bashrc"
test -f "$theme_file" && cp -v "$theme_file" "$proj_home/.oh-my-bash/themes/gitbasher/gitbasher.theme.sh"
