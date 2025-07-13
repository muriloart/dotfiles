
# Script de configuração automática do meu ambiente de development.
# Instala dependências essenciais, ferramentas e linka seus dotfiles.

set -euo pipefail

DOTFILES_DIR="$HOME/code/.dotfiles"

echo "Iniciando setup de dotfiles e ferramentas..."

# 1. Atualizar e instalar pacotes básicos
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl git unzip ripgrep tmux zsh build-essential

# 2. Instalar NVM e Node.js LTS
if ! command -v nvm &> /dev/null; then
  echo "🔧 Instalando NVM..."
  curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
fi
nvm install --lts
nvm use --lts

# 3. Instalar pnpm e yarn (via corepack)
if ! command -v pnpm &> /dev/null; then
  echo "📦 Instalando pnpm..."
  npm install -g pnpm
fi
corepack enable
corepack prepare yarn@stable --activate

# 4. Instalar binários manuais: exa, bat, lazygit
echo "📥 Instalando exa..."
LATEST_EXA_VERSION=v0.10.1
curl -fsSL "https://github.com/ogham/exa/releases/download/${LATEST_EXA_VERSION}/exa-linux-x86_64-${LATEST_EXA_VERSION}.zip" -o exa.zip
unzip -o exa.zip 'bin/exa'
sudo install bin/exa /usr/local/bin/exa
rm -rf exa.zip bin

echo "📥 Instalando batcat..."
sudo apt install -y bat

echo "📥 Instalando lazygit..."
LAZYGIT_VERSION=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep tag_name | cut -d '"' -f4)
curl -fsSL "https://github.com/jesseduffield/lazygit/releases/download/${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION#v}_Linux_x86_64.tar.gz" -o lazygit.tar.gz
tar -xzf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit lazygit.tar.gz

# 5. Instalar fzf
if ! command -v fzf &> /dev/null; then
  echo "🔍 Instalando fzf..."
  sudo apt install -y fzf
fi

# 6. Linkar dotfiles
echo "🔗 Criando links simbólicos para dotfiles..."
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/.aliases" "$HOME/.aliases"
ln -sf "$DOTFILES_DIR/.prompt" "$HOME/.prompt"
ln -sf "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"

# 7. Configurar Oh My Zsh se necessário
test -d "$HOME/.oh-my-zsh" || \
  git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"

echo "Setup concluído! Feche e reabra seu terminal. É O ART, PORRA!"


