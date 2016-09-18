#!/usr/bin/env bash

source colors.sh

printf "${GREEN} > ${C}\n"
printf "${GREEN} > Run Ubuntu specific install routine${C}\n"
printf "${GREEN} > ${C}\n"

printf "${GREEN} > Update system${C}\n"

sudo apt-get update

printf "${GREEN} > Install tools via apt-get${C}\n"
sudo apt-get install zsh
sudo apt-get install tmux
sudo apt-get install vim
sudo apt-get install git
sudo apt-get install ctags
sudo apt-get install curl
sudo apt-get install php
