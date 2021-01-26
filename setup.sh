#!/bin/bash

# install zsh
sudo apt install zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install rsubl
mkdir ~/bin
curl -o ~/bin/rsubl https://raw.githubusercontent.com/aurora/rmate/master/rmate
chmod +x ~/bin/rsubl
# path link is in .zshrc

# copy custom aliases and functions into .zshrc
cat .zshrc >> ~/.zshrc
