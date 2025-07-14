#!/bin/bash
set -euo pipefail

# Caminho do arquivo fonte no WSL (meu repositório de dotfiles)
SRC="$HOME/code/.dotfiles/.wezterm.lua"

# Caminho do destino no Windows (montado no WSL)
#  Troque 'user' pelo seu nome de usuário do Windows.
DST="/mnt/c/Users/user/.config/wezterm/wezterm.lua"

# Proteção contra erro de esquecimento
if [[ "$DST" == *"/user/"* ]]; then
  echo "Você esqueceu de trocar 'conta' pelo seu nome de usuário do Windows."
  exit 1
fi

# Cria o diretório destino, se não existir
mkdir -p "$(dirname "$DST")"

# Copia o arquivo para o Windows
cp "$SRC" "$DST"

# Mensagem de sucesso
echo " Arquivo sincronizado: $SRC → $DST"
