# ============================================
# .zshrc optimisé pour chargement interactif
# ============================================
[[ $- != *i* ]] && return

ZSH_CONFIG="$HOME/.zsh"

# Charger chaque module s'il existe
for file in init plugins aliases completion functions prompt keybindings welcome; do
  [[ -f "$ZSH_CONFIG/$file.zsh" ]] && source "$ZSH_CONFIG/$file.zsh"
done
 