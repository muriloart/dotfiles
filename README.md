# Art’s Dotfiles

This repository centralizes all my environment configurations for development on **WSL (Ubuntu)** and **Windows**.
Includes aliases, terminal setup (WezTerm), ZSH, plugins, Git, Docker, Node.js, and essential tools.

---

## Structure

| File                  | Main Purpose                                                          |
| --------------------- | --------------------------------------------------------------------- |
| `.zshrc`              | Configures ZSH, Oh My Zsh, plugins, fzf, NVM, and Pure Prompt         |
| `sync-dotfiles.sh`    | Synchronizes the WezTerm config between WSL and Windows               |
| `.aliases`            | Practical shortcuts: `eza`, `bat`, `rg`, `fzf`, `lazygit`, Git, etc.  |
| `.prompt`             | Activates Pure Prompt plus my custom terminal automations             |
| `.gitconfig`          | Global Git user settings and formatting                               |
| `wezterm/wezterm.lua` | Visual style and behavior for WezTerm on Windows                      |
| `install.sh`          | Creates symlinks in `$HOME` for `.zshrc`, `.aliases`, and `.prompt`   |
| `setup.sh`            | Automated script that installs dependencies and configures everything |

---

## Installation

### 1. Clone the repository

```bash
cd ~/code
git clone https://github.com/muriloart/dotfiles.git .dotfiles
```

> Default path is `~/code/.dotfiles`.
> If you choose a different location, update the `DOTFILES` variable in `.zshrc`, `install.sh`, and `setup.sh`.

---

### 2. Run `setup.sh` in WSL

```bash
cd ~/code/.dotfiles
chmod +x scripts/setup.sh
./setup.sh
```

This script will:

- Install: curl, ripgrep, bat, fzf, lazygit, eza, tmux, zsh, build-essential, git
- Install NVM + Node.js LTS + pnpm/yarn
- Create symlinks for: `.zshrc`, `.aliases`, `.prompt`, `.tmux.conf`, `.gitconfig`
- Clone Oh My Zsh if it’s not already installed
- Manually install eza and lazygit (latest GitHub releases, if not available via APT)
- Enable terminal enhancements

---

### 2.1 Configure Pure Prompt & Countdown

> Pure Prompt is the ZSH theme that also shows a countdown to my target date: `12/12/2026`.

```bash
git clone https://github.com/sindresorhus/pure.git ~/.zsh/pure
```

---

### 3. Run `install.sh` (symlinks only)

If you already have dependencies installed, simply do:

```bash
# Use default dotfiles path
./install.sh

# Or specify a custom dotfiles path
./install.sh ~/my-dotfiles
```

This script only creates the necessary symlinks in your home directory.

---

### 4. Configure WezTerm on Windows

> This step runs in WSL but targets the Windows installation of WezTerm.

1. **Edit** the `sync-dotfiles.sh` script and replace `/Users/conta/` with your actual Windows username.
2. Make it executable and run:

   ```bash
   chmod +x ~/code/.dotfiles/sync-dotfiles.sh
   ~/code/.dotfiles/sync-dotfiles.sh
   ```

   - This copies `wezterm.lua` from your dotfiles to
     `/mnt/c/Users/<YourWindowsUsername>/.config/wezterm/wezterm.lua`.
   - Restart WezTerm on Windows to apply the new configuration.

---

## Post-Installation Checklist

- [x] Terminal opens with Pure Prompt
- [x] Countdown to 12/12/2026 is displayed
- [x] Commands like `ls`, `bat`, `rg`, `fzf`, `lg` work correctly
- [x] `nvm`, `node`, `pnpm`, and `yarn` are installed
- [x] Docker and Docker Compose are ready to use
- [x] Symlinks created: `.zshrc`, `.aliases`, `.prompt`, `.gitconfig`
- [x] WezTerm configured on Windows (optional)

---

## About Me

**Arthur “Murilo ART”**
Fullstack Developer & Founder of Vai & Faz
[github.com/muriloart](https://github.com/muriloart)
