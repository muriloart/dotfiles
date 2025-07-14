#!/usr/bin/env bash
set -e

echo "Instalando symlinks..."

# Você pode passar um caminho customizado para seu repositório de dotfiles como argumento:
# Exemplo: ./install.sh ~/meus-dotfiles
# Se nenhum caminho for passado, o padrão será: $HOME/code/.dotfiles

DOTFILES_DIR="${1:-$HOME/code/.dotfiles}"
FILES=(.zshrc .aliases .prompt .tmux.conf .gitconfig)

for file in "${FILES[@]}"; do
  ln -sf "$DOTFILES_DIR/$file" "$HOME/$file"
  echo " → $file vinculado"
done

echo -e "\nDotfiles instalados! É O ART, PORRA."