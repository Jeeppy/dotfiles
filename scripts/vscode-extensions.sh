#!/usr/bin/env bash
# vscode-extensions.sh — Exporte et réimporte les extensions VSCode
# Usage:
#   bash scripts/vscode-extensions.sh export   → sauvegarde la liste
#   bash scripts/vscode-extensions.sh import   → réinstalle depuis la liste

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EXTENSIONS_FILE="$SCRIPT_DIR/vscode-extensions.txt"

case "$1" in
  export)
    echo "Export des extensions VSCode..."
    code --list-extensions > "$EXTENSIONS_FILE"
    echo "✓ $(wc -l < "$EXTENSIONS_FILE") extensions sauvegardées dans scripts/vscode-extensions.txt"
    ;;
  import)
    [ -f "$EXTENSIONS_FILE" ] || { echo "✖ Fichier vscode-extensions.txt introuvable"; exit 1; }
    echo "Installation des extensions VSCode..."
    cat "$EXTENSIONS_FILE" | xargs -L 1 code --install-extension
    echo "✓ Extensions installées"
    ;;
  *)
    echo "Usage: bash scripts/vscode-extensions.sh [export|import]"
    exit 1
    ;;
esac
