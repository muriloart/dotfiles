# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Oh My Zsh + Dotfiles Setup 
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# 1) Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="midnight-green"
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# 2) Dotfiles
export DOTFILES="$HOME/code/.dotfiles"
[[ -f $DOTFILES/.aliases ]] && source $DOTFILES/.aliases
[[ -f $DOTFILES/.prompt   ]] && source $DOTFILES/.prompt

# 3) NVM
export NVM_DIR="$HOME/.nvm"
[[ -s $NVM_DIR/nvm.sh     ]] && source $NVM_DIR/nvm.sh
[[ -s $NVM_DIR/bash_completion ]] && source $NVM_DIR/bash_completion

# 4) fzf + bat preview
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/*'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border \
  --preview 'bat --style=numbers --color=always --line-range :500 {}'"
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh

# 5) Pure Prompt (manual install)
fpath+=("$HOME/.zsh/pure")
autoload -U promptinit prompt_pure_setup colors
promptinit
prompt_pure_setup
autoload -U compinit && compinit

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#           Pure Prompt Customizado 
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PURE_PROMPT_SYMBOL="%K{234}%F{255}⟴ %F{88}𝔪𝔲𝔯𝔦𝔩𝔬𝔞𝔯𝔱%f%k"

PURE_PROMPT_VICMD_SYMBOL="⬅"

PURE_PROMPT_CURRENT_DIR_COLOR="green"

PURE_CMD_MAX_EXEC_TIME=5

#Versão do Node no RPROMPT
node_info() {
  [[ -f package.json && $(command -v node) ]] \
    && echo "%F{green}⬢ $(node -v)%f"
}
RPROMPT='$(node_info)'

prompt pure
