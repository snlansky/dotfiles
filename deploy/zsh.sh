#!/usr/bin/env bash

# Installing
if hash curl >/dev/null 2>&1; then
  printf "Installing oh-my-zsh...\n"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  printf "Installing nvm...\n"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/creationix/nvm/master/install.sh)"
  printf "Installing gvm...\n"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)"
elif hash wget >/dev/null 2>&1; then
  printf "Installing oh-my-zsh...\n"
  sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
  printf "Installing nvm...\n"
  sh -c "$(wget https://raw.githubusercontent.com/creationix/nvm/master/install.sh -O -)"
  printf "Installing gvm...\n"
  sh -c "$(wget https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer -O -)"
else
  echo >&2 "You first need to have curl or wget installed. Aborting.";
  exit 1;
fi

# Back up existing configuration
printf "\nLooking for an existing zsh config...\n"
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
  printf "Found ~/.zshrc. Backing up to ~/.zshrc.bak\n";
  mv ~/.zshrc ~/.zshrc.bak;
fi

# Add configuration
printf "Using new configuration file and adding it to ~/.zshrc\n"
cp .zshrc ~/
