#!/bin/bash

dotfiles_dir=$PWD

# Delete existing files
sudo rm -rf ~/.config/nvim/init.vim > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.bash_profile > /dev/null 2>&1
sudo rm -rf ~/.bash_logout > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.config/kitty/kitt.conf> /dev/null 2>&1
sudo rm -rf ~/.config/python/.pythonrc.py > /dev/null 2>&1
sudo rm -rf ~/.octaverc > /dev/null 2>&1

# Create symlinks
ln -sf $dotfiles_dir/nvim/init.vim ~/.config/nvim/init.vim 
ln -sf $dotfiles_dir/tmux/.tmux.conf ~/.tmux.conf 
ln -sf $dotfiles_dir/bash/.bashrc ~/.bashrc
ln -sf $dotfiles_dir/bash/.bash_profile ~/.bash_profile
ln -sf $dotfiles_dir/bash/.bash_logout ~/.bash_logout
ln -sf $dotfiles_dir/git/.gitconfig ~/.gitconfig
ln -sf $dotfiles_dir/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sf $dotfiles_dir/python/.pythonrc.py ~/.config/python/.pythonrc.py 
ln -sf $dotfiles_dir/octave/.octaverc ~/.octaverc
