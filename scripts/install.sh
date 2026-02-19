#!/usr/bin/env bash
# install.sh — Crée les symlinks via GNU Stow
# Usage: bash scripts/install.sh [package]
#   Sans argument → installe tout
#   Avec argument → installe seulement ce package (ex: bash scripts/install.sh zsh)

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PACKAGES=(zsh git starship vscode tabby)

# Couleurs
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

info()    { echo -e "${GREEN}▶ $*${NC}"; }
warn()    { echo -e "${YELLOW}⚠ $*${NC}"; }
error()   { echo -e "${RED}✖ $*${NC}"; exit 1; }

# Vérifier que stow est installé
command -v stow >/dev/null 2>&1 || error "GNU Stow n'est pas installé. Lance : sudo apt install stow"

cd "$DOTFILES_DIR"

stow_package() {
  local pkg=$1
  if [ -d "$pkg" ]; then
    info "Stowing $pkg..."
    stow --restow --target="$HOME" "$pkg" && echo "  ✓ $pkg" || warn "  Problème avec $pkg (conflit ?)"
  else
    warn "Package '$pkg' non trouvé, ignoré."
  fi
}

if [ -n "$1" ]; then
  stow_package "$1"
else
  for pkg in "${PACKAGES[@]}"; do
    stow_package "$pkg"
  done
fi

echo ""
info "Installation terminée !"
echo "  Symlinks créés dans $HOME"
echo "  Pour vérifier : ls -la ~/ | grep '\->'"
