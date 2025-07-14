# Art’s Dotfiles

This repository centralizes all my environment configuration for development on **WSL (Ubuntu)** and **Windows**.  
Includes aliases, terminal setup (WezTerm), ZSH, plugins, Git, Docker, Node.js, and essential tools.

---

## Structure

| File               | Purpose                                                              |
| ------------------ | -------------------------------------------------------------------- |
| `.zshrc`           | Configures ZSH, Oh My Zsh, plugins, fzf, NVM, and Pure Prompt        |
| `.aliases`         | Practical shortcuts: `eza`, `bat`, `rg`, `fzf`, `lazygit`, Git, etc. |
| `.prompt`          | Pure Prompt + custom automation (countdown timer, visual feedback)   |
| `.gitconfig`       | Global Git settings and formatting                                   |
| `.tmux.conf`       | tmux configuration (split keys, navigation, statusbar)               |
| `.wezterm.lua`     | Visual style and behavior for WezTerm on Windows                     |
| `setup.sh`         | Main installer: dependencies + configs                               |
| `install.sh`       | Simple symlink creator for dotfiles                                  |
| `sync-dotfiles.sh` | Syncs wezterm config from WSL to Windows                             |

---

## Installation

---

### 1. Clone the repository

```bash
cd ~/code
git clone https://github.com/muriloart/dotfiles.git .dotfiles
```

> Default path: `~/code/.dotfiles`.
> If you change it, update the `DOTFILES_DIR` variable in `.zshrc`, `install.sh`, and `setup.sh`.

---

### 2. Run `setup.sh` (inside WSL)

```bash
cd ~/code/.dotfiles
chmod +x scripts/setup.sh
./scripts/setup.sh
```

This script will:

- Install: `curl`, `ripgrep`, `bat`, `fzf`, `lazygit`, `eza`, `tmux`, `zsh`, `build-essential`, `git`
- Install NVM + Node.js LTS + pnpm/yarn
- Create symlinks for: `.zshrc`, `.aliases`, `.prompt`, `.tmux.conf`, `.gitconfig`
- Clone Oh My Zsh (if not already present)
- Install latest versions of `eza` and `lazygit` manually
- Enhance terminal UX

---

### 2.1 Set up Pure Prompt + Countdown

> Pure Prompt shows a minimal ZSH prompt with a countdown to `12/12/2026`.

```bash
git clone https://github.com/sindresorhus/pure.git ~/.zsh/pure
```

---

### 3. Run `install.sh` (just symlinks)

If you already have dependencies installed:

```bash
# Default path
./install.sh

# Custom path
./install.sh ~/my-dotfiles
```

---

### 4. Configure WezTerm (Windows)

> This step runs in WSL but configures the Windows version of WezTerm.

1. Edit `sync-dotfiles.sh` and replace `/Users/conta/` with your actual Windows username.
2. Make the script executable and run:

```bash
chmod +x ~/code/.dotfiles/scripts/sync-dotfiles.sh
~/code/.dotfiles/scripts/sync-dotfiles.sh
```

This copies `.wezterm.lua` to:
`/mnt/c/Users/<YourUsername>/.config/wezterm/wezterm.lua`
Restart WezTerm afterwards.

---

## Post-install checklist

- [x] Terminal opens with Pure Prompt
- [x] Countdown to 12/12/2026 is visible
- [x] `ls`, `bat`, `rg`, `fzf`, `lg` work correctly
- [x] `nvm`, `node`, `pnpm`, and `yarn` are installed
- [x] Docker + Docker Compose are ready
- [x] Dotfile symlinks are correctly applied
- [x] WezTerm configured (optional)

---

## About Me

**Arthur “Murilo ART”**
Fullstack Developer & Founder of Vai & Faz
[github.com/muriloart](https://github.com/muriloart)
