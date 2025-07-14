#!/usr/bin/env bash
set -e

echo "Instalando symlinks..."

# Você pode passar um caminho customizado para seu repositório de dotfiles como argumento:
# Exemplo: ./install.sh ~/meus-dotfiles
# Se nenhum caminho for passado, o padrão será: $HOME/code/.dotfiles

DOTFILES="${1:-$HOME/code/.dotfiles}"
FILES=(.zshrc .aliases .prompt)

for file in "${FILES[@]}"; do
  ln -svf "$DOTFILES/$file" "$HOME/$file"
done

echo "Dotfiles instalados! É O ART."
