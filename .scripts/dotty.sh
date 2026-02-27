#!/bin/sh

mkdir -p ~/.dotfs/.config/zsh
mkdir -p ~/.dotfs/.config/iterm2
mkdir -p ~/.dotfs/.config/htop
mkdir -p ~/.dotfs/.config/nvim
mkdir -p ~/.dotfs/.config/zathura
mkdir -p ~/.dotfs/.scripts

cp ~/.config/zsh/init.zsh ~/.dotfs/.config/zsh/.
cp ~/.config/zsh/iterm2_shell_integration.zsh ~/.dotfs/.config/zsh/.
cp ~/.zprofile ~/.dotfs/.
cp ~/.zshrc ~/.dotfs/.
cp ~/.config/starship.toml ~/.dotfs/.config/.

cp ~/.config/iterm2/com.googlecode.iterm2.plist ~/.dotfs/.config/iterm2/.

cp ~/.config/htop/htoprc ~/.dotfs/.config/htop/.

cp -r ~/.config/nvim/lua ~/.dotfs/.config/nvim/.
cp -r ~/.config/nvim/templates ~/.dotfs/.config/nvim/.
cp -r ~/.config/nvim/vimscript ~/.dotfs/.config/nvim/.
cp ~/.config/nvim/init.lua ~/.dotfs/.config/nvim/.

cp ~/.config/zathura/zathurarc ~/.dotfs/.config/zathura/.

cp ~/.condarc ~/.dotfs/.
cp ~/.hushlogin ~/.dotfs/.

cp -r ~/.scripts ~/.dotfs/.

cd ~/.dotfs
