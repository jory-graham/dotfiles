#!/bin/bash

if [ "$SPIN" ]; then
  DOTFILES=~/dotfiles
else
  DOTFILES=~/src/github.com/jory-graham/dotfiles
fi

if [ -d $DOTFILES_DIR ] && [ ! -L $DOTFILES_DIR ]; then
  for file in "$DOTFILES_DIR"/dotfiles/*; do
    base="$(basename "$file")"
    if [ "$base" == "Brewfile" ]; then f="$base"; else f=".$base"; fi
    echo "Installing $f..."
    target=~/"$f"
    [ -f "$target" ] && mv "$target" "$target.bak"
    ln -s "$file"  ~/"$f"
  done
else
  echo "Could not find dotfiles directory: $DOTFILES_DIR"
fi

[ ! -d ~/.oh-my-zsh ] && sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

if [ "$SPIN" ]; then
  ./install-spin.sh
else
  ./install-mac.sh
fi