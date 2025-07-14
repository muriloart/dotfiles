# Dotfiles do Art

Repositório onde centralizo todas as minhas configurações de ambiente para desenvolvimento no **WSL (Ubuntu)** + **Windows**.
Inclui atalhos, terminal (WezTerm), ZSH, plugins, Git, Docker, Node.js, e ferramentas essenciais.

---

## Estrutura

| Arquivo               | Função principal                                                          |
| --------------------- | ------------------------------------------------------------------------- |
| `.zshrc`              | Configura ZSH, Oh My Zsh, plugins, fzf, NVM e Pure Prompt                 |
| `.aliases`            | Atalhos práticos: `exa`, `bat`, `rg`, `fzf`, `lazygit`, Git, entre outros |
| `.prompt`             | Ativa Pure Prompt + Automações pessoais.                                  |
| `.gitconfig`          | Configuração global de usuário e formatação para Git                      |
| `wezterm/wezterm.lua` | Estilo visual e comportamento do terminal WezTerm no Windows              |
| `install.sh`          | Cria symlinks direto na `$HOME` para `.zshrc`, `.aliases`, `.prompt`      |
| `setup.sh`            | Script automatizado que instala dependências e configura tudo             |

---

## Instalação

### 1. Clonar o repositório

```bash
cd ~/code
git clone https://github.com/muriloart/dotfiles.git .dotfiles
```

> O caminho padrão esperado é `~/code/.dotfiles`. Se mudar, atualize a variável `DOTFILES` no `.zshrc`, `install.sh` e `setup.sh`.

---

### 2. Executar `setup.sh` no WSL

```bash
cd ~/code/.dotfiles
chmod +x setup.sh
./setup.sh
```

Esse script irá:

- Instalar: `curl`, `ripgrep`, `bat`, `fzf`, `lazygit`, `exa`, `tmux`, `zsh`, `build-essential`, `git`
- Instalar NVM + Node LTS + pnpm/yarn
- Criar symlinks (`.zshrc`, `.aliases`, `.prompt`, `.tmux.conf`, `.gitconfig`)
- Clonar o Oh My Zsh (caso não tenha)
- Ativar configurações úteis de terminal

---

### 3. (Opcional) Executar `install.sh`

Se você **já tiver dependências instaladas**, use apenas:

```bash
./install.sh
```

Esse script só cuida de criar os symlinks.

---

### 4. (Opcional) Configurar o WezTerm no Windows

> WezTerm é meu terminal principal. Essa etapa é **no Windows**, não no WSL.

```powershell
# Mover o arquivo para dentro do repositório versionado:
mv $HOME\.wezterm.lua $HOME\code\.dotfiles\wezterm\wezterm.lua

# Criar um link simbólico para que o WezTerm aponte sempre para ele:
New-Item -Path "$HOME\.wezterm.lua" -ItemType SymbolicLink -Value "$HOME\code\.dotfiles\wezterm\wezterm.lua"
```

---

## Pós-instalação (checklist)

- [x] Terminal abre com Pure Prompt
- [x] Mensagem de contagem até 12/12/2026 exibida no terminal
- [x] Comandos como `ls`, `bat`, `rg`, `fzf`, `lg` funcionando
- [x] `nvm`, `node`, `pnpm` e `yarn` instalados
- [x] Docker e Docker Compose prontos
- [x] Symlinks criados corretamente (`.zshrc`, `.aliases`, `.prompt`, `.gitconfig`)
- [x] WezTerm configurado no Windows (opcional)

---

## Sobre mim

**Arthur “Murilo ART”**
Desenvolvedor Fullstack & fundador do Vai & Faz
[github.com/muriloart](https://github.com/muriloart)
