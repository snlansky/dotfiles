#!/usr/bin/env bash

bakdir="$HOME/.dotfiles.backup"
timestr=$(date +%Y%m%d%H%M)
dotfiles=(
  .bashrc
  .ackrc
  .gitconfig
  .zshrc
  .vimshrc
  .Xmodmap
  .ctags
)

if [ ! -d "$bakdir" ]; then
    mkdir "$bakdir"
fi

for i in ${dotfiles[@]};
do
    if [ -f "$HOME/$i" ] || [ -h "$HOME/$i" ]; then
        cat "$HOME/$i" > "$bakdir/$timestr$i"
    fi
    cp "$i" "$HOME/$i"
done
