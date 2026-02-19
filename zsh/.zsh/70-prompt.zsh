# ============================================
# starship
# ============================================

eval "$(starship init zsh)"

# ============================================
# zoxide
# ============================================

eval "$(zoxide init zsh --cmd cd)"

# ============================================
# direnv
# ============================================

eval "$(direnv hook zsh)"

# ============================================
# fzf
# ============================================

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
