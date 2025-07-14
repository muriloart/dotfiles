# ⚙️ Art's Dotfiles

Repository where I centralize all my environment configuration for **WSL (Ubuntu)** + **Windows** development.
Includes aliases, terminal setup (WezTerm), ZSH, plugins, Git, Docker, Node.js, and essential tools.

---

## Structure

| File                  | Main Function                                                    |
| --------------------- | ---------------------------------------------------------------- |
| `.zshrc`              | Configures ZSH, Oh My Zsh, plugins, fzf, NVM, and Pure Prompt    |
| `.aliases`            | Handy shortcuts: `exa`, `bat`, `rg`, `fzf`, `lazygit`, Git, etc. |
| `.prompt`             | Activates Pure Prompt                                            |
| `.gitconfig`          | Global Git user and formatting settings                          |
| `wezterm/wezterm.lua` | Visual style and behavior of WezTerm terminal on Windows         |
| `setup.sh`            | Automated script to install dependencies and link configs        |

---

## Installation

### 1. Clone the repository

```bash
cd ~/code
git clone https://github.com/muriloart/dotfiles.git .dotfiles
```

> Note: I use `~/code/.dotfiles` as the default location. If you change this path, make sure to update the `DOTFILES` variable inside `.zshrc` and `setup.sh`.

---

### 2. Run the setup (inside WSL)

```bash
cd ~/code/.dotfiles
chmod +x setup.sh
./setup.sh
```

This script will:

- Install `curl`, `ripgrep`, `bat`, `fzf`, `lazygit`, `exa`, `tmux`
- Create symlinks for `.zshrc`, `.aliases`, `.prompt`, `.gitconfig`
- Ensure `Pure Prompt` is working
- Enable terminal configs and autocomplete

---

### 3. (Optional) Configure WezTerm on Windows

> WezTerm is my terminal of choice. This step must be done on **Windows**, not WSL.

#### Steps:

1. Move your `.wezterm.lua` into the repository:

```powershell
mv $HOME\.wezterm.lua $HOME\code\.dotfiles\wezterm\wezterm.lua
```

2. Create a symlink to make sure WezTerm always loads the versioned config:

```powershell
New-Item -Path "$HOME\.wezterm.lua" -ItemType SymbolicLink -Value "$HOME\code\.dotfiles\wezterm\wezterm.lua"
```

---

## Post-install Checklist

- [ ] Terminal opens with Pure Prompt active
- [ ] `lg`, `fzf`, `rg`, `exa`, `bat`, `ll`, etc. work as aliases
- [ ] Node, pnpm, and yarn are installed globally
- [ ] Git config is set
- [ ] `.wezterm.lua` is working in Windows

---

## Author

**Arthur “Murilo ART”**
Fullstack Developer & founder of Vai & Faz
[github.com/muriloart](https://github.com/muriloart)
