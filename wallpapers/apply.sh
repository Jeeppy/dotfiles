WALLPAPER="$HOME/Pictures/Wallpapers/my-wallpaper.jpg"
cp ~/dotfiles/wallpapers/*.jpg ~/Pictures/Wallpapers/
gsettings set org.gnome.desktop.background picture-uri "file://$WALLPAPER"
gsettings set org.gnome.desktop.background picture-uri-dark "file://$WALLPAPER"
