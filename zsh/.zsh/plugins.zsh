# ============================================
# zinit - plugins & modules
# ============================================

if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# ============================================
# zinit - plugins
# ============================================

zinit ice silent
zinit light hlissner/zsh-autopair
zinit light zdharma-continuum/history-search-multi-word

# ============================================
# ssh-agent
# ============================================

zstyle :omz:plugins:ssh-agent identities id_rsa id_ed25519
zstyle :omz:plugins:ssh-agent lifetime 12h
zinit snippet OMZP::ssh-agent

# ============================================
# zsh-autosuggestions
# ============================================

zinit ice silent wait"0"
zinit light zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# ============================================
# zsh-syntax-highlighting
# ============================================

zinit ice silent wait"1" atload'
  ZSH_HIGHLIGHT_STYLES[default]="fg=145"
  ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=red,bold"
  ZSH_HIGHLIGHT_STYLES[reserved-word]="fg=208,bold"
  ZSH_HIGHLIGHT_STYLES[alias]="fg=107"
  ZSH_HIGHLIGHT_STYLES[builtin]="fg=107"
  ZSH_HIGHLIGHT_STYLES[function]="fg=107"
  ZSH_HIGHLIGHT_STYLES[command]="fg=107"
  ZSH_HIGHLIGHT_STYLES[precommand]="fg=107,underline"
  ZSH_HIGHLIGHT_STYLES[commandseparator]="fg=145"
  ZSH_HIGHLIGHT_STYLES[path]="fg=73"
  ZSH_HIGHLIGHT_STYLES[path_prefix]="fg=73"
  ZSH_HIGHLIGHT_STYLES[path_approx]="fg=73"
  ZSH_HIGHLIGHT_STYLES[globbing]="fg=141"
  ZSH_HIGHLIGHT_STYLES[history-expansion]="fg=73,bold"
  ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=186"
  ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=186"
  ZSH_HIGHLIGHT_STYLES[back-quoted-argument]="fg=141"
  ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=107"
  ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=107"
  ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]="fg=208"
  ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]="fg=208"
  ZSH_HIGHLIGHT_STYLES[assign]="fg=145"
'
zinit light zsh-users/zsh-syntax-highlighting

# ============================================
# zsh-completions
# ============================================

zinit ice silent
zinit light zsh-users/zsh-completions

# ============================================
# zsh-you-should-use
# ============================================

zinit ice silent
zinit light MichaelAquilina/zsh-you-should-use
export YSU_MESSAGE_FORMAT="$(tput bold)$(tput setaf 3)Found existing $(tput setaf 5)%alias_type$(tput setaf 3) for $(tput setaf 5)%command$(tput setaf 3). You should use: $(tput setaf 5)%alias$(tput sgr0)"
