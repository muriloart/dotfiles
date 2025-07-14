#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$HOME/code/.dotfiles"
echo "Iniciando setup de dotfiles e ferramentas..."

# 1) Repositórios e atualização
sudo add-apt-repository -y universe
sudo apt update && sudo apt upgrade -y

# 2) Instalação de pacotes via apt
sudo apt install -y \
  curl git unzip ripgrep tmux zsh build-essential \
  bat fzf

# 3) NVM + Node.js LTS
if ! command -v nvm &>/dev/null; then
  echo "Instalando NVM..."
  curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
fi
nvm install --lts
nvm use --lts

# 4) Corepack + Yarn + pnpm
if ! command -v pnpm &>/dev/null; then
  echo "Instalando pnpm..."
  npm install -g pnpm
fi
corepack enable
corepack prepare yarn@stable --activate

# 5) Instalar eza manualmente
if ! command -v eza &> /dev/null; then
  echo "Instalando eza..."
  mkdir -p ~/tools && cd ~/tools
  curl -LO https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz
  tar -xzf eza_x86_64-unknown-linux-gnu.tar.gz
  sudo mv eza /usr/local/bin/
  cd ~
fi

# 6) Instalar lazygit manualmente
if ! command -v lazygit &> /dev/null; then
  echo "Instalando lazygit..."
  mkdir -p ~/tools && cd ~/tools
  LAZYGIT_VERSION=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep tag_name | cut -d '"' -f4)
  curl -LO "https://github.com/jesseduffield/lazygit/releases/download/${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION#v}_Linux_x86_64.tar.gz"
  tar -xzf lazygit_*.tar.gz
  sudo mv lazygit /usr/local/bin/
  cd ~
fi

# 7) Linkagem de dotfiles
echo "Criando links simbólicos dos dotfiles..."
for file in .zshrc .aliases .prompt .tmux.conf .gitconfig; do
  ln -sf "$DOTFILES_DIR/$file" "$HOME/$file"
done

# 8) Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Clonando Oh My Zsh..."
  git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
fi

# 9) Verificação final
echo
for cmd in eza lazygit batcat; do
  if command -v "$cmd" &>/dev/null; then
    echo " $cmd instalado"
  else
    echo "$cmd NÃO instalado!"
  fi
done

echo
echo "Setup concluído! Reabra seu terminal ou execute 'exec zsh'. É O ART, PORRA!"
