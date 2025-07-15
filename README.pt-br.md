# Dotfiles do Art

Repositório onde centralizo todas as minhas configurações de ambiente para desenvolvimento no **WSL (Ubuntu)** + **Windows**.  
Inclui atalhos, terminal (WezTerm), ZSH, plugins, Git, Docker, Node.js, e ferramentas essenciais.

---

## Estrutura

| Arquivo            | Função principal                                                          |
| ------------------ | ------------------------------------------------------------------------- |
| `.zshrc`           | Configura ZSH, Oh My Zsh, plugins, fzf, NVM e Pure Prompt                 |
| `.aliases`         | Atalhos práticos: `eza`, `bat`, `rg`, `fzf`, `lazygit`, Git, entre outros |
| `.prompt`          | Ativa Pure Prompt + contador de prazo final                               |
| `.gitconfig`       | Configuração global de usuário e formatação do Git                        |
| `.tmux.conf`       | Configuração do tmux: atalhos, cores, mouse, navegação                    |
| `.wezterm.lua`     | Estilo visual e comportamento do terminal WezTerm                         |
| `setup.sh`         | Instala dependências e configurações automáticas                          |
| `install.sh`       | Cria symlinks diretos no `$HOME`                                          |
| `sync-dotfiles.sh` | Sincroniza a configuração do WezTerm entre WSL e Windows                  |

---

## Instalação

### 1. Clonar o repositório

```bash
cd ~/code
git clone https://github.com/muriloart/dotfiles.git .dotfiles
```

> O caminho padrão é `~/code/.dotfiles`.
> Se mudar, atualize a variável `DOTFILES_DIR` no `.zshrc`, `install.sh` e `setup.sh`.

---

### 2. Executar o `setup.sh` (no WSL)

```bash
cd ~/code/.dotfiles
chmod +x scripts/setup.sh
./scripts/setup.sh
```

Esse script irá:

- Instalar: `curl`, `ripgrep`, `bat`, `fzf`, `lazygit`, `eza`, `tmux`, `zsh`, `git`, `build-essential`
- Instalar o NVM + Node.js LTS + pnpm/yarn
- Criar symlinks para: `.zshrc`, `.aliases`, `.prompt`, `.tmux.conf`, `.gitconfig`
- Clonar o Oh My Zsh (se necessário)
- Instalar manualmente `eza` e `lazygit` na última versão
- Ativar configurações visuais do terminal

---

### 2.1 Configurar Pure Prompt + Contador de Prazo Final

> Pure Prompt é o tema visual do terminal, com contador regressivo até `12/12/2026`.

```bash
git clone https://github.com/sindresorhus/pure.git ~/.zsh/pure
```

---

### 3. Executar o `install.sh` (apenas symlinks)

Se você já tiver as dependências:

```bash
# Caminho padrão:
./scripts/install.sh

# Caminho customizado:
./scripts/install.sh  ~/meus-dotfiles
```

Execute isso para verificar se os symlinks foram criados com sucesso

```bash
for f in .zshrc .aliases .prompt .tmux.conf .gitconfig; do echo -n "$f → " && readlink ~/$f; done
```

---

### 4. Configurar WezTerm (no Windows)

> Essa etapa roda no **WSL** e copia a config pro Windows.

1. Edite `sync-dotfiles.sh` e troque `/Users/conta/` pelo seu nome real de usuário do Windows.
2. Torne executável e rode:

```bash
chmod +x ~/code/.dotfiles/scripts/sync-wezterm.sh
~/code/.dotfiles/scripts/sync-wezterm.sh
```

> Isso copia `.wezterm.lua` para o caminho correto no Windows:
> `/mnt/c/Users/<SEU_USUARIO>/.config/wezterm/wezterm.lua`

Reinicie o WezTerm após essa etapa.

---

## Pós-instalação (checklist)

- [x] Terminal abre com Pure Prompt
- [x] Contagem até 12/12/2026 visível
- [x] Comandos `ls`, `bat`, `rg`, `fzf`, `lg` funcionando
- [x] `nvm`, `node`, `pnpm`, `yarn` instalados
- [x] Docker e Docker Compose funcionando
- [x] Symlinks criados corretamente
- [x] WezTerm configurado no Windows

---

## Sobre mim

**Arthur “Murilo ART”**
Desenvolvedor Fullstack & fundador do Vai & Faz
[github.com/muriloart](https://github.com/muriloart)

```

---
```
