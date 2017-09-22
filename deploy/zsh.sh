#!/usr/bin/env bash

# Back up existing configuration
printf "Looking for an existing zsh config...\n"
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
  printf "Found ~/.zshrc. Backing up to ~/.zshrc.bak\n";
  mv ~/.zshrc ~/.zshrc.bak;
fi

# Add configuration
printf "Using new configuration file and adding it to ~/.zshrc\n"
cp .zshrc ~/
