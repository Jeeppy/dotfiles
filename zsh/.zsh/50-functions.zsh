# ============================================
# fonction utiles
# ============================================

mkcd() { mkdir -p "$1" && cd "$1" }

zsh-update() {
  echo "🔄 Updating Zinit and plugins..."
  zinit self-update && zinit update --all
  echo "✅ All Zinit plugins updated!"
}

update() {
  echo "🛠️ Updating system"
  sudo apt update && sudo apt upgrade -y
  snap refresh
  zsh-update
}

# ============================================
# help
# ============================================

help() {
  local RESET='\033[0m'
  local BOLD='\033[1m'
  local DIM='\033[2m'
  local ORANGE='\033[38;5;208m'      # #CC7832 - Keywords Darcula
  local CYAN='\033[38;5;73m'         # #6897BB - Strings Darcula
  local GREEN='\033[38;5;107m'       # #6A8759 - Strings/Success Darcula
  local YELLOW='\033[38;5;186m'      # #FFC66D - Warnings Darcula
  local BLUE='\033[38;5;104m'        # #9876AA - Variables Darcula
  local PURPLE='\033[38;5;141m'      # #CC7832 purple variant
  local GRAY='\033[38;5;145m'        # #A9B7C6 - Default text Darcula
  local DARK_GRAY='\033[38;5;59m'    # #606366 - Comments Darcula
  local WIDTH=63
  local WIDTH_MINUS=$((WIDTH-4))

  echo -e ""
  echo -e "${CYAN}╔═════════════════════════════════════════════════════════════╗${RESET}"
  echo -e "${CYAN}║${RESET}  ${BOLD}${PURPLE}🐙 Liste des aliases 🐙${RESET}                                    ${CYAN}║${RESET}"
  echo -e "${CYAN}╠═════════════════════════════════════════════════════════════╣${RESET}"

  _print_category() {
      local category=$1
      shift
      printf "${CYAN}║${RESET}  ${YELLOW}%-${WIDTH_MINUS}s${RESET}${CYAN}║${RESET}\n" "${category}:"
      for a in "$@"; do
          local val=$(alias $a 2>/dev/null | sed "s/^alias $a='//;s/'$//")
          printf "${CYAN}║${RESET}    ${ORANGE}%-8s${RESET} ${DARK_GRAY}→${RESET} ${GRAY}%-46s${RESET}${CYAN}║${RESET}\n" "$a" "$val"
      done
  }

  _print_tools() (
      local tools=("$@")
      printf "${CYAN}║${RESET}  ${YELLOW}%-${WIDTH_MINUS}s${RESET}${CYAN}║${RESET}\n" "Outils:"
      for t in "${tools[@]}"; do
          if command -v $t >/dev/null 2>&1; then
              symbol="\033[38;5;107m✓\033[0m"   # vert
          else
              symbol="\033[38;5;196m✗\033[0m"   # rouge
          fi
          printf "${CYAN}║${RESET}    ${ORANGE}%-11s${RESET} %b%$((WIDTH_MINUS-15))s${CYAN}║${RESET}\n" "$t" "$symbol" ""
      done
  )

  _print_category "Git" gst gl gc gp glog gco gd lg
  _print_category "Docker" dc dco
  _print_category "System" install remove c h ip
  _print_category "Dev" py rb
  echo -e "${CYAN}╠═════════════════════════════════════════════════════════════╣${RESET}"
  _print_tools zinit starship eza batcat delta atuin zoxide fzf fd rg helix code lazygit
  echo -e "${CYAN}╚═════════════════════════════════════════════════════════════╝${RESET}"
  echo -e ""
}
