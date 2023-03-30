# To do after install

## Summary
* [Requirements](#requirements)
  * [Check for update](#check-for-update)
  * [Improve battery](#improve-battery)
  * [Curl](#curl)
  * [Git](#git)
  * [OpenJdk](#openjdk)
  * [Ca-certificates](#ca-certificates)
  * [Gnupg](#gnupg)
  * [Lsb](#lsb)
  * [Software-properties-common](#software-properties-common)
* [Terminal](#terminal)
  * [Alacritty](#alacritty)
  * [ZSH](#zsh)
    * [Oh My Zsh](#oh-my-zsh)
  * [Bat](#bat)
  * [Exa](#exa)
* [Interface](#interface)
  * [Conky](#conky)
  * [Minimize on click for dock](#minimize-on-click-for-dock)
  * [Workspaces on secondary monitor](#workspaces-on-secondary-monitor)
  * [Ulauncher](#ulauncher)
* [Development](#development)
  * [Ruby](#ruby)
    * [RVM](#rvm)
  * [Python](#python)
  * [NodeJS](#nodejs)
  * [IDE](#ide)
    * [Neovim](#neovim)
    * [VSCode](#vscode)
  * [Tools](#tools)
    * [Dbeaver](#dbeaver)
    * [Docker](#docker)
    * [Meld](#meld)
    * [Insomnia](#insomnia)
    * [Latex](#latex)
  * [Databases](#databases)
    * [MySQL client](#mysql-client)
* [Multimedia](#multimedia)
  * [Multimedia support](#multimedia-support)
  * [Gnome sushi](#gnome-sushi)
* [Applications](#applications)
  * [GIMP](#gimp)
  * [Google Chrome](#google-chrome)
  * [Slacks](#slacks)
  * [Teams](#teams)
  * [Timeshift](#timeshift)
  * [VLC](#vlc)
  * [Gnome Feeds](#gnome-feeds)
  * [Solaar](#solaar)
* [Dotfiles](#dotfiles)
  * [Neovim](#neovim-2)
  * [Alacritty](#alacritty-2)
  * [ZSH](#zsh-2)
  * [Conky](#conky-2)

## Requirements

### Check for update

`sudo apt update && sudo apt upgrade`

### Improve battery

```
sudo apt install tlp tlp-rdw
sudo systemctl enable tlp
```

### Curl

`sudo apt install curl`

### Git

`sudo apt install git`

### OpenJdk

`sudo apt install default-jdk`

### Ca-certificates

`sudo apt install ca-certificates`

### Gnupg

`sudo apt install gnupg`

### Lsb

`sudo apt install lsb-release`

### Software-properties-common

`sudo apt install software-properties-common`

## Terminal

### Alacritty

```
sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt install alacritty
```

### ZSH

```
sudo apt install zsh
chsh -s $(which zsh)
```

#### Oh my Zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Bat

`sudo atp install bat`

### Exa

`sudo apt install exa`

## Interface

### Conky

`sudo apt install conky-all`

### Minimize on click for dock

`gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'`

### Workspaces on secondary monitor

`gsettings set org.gnome.mutter workspaces-only-on-primary false`

## Ulauncher

`sudo apt install ulauncher`

## Development

### Ruby

```
sudo apt install g++ gcc autoconf automake bison libc6-dev libffi-dev libgdbm-dev libncurses5-dev libsqlite3-dev libtool libyaml-dev make pkg-config sqlite3 zlib1g-dev libgmp-dev libreadline-dev libssl-dev
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 3.0.0
```

### Python

```
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.11
```

###  NodeJS

```
sudo apt install nodejs
sudo apt install npm
```

### IDE

#### Neovim

```
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
sudo dpkg -i nvim-linux64.deb
```

#### VSCode

`sudo snap install code --classic`

### Tools

#### Dbeaver

```
curl -fsSL https://dbeaver.io/debs/dbeaver.gpg.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/dbeaver.gpg
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
sudo apt update
sudo apt install dbeaver-ce
```

#### Docker

```
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io
sudo groupadd docker
sudo usermod -aG docker $USER
sudo chown $USER:$USER /home/$USER/.docker -R
sudo chmod g+rwx $HOME/.docker -R
sudo apt install docker-compose-plugin
```

#### Meld

`sudo apt install meld`

#### Insomnia

```
echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list
sudo apt update
sudo apt install insomnia
```

#### Latex

`sudo apt-get install texlive texlive-lang-french texlive-latex-extra lmodern`

### Databases

#### MySQL client

`sudo apt install mysql-client`

## Multimedia support

`sudo apt install ubuntu-restricted-extras`

### Gnome sushi

`sudo apt-get install gnome-sushi`

## Applications

### GIMP

`sudo apt install gimp`

### Google Chrome

```
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
```

### Slacks

`sudo snap install slack --classic`

### Teams

`sudo snap install teams`

### Timeshift

```
sudo apt-add-repository -y ppa:teejee2008/ppa
sudo apt-get update
sudo apt-get install timeshift
```

### VLC

`sudo snap install VLC`

### Gnome feeds

`sudo ap install gnome-feeds`

### Solaar

`sudo apt-get install solaar`

## Dotfiles

### Neovim

### Alacritty

### Zsh

### Conky
