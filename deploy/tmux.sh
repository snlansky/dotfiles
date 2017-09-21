#!/usr/bin/env bash

# check git and npm
(command -v git >/dev/null 2>&1) || {
  echo >&2 "You first need to have git installed. Aborting.";
  exit 1;
}

tpm=~/.tmux/plugins/tpm

# Download "tmux-plugins/tpm" Tmux Plugin Manager
if [ ! -d "$tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm.git "$tpm"
fi

cp .tmux.conf ~/

# Reload TMUX environment so TPM is sourced
tmux source ~/.tmux.conf

# Installing plugins
"$tpm"/scripts/install_plugins.sh
