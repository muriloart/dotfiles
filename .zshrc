# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Aliases e prompt customizados
[[ -f $HOME/.dotfiles/.aliases ]] && source $HOME/.dotfiles/.aliases
[[ -f $HOME/.dotfiles/.prompt ]] && source $HOME/.dotfiles/.prompt

# NVM
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# fzf com bat preview
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/*'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --preview 'bat --style=numbers --color=always --line-range :500 {}'"
# fzf key bindings e completions
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh

# PURE PROMPT (instalado manualmente)
fpath+=("$HOME/.zsh/pure")
autoload -U promptinit; promptinit
autoload -U prompt_pure_setup; prompt_pure_setup


# Autocomplete (opcional, mas pode ajudar)
autoload -U compinit; compinit
