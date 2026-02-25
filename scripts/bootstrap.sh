#!/usr/bin/env bash
# bootstrap.sh — Installe les outils de dev sur une nouvelle machine Ubuntu/Pop!_OS
# Usage: bash scripts/bootstrap.sh

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info() { echo -e "${GREEN}▶ $*${NC}"; }
skip() { echo -e "${YELLOW}⏭ $* déjà installé, skip.${NC}"; }

# ── APT de base ────────────────────────────────────────────────
info "Mise à jour APT..."
sudo apt update -q
sudo apt upgrade -y

APT_PACKAGES=(
  # Outils de base
  zsh stow git curl wget build-essential
  # pyenv requirements
  libssl-dev libreadline-dev libncursesw5-dev zlib1g-dev
  libffi-dev libbz2-dev liblzma-dev libsqlite3-dev
  # Terminal & shell
  git-delta bat kitty ripgrep
  # Périphériques
  solaar
  # GNOME
  gnome-tweaks gnome-shell-extension-manager orchis-gtk-theme papirus-icon-theme
  # Launcher
  wofi
  # LaTeX
  texlive-xetex texlive-fonts-extra texlive-fonts-recommended
  texlive-lang-french latexmk
)

for pkg in "${APT_PACKAGES[@]}"; do
  if dpkg -s "$pkg" &>/dev/null; then
    skip "$pkg"
  else
    info "Installation de $pkg..."
    sudo apt install -y "$pkg" && echo "  ✓ $pkg installé"
  fi
done

# ── Docker ────────────────────────────────────────────────────
if ! command -v docker &>/dev/null; then
  info "Installation de Docker..."
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt update -q
  sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
  sudo usermod -aG docker "$USER"
  echo "  ✓ Docker installé (reconnecte-toi pour le groupe docker)"
else
  skip "Docker"
fi

# ── eza ───────────────────────────────────────────────────────
if ! command -v eza &>/dev/null; then
  info "Installation de eza..."
  sudo mkdir -p /etc/apt/keyrings
  wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc \
    | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
  echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" \
    | sudo tee /etc/apt/sources.list.d/gierens.list > /dev/null
  sudo apt update -q
  sudo apt install -y eza
  echo "  ✓ eza installé"
else
  skip "eza"
fi

# ── GitHub CLI (gh) ───────────────────────────────────────────
if ! command -v gh &>/dev/null; then
  info "Installation de GitHub CLI (gh)..."
  sudo mkdir -p /etc/apt/keyrings
  wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null
  sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
    | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
  sudo apt update -q
  sudo apt install -y gh
  echo "  ✓ GitHub CLI installé"
else
  skip "GitHub CLI (gh)"
fi

# ── atuin ─────────────────────────────────────────────────────
if ! command -v atuin &>/dev/null; then
  info "Installation de atuin..."
  curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
  echo "  ✓ atuin installé"
else
  skip "atuin"
fi

# ── zoxide ────────────────────────────────────────────────────
if ! command -v zoxide &>/dev/null; then
  info "Installation de zoxide..."
  curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
  echo "  ✓ zoxide installé"
else
  skip "zoxide"
fi

# ── zsh comme shell par défaut ─────────────────────────────────
if [ "$SHELL" != "$(which zsh)" ]; then
  info "Passage à zsh..."
  chsh -s "$(which zsh)"
fi

# ── Starship ──────────────────────────────────────────────────
if ! command -v starship &>/dev/null; then
  info "Installation de Starship..."
  curl -sS https://starship.rs/install.sh | sh -s -- --yes
else
  skip "Starship"
fi

# ── pyenv ─────────────────────────────────────────────────────
if [ ! -d "$HOME/.pyenv" ]; then
  info "Installation de pyenv..."
  curl https://pyenv.run | bash
else
  skip "pyenv"
fi

# ── uv ────────────────────────────────────────────────────────
if ! command -v uv &>/dev/null; then
  info "Installation de uv..."
  curl -LsSf https://astral.sh/uv/install.sh | sh
else
  skip "uv"
fi

# ── rbenv ─────────────────────────────────────────────────────
if [ ! -d "$HOME/.rbenv" ]; then
  info "Installation de rbenv..."
  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
else
  skip "rbenv"
fi

# ── nvm ───────────────────────────────────────────────────────
if [ ! -d "$HOME/.nvm" ]; then
  info "Installation de nvm..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
else
  skip "nvm"
fi

# ── gnome-extensions-cli (gext) ───────────────────────────────
if ! command -v gext &>/dev/null; then
  info "Installation de gnome-extensions-cli..."
  pip3 install --user gnome-extensions-cli
  echo "  ✓ gext installé"
else
  skip "gext"
fi

# ── Snap apps ─────────────────────────────────────────────────
info "Installation des apps Snap..."

declare -A SNAP_PACKAGES=(
  ["code"]="--classic"
  ["bruno"]=""
  ["spotify"]=""
  ["localsend"]=""
)

for pkg in "${!SNAP_PACKAGES[@]}"; do
  if snap list "$pkg" &>/dev/null; then
    skip "$pkg (snap)"
  else
    info "Installation de $pkg..."
    sudo snap install "$pkg" ${SNAP_PACKAGES[$pkg]} && echo "  ✓ $pkg installé"
  fi
done

# ── Google Chrome ─────────────────────────────────────────────
if ! command -v google-chrome &>/dev/null; then
  info "Installation de Google Chrome..."
  curl -fsSL https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o /tmp/chrome.deb
  sudo apt install -y /tmp/chrome.deb
  rm /tmp/chrome.deb
  echo "  ✓ Google Chrome installé"
else
  skip "Google Chrome"
fi

# ── JetBrains Mono Nerd Font ─────────────────────────────────────────────
mkdir -p ~/.local/share/fonts
wget -O /tmp/JetBrainsMono.zip \
  https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
unzip /tmp/JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono
fc-cache -fv
rm /tmp/JetBrainsMono.zip

# ── papirus-folders ───────────────────
curl -Lo /usr/local/bin/papirus-folders \
  https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-folders/master/papirus-folders
chmod +x /usr/local/bin/papirus-folders
papirus-folders -C grey --theme Papirus-Dark

# — OpenDeck AKP153 (Soomfon) ————————————————
sudo curl -fsSL https://raw.githubusercontent.com/4ndv/opendeck-akp153/refs/heads/main/40-opendeck-akp153.rules \
  -o /etc/udev/rules.d/40-opendeck-akp153.rules

sudo udevadm control --reload-rules
sudo udevadm trigger

# ── Extensions GNOME ──────────────────────────────────────────
info "Installation des extensions GNOME..."

EXTENSIONS=(
  "Vitals@CoreCoding.com"
  "caffeine@patapon.info"
  "dash-to-panel@jderose9.github.com"
  "blur-my-shell@aunetx"
  "forge@jmmaranan.com"
  "rounded-window-corners@fxgn"
  "just-perfection-desktop@just-perfection"
  "space-bar@luchrioh"
)
for ext in "${EXTENSIONS[@]}"; do
  if gext list | grep -q "$ext"; then
    skip "Extension $ext"
  else
    info "Installation de $ext..."
    gext install "$ext" && echo "  ✓ $ext installé"
  fi
done

# ── Désactivation des extensions par défaut ───────────────────
info "Désactivation des extensions par défaut..."

DISABLE_EXTENSIONS=(
  "ubuntu-dock@ubuntu.com"
  "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
)

for ext in "${DISABLE_EXTENSIONS[@]}"; do
  info "Désactivation de $ext..."
  gext disable "$ext" 2>/dev/null && echo "  ✓ $ext désactivé" || echo "  ⏭ $ext non trouvé, skip"
done

# ── Paramètres GNOME ───────────────────
echo "Configuration GNOME..."
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Orchis-Dark'
gsettings set org.gnome.shell.extensions.ding show-home false

# ── Claude ───────────────────
curl -fsSL https://claude.ai/install.sh | bash

echo ""
info "Bootstrap terminé ! Lance maintenant :"
echo "  cd ~/dotfiles && bash scripts/install.sh"
echo ""
echo "  Puis redémarre ton terminal (ou : exec zsh)"
