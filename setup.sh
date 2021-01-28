#!/bin/bash

sudo apt update

# basic utilities
sudo apt-get install git curl zsh file build-essential fzf man-db fonts-powerline

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install rsubl
sudo curl -o /usr/local/bin/rmate https://raw.githubusercontent.com/aurora/rmate/master/rmate
sudo chmod +x /usr/local/bin/rmate
sudo mv /usr/local/bin/rmate /usr/local/bin/rsubl

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

# install thefuck
sudo apt install python3-dev python3-pip python3-setuptools
sudo pip3 install thefuck

# install zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# copy custom aliases and functions into .zshrc
cat .zshrc >> ~/.zshrc

## ---- post installation setup
source ~/.zshrc

# install and use latest lts node
nvm install --lts
nvm use --lts

npm install -g script-list lerna typescript ts-node prettier auditjs http-server