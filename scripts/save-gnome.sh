#!/usr/bin/env bash

echo "Sauvegarde des extensions GNOME..."

mkdir -p ~/dotfiles/gnome

dconf dump /org/gnome/shell/extensions/dash-to-panel/ > ~/dotfiles/gnome/dash-to-panel.dconf
dconf dump /org/gnome/shell/extensions/forge/ > ~/dotfiles/gnome/forge.dconf
dconf dump /org/gnome/shell/extensions/space-bar/ > ~/dotfiles/gnome/space-bar.dconf
dconf dump /org/gnome/shell/extensions/just-perfection/ > ~/dotfiles/gnome/just-perfection.dconf
dconf dump /org/gnome/shell/extensions/blur-my-shell/ > ~/dotfiles/gnome/blur-my-shell.dconf

echo "Done ✓"