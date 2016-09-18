#!/bin/bash

source colors.sh

printf "${GREEN} > ${C}\n"
printf "${GREEN} > Run independent specific install routine${C}\n"
printf "${GREEN} > ${C}\n"

printf "${GREEN} > Install gems ${C}\n"
printf "${GREEN} > Install compass ${C}\n"
sudo gem install compass --no-document
printf "${GREEN} > Install mailcatcher ${C}\n"
sudo gem install mailcatcher --no-document
