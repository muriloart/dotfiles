# Dotfiles do Art

Repositório onde centralizo todas as minhas configurações de ambiente para desenvolvimento no **WSL (Ubuntu)** + **Windows**.
Inclui atalhos, terminal (WezTerm), ZSH, plugins, Git, Docker, Node.js, e ferramentas essenciais.

---

## Estrutura

| Arquivo               | Função principal                                                          |
| --------------------- | ------------------------------------------------------------------------- |
| `.zshrc`              | Configura ZSH, Oh My Zsh, plugins, fzf, NVM e Pure Prompt                 |
| `sync-dotfiles.sh`    | Sincroniza a configuração do WezTerm entre WSL e Windows                  |
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
chmod +x scripts/setup.sh
./setup.sh
```

Esse script irá:

- Instalar: curl, ripgrep, bat, fzf, lazygit, eza, tmux, zsh, build-essential, git
- Instalar NVM + Node.js LTS + pnpm/yarn
- Criar symlinks (.zshrc, .aliases, .prompt, .tmux.conf, .gitconfig)
- Clonar o Oh My Zsh (caso não tenha)
- Instala manualmente eza e lazygit (última versão do GitHub, caso ainda não estejam disponíveis no sistema)
- Ativar configurações úteis de terminal

---

---

### 2.1 Configurar Pure Prompt + Contador de Prazo Final

> Pure Prompt é o tema visual do terminal e exibe também a contagem regressiva até a data final do meu plano: `12/12/2026`.

#### Instalação manual do Pure Prompt:

```bash
git clone https://github.com/sindresorhus/pure.git ~/.zsh/pure
```

---

### 3. Executar `install.sh`

Se você **já tiver dependências instaladas**, use apenas:

#### Symlinks com caminho padrão

./install.sh

#### Symlinks com caminho customizado

./install.sh ~/meus-dotfiles

Esse script só cuida de criar os symlinks.

---

### 4. Configurar o WezTerm no Windows

#### Antes de rodar:

#### Edite 'sync-dotfiles.sh' e troque "/Users/conta/" pelo seu nome de usuário real no Windows

> WezTerm é meu terminal principal. Essa etapa é **no WSL**.

- Essa etapa é executada no WSL, não no Windows.
  O objetivo é copiar sua config personalizada do wezterm.lua (armazenada no seu repositório dotfiles) para o local onde o WezTerm (no Windows) realmente lê o arquivo.
- Sempre que editar o arquivo ~/code/.dotfiles/.wezterm.lua, sincronize com o WezTerm do Windows rodando:

- ```bash
  chmod +x ~/code/dotfiles/scripts/sync-dotfiles.sh
    ~/code/dotfiles/scripts/sync-dotfiles.sh
  ```

- Esse script copia o arquivo .wezterm.lua para:
- /mnt/c/Users/_conta_/.config/wezterm/wezterm.lua
- Após isso, é só reiniciar o WezTerm para aplicar a nova configuração.

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

```

```

```

```
