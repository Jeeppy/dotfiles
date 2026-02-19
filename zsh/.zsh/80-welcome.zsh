# ============================================
# message d'accueil
# ============================================

welcome_message() {
  (
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

    local UPTIME=$(uptime -p | sed 's/up //')
    local KERNEL=$(uname -r)
    local SHELL_VERSION=$(zsh --version | cut -d' ' -f2)
    local DISTRO=$(lsb_release -d 2>/dev/null | cut -f2 || echo "Linux")
    local PACKAGES=$(dpkg -l | grep ^ii | wc -l)

    echo -e ""
    echo -e "${CYAN}╔═════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${CYAN}║${RESET}  ${BOLD}${PURPLE}🐧 Welcome 🐧${RESET} ${DARK_GRAY} ${RESET}                                            ${CYAN}║${RESET}"
    echo -e "${CYAN}╠═════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${CYAN}║${RESET}    ${YELLOW}Système${RESET}                                                  ${CYAN}║${RESET}"
    echo -e "${CYAN}║${RESET}    ${BLUE}OS${RESET}        ${DARK_GRAY}:${RESET} ${GRAY}${DISTRO}${RESET}                                 ${CYAN}║${RESET}"
    echo -e "${CYAN}║${RESET}    ${BLUE}Kernel${RESET}    ${DARK_GRAY}:${RESET} ${GRAY}${KERNEL}${RESET}                            ${CYAN}║${RESET}"
    echo -e "${CYAN}║${RESET}    ${BLUE}Shell${RESET}     ${DARK_GRAY}:${RESET} ${GRAY}zsh ${SHELL_VERSION}${RESET}                                      ${CYAN}║${RESET}"
    echo -e "${CYAN}║${RESET}    ${BLUE}Packages${RESET}  ${DARK_GRAY}:${RESET} ${GRAY}${PACKAGES}${RESET}                                         ${CYAN}║${RESET}"
    echo -e "${CYAN}╚═════════════════════════════════════════════════════════════╝${RESET}"
    echo -e ""
  )
}

welcome_message
