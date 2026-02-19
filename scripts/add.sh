#!/usr/bin/env bash
# add.sh — Déplace un fichier dans dotfiles et crée le symlink
# Usage: bash scripts/add.sh <package> <chemin/du/fichier>
# Ex:    bash scripts/add.sh zsh ~/.zshrc
#        bash scripts/add.sh vscode ~/.config/Code/User/settings.json

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

info()  { echo -e "${GREEN}▶ $*${NC}"; }
error() { echo -e "${RED}✖ $*${NC}"; exit 1; }

[ -z "$1" ] || [ -z "$2" ] && error "Usage: bash scripts/add.sh <package> <fichier>\n  Ex: bash scripts/add.sh zsh ~/.zshrc"

PACKAGE="$1"
SOURCE="$(realpath "$2")"
RELATIVE="${SOURCE#$HOME/}"  # chemin relatif depuis $HOME

[ -f "$SOURCE" ] || [ -d "$SOURCE" ] || error "Fichier introuvable : $SOURCE"

# Destination dans dotfiles
DEST="$DOTFILES_DIR/$PACKAGE/$RELATIVE"
DEST_DIR="$(dirname "$DEST")"

info "Déplacement de $SOURCE → $DEST"
mkdir -p "$DEST_DIR"
mv -T "$SOURCE" "$DEST"

info "Stow du package $PACKAGE..."
cd "$DOTFILES_DIR"
stow --restow --target="$HOME" "$PACKAGE"

echo ""
echo "✓ $RELATIVE ajouté au package '$PACKAGE'"
echo "  Pense à : cd ~/dotfiles && git add $PACKAGE && git commit -m 'add: $RELATIVE'"
