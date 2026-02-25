#!/usr/bin/env bash

echo "Restauration des extensions GNOME..."

dconf load /org/gnome/shell/extensions/dash-to-panel/ < ~/dotfiles/gnome/dash-to-panel.dconf
dconf load /org/gnome/shell/extensions/forge/ < ~/dotfiles/gnome/forge.dconf
dconf load /org/gnome/shell/extensions/space-bar/ < ~/dotfiles/gnome/space-bar.dconf
dconf load /org/gnome/shell/extensions/blur-my-shell/ < ~/dotfiles/gnome/blur-my-shell.dconf

echo "Done ✓"