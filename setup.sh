#!/bin/bash

# install zsh
sudo apt install zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install rsubl
sudo curl -o /usr/local/bin/rmate https://raw.githubusercontent.com/aurora/rmate/master/rmate
sudo chmod +x /usr/local/bin/rmate
sudo mv /usr/local/bin/rmate /usr/local/bin/rsubl

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

# copy custom aliases and functions into .zshrc
cat .zshrc >> ~/.zshrc


## post installation setup
source ~/.zshrc

# install and use latest lts node
nvm install --lts
nvm use --lts
