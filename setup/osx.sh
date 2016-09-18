#!/usr/bin/env bash

source colors.sh

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

printf "${GREEN} > ${C}\n"
printf "${GREEN} > Run Mac OS X specific install routine${C}\n"
printf "${GREEN} > ${C}\n"

printf "${GREEN} > Install homebrew${C}\n"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

printf "${GREEN} > Install tools via homebrew${C}\n"
brew install zsh zsh-completions zsh-syntax-highlighting
brew install git
brew install vim
brew install tmux
# Original ctags
# brew install ctags
# PHP improved ctags
curl https://raw.githubusercontent.com/shawncplus/phpcomplete.vim/master/misc/ctags-better-php.rb > /usr/local/Library/Formula/ctags-better-php.rb
brew install ctags-better-php
# Developed ctags
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags

brew install reattach-to-user-namespace

brew install the_silver_searcher
brew install wget
brew install tig

# 3 way gui diff
brew install kdiff3
# Show tree structure of filesystem
brew install tree
# Fussy finder on bash
# brew install fzf
# Ease http requests and wget with highlighting
brew install httpie

# brew install mercurial
# brew install multimarkdown

# Web development (PHP)
brew install mysql
brew install homebrew/php/php56
brew install homebrew/php/php56-opcache
brew install homebrew/php/php56-xdebug
# TODO: Install PHP7

# install validators
# brew install tidy-html5

# File browser
# brew install ranger
# brew install w3m
# http://www.andre-simon.de/doku/highlight/en/highlight.php
# brew install highlight

# Further tools
# Better top
brew install htop
# Top for MySQL (show processlist)
brew install mytop
# Get informed about modifications in filesystem to automate tasks
brew install fswatch
# To generate graphical output, e.g. in plantuml
brew install graphviz

# Optimize pngs, e.g. for website / blog.
brew install pngquant
brew install optipng

# Support desktop software installation
brew install caskroom/cask/brew-cask
# To have a git gui (tree view)
brew cask install sourcetree
