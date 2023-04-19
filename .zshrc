# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  rails
  ruby
  git-flow
  ubuntu
  nvm
  rvm
  ssh-agent
  zsh-syntax-highlighting
  zsh-autosuggestions
)

# ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='vim'
 fi

export NVM_DIR=~/.nvm
 [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

export NVIM="$HOME/.config/nvim/"

source ~/.aliases

eval "$(starship init zsh)"
source /etc/profile.d/rvm.sh

fpath=( ~/.zshfn "${fpath[@]}" )
autoload -Uz venv
autoload -Uz reset_pg_bdd

export PATH=~/.npm-global/bin:$PATH
