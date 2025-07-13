#!/usr/bin/env bash
set -e

echo "Instalando symlinks..."

DOTFILES="$HOME/.dotfiles"
FILES=(.zshrc .aliases .prompt)

for file in "${FILES[@]}"; do
  ln -svf "$DOTFILES/$file" "$HOME/$file"
done

echo "Dotfiles instalados! É O ART."
