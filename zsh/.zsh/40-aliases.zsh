# ============================================
# aliases
# ============================================

alias ls='eza --group-directories-first --icons=auto'
alias ll='ls -la --git'
alias la='ls -a'
alias lt='ls --tree --level=2'
alias lta='lt -a'
alias find='fd'
alias cat='batcat'
alias less='batcat --paging=always'

# ============================================
# aliases - git
# ============================================

alias gst='git status'
alias glog='git log --oneline --decorate -n 10'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gco='git checkout'
alias gd='git diff'
alias lg='lazygit'

# ============================================
# aliases - docker
# ============================================

alias dc='docker'
alias dco='docker compose'

# ============================================
# aliases - developpement
# ============================================

alias edit='$EDITOR'
alias py='python'
alias rb='ruby'

# ============================================
# aliases - system
# ============================================

alias install='sudo apt install'
alias remove='sudo apt remove'

# ============================================
# aliases - raccourcis
# ============================================

alias c='clear'
alias h='history'
alias ip='curl ifconfig.me'
alias del='trash-put'

# ============================================
# aliases - divers
# ============================================
alias reload='source ~/.zshrc && echo "🔁 Configuration rechargée !"'
