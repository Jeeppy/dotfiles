# dotfiles

Configuration personnelle gérée avec [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

```
dotfiles/
├── zsh/          → ~/.zshrc, ~/.zsh/
├── git/          → ~/.gitconfig
├── starship/     → ~/.config/starship.toml
├── vscode/       → ~/.config/Code/User/settings.json & keybindings.json
├── tabby/        → ~/.config/tabby/
├── wallpapers/   → images + script apply.sh
└── scripts/      → scripts utilitaires
```

## Installation sur une nouvelle machine

```bash
# 1. Cloner le dépôt
git clone https://github.com/<TON_USERNAME>/dotfiles.git ~/dotfiles
cd ~/dotfiles

# 2. Installer les outils
bash scripts/bootstrap.sh

# 3. Créer les symlinks
bash scripts/install.sh

# 4. Réinstaller les extensions VSCode
bash scripts/vscode-extensions.sh import

# 5. Appliquer le wallpaper
bash wallpapers/apply.sh
```

## Ce que bootstrap.sh installe

**APT**
- `zsh`, `stow`, `git`, `curl`, `wget`, `build-essential`
- `git-delta`, `solaar`, `bat`
- `gnome-tweaks`, `gnome-shell-extension-manager`

**Via repo officiel**
- Docker + Docker Compose
- Bruno (client API)
- eza (alternative à ls)
- Tabby (terminal)
- Ulauncher (launcher)

**Via script**
- Starship (prompt)
- atuin (historique shell)
- zoxide (navigation)
- pyenv + uv (Python)
- rbenv (Ruby)
- nvm (Node.js)

**GNOME Extensions** (via gext)
- Vitals
- Caffeine
- Dash to Panel
- Blur my Shell
- Tiling Shell

Extensions désactivées : `ubuntu-dock`, `workspace-indicator`

## Gestion au quotidien

```bash
# Ajouter un nouveau fichier
bash scripts/add.sh <package> <fichier>
# Ex: bash scripts/add.sh zsh ~/.zshrc

# Mettre à jour depuis une autre machine
cd ~/dotfiles && git pull && bash scripts/install.sh
```

## Notes

Les différences entre machines se gèrent avec des fichiers locaux non versionnés :

```bash
# ~/.zshrc.local  (chargé depuis .zshrc, non versionné)
export MACHINE_NAME="laptop"
```
