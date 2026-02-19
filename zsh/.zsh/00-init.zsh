# ============================================
# Initialisation & variables globales
# ============================================

# ============================================
# history
# ============================================

HISTFILE="${HOME}/.zhistory"
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY INC_APPEND_HISTORY SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE EXTENDED_HISTORY

# ============================================
# Options générales
# ============================================

setopt AUTO_CD CORRECT COMPLETE_IN_WORD AUTO_MENU AUTO_PUSHD PUSHD_IGNORE_DUPS

# ============================================
# PATH
# ============================================

export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# ============================================
# variables d'environnement
# ============================================

export EDITOR='helix'
export VISUAL='code --wait'
export PAGER='batcat'
export DOTFILES_DIR="$HOME/Projets/dotfiles"

# ============================================
# atuin
# ============================================

[ -f "$HOME/.atuin/bin/env" ] && . "$HOME/.atuin/bin/env"
command -v atuin &>/dev/null && eval "$(atuin init zsh)"
