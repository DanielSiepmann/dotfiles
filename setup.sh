#!/usr/bin/env bash

source colors.sh
printf "${GREEN} > Create or update user symlinks${C}\n"
ln -fFs ~/.dotfiles/.ctags ~/.ctags
ln -fFs ~/.dotfiles/.gitconfig ~/.gitconfig
ln -fFs ~/.dotfiles/.gitignore_global ~/.gitignore_global
ln -fFs ~/.dotfiles/.gitmessage-typo3.txt ~/.gitmessage-typo3.txt
ln -fFs ~/.dotfiles/.hgrc ~/.hgrc
ln -fFs ~/.dotfiles/.profile ~/.profile
ln -fFs ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -fFs ~/.dotfiles/.vim ~/.vim
ln -fFs ~/.dotfiles/.vimrc ~/.vimrc
ln -fFs ~/.dotfiles/.zshrc ~/.zshrc
ln -fFs ~/.dotfiles/global_hgignore ~/.hgignore
ln -fFs ~/.dotfiles/.agignore ~/.agignore
ln -fFs ~/.dotfiles/ranger ~/.ranger

printf "${GREEN} > Create ~/bin folder${C}\n"
mkdir ~/bin
printf "${GREEN} > Symlinks binaries to ~/bin folder${C}\n"
ln -fFs ~/.dotfiles/bin/decode_sphinx_inventory ~/bin/
ln -fFs ~/.dotfiles/bin/pdepend ~/bin/
ln -fFs ~/.dotfiles/bin/sphinxProject ~/bin/
ln -fFs ~/.dotfiles/bin/customerProject ~/bin/
ln -fFs ~/.dotfiles/bin/diff-highlight ~/bin/

printf "${GREEN} > Execute OS specifix install routine${C}\n"
if [[ -f "/etc/issue" && "$(cat /etc/issue | head -n1 | awk '{print $1;}')" == "Ubuntu" ]]; then
    ~/.dotfiles/setup/ubuntu.sh
elif [ "$(sw_vers -productName)" == "Mac OS X" ]; then
    ~/.dotfiles/setup/osx.sh
fi

# Doesn't work yet to determine :(
if [ -d "~/.composer" ]; then
    printf "${GREEN} > Composer already exists${C}\n"
else
    printf "${GREEN} > Install Composer${C}\n"
    # mkdir ~/.composer
    # curl -sS https://getcomposer.org/installer | php -- --install-dir=~/.composer
    # rm ~/.composer/composer.json
    # ln -s ~/.dotfiles/composer.json ~/.composer/composer.json
    printf "${YELLOW} > TODO!!! Finish install of Composer${C}\n"
fi

~/.dotfiles/setup/independent.sh
