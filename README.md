# dotfiles

Configuration personnelle gérée avec [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

```
dotfiles/
├── zsh/          → ~/.zshrc, ~/.zsh/
├── git/          → ~/.gitconfig, ~/.gitignore_global
├── starship/     → ~/.config/starship.toml
├── vscode/       → ~/.config/Code/User/settings.json & keybindings.json
├── tabby/        → ~/.config/tabby/
└── scripts/      → scripts utilitaires (non stowés)
```

## Installation sur une nouvelle machine

```bash
# 1. Installer les dépendances
sudo apt install zsh stow git curl

# 2. Cloner le dépôt
git clone https://github.com/<TON_USERNAME>/dotfiles.git ~/dotfiles

# 3. Installer tous les configs d'un coup
cd ~/dotfiles
bash scripts/install.sh

# 4. (Optionnel) Installer les outils
bash scripts/bootstrap.sh
```

## Gestion au quotidien

```bash
# Ajouter un nouveau fichier (ex: .zshrc)
mv ~/.zshrc ~/dotfiles/zsh/.zshrc
cd ~/dotfiles && stow zsh

# Mettre à jour depuis une autre machine
cd ~/dotfiles && git pull

# Voir les symlinks actifs
stow --simulate zsh   # dry-run
```

## Packages gérés

| Package    | Fichiers                          |
| ---------- | --------------------------------- |
| `zsh`      | `.zshrc`, `.zsh/`                 |
| `git`      | `.gitconfig`, `.gitignore_global` |
| `starship` | `.config/starship.toml`           |
| `vscode`   | `.config/Code/User/settings.json` |
| `tabby`    | `.config/tabby/config.yaml`       |
