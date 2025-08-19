# ----------------------------------------------------------
# Define message colors
# ----------------------------------------------------------

PURPLE='\033[0;35m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# ----------------------------------------------------------
# Colored messages
# ----------------------------------------------------------

info_message() {
  echo -e "${PURPLE}$1${NC}"
}

success_message() {
  echo -e "${GREEN}$1${NC}"
}

error_message() {
  echo -e "${RED}$1${NC}"
}

# ----------------------------------------------------------
# Welcome message
# ----------------------------------------------------------

welcome_message() {
  clear
  echo -e "${PURPLE}"
  echo -e "\t___  ___     ______      _    __ _ _           "
  echo -e "\t|  \/  |     |  _  \    | |  / _(_) |          "
  echo -e "\t| .  . |_   _| | | |___ | |_| |_ _| | ___  ___ "
  echo -e "\t| |\/| | | | | | | / _ \| __|  _| | |/ _ \/ __|"
  echo -e "\t| |  | | |_| | |/ / (_) | |_| | | | |  __/\__ \\"
  echo -e "\t\\_|  |_/\\__, |___/ \\___/ \\__|_| |_|_|\\___||___/"
  echo -e "\t         __/ |                                 "
  echo -e "\t        |___/                                  \n"

  echo -e "\t      Welcome to my dotfiles installer :)"
  echo -e "${NC}\n"
}

# ----------------------------------------------------------
# Finish setup
# ----------------------------------------------------------

finish_setup() {
  notify-send "Welcome, $USER" "Thank you for downloading my Dotfiles :)"
  info_message "Changing shell to zsh"
  chsh -s $(which zsh)
  success_message "Finished customizations. Restart the machine to enjoy your new rice :)"
}

# ----------------------------------------------------------
# Install packages
# ----------------------------------------------------------

installPackages() {
  for pkg; do
    if [[ $(pacman -Q "${pkg}" 2>/dev/null) ]]; then
      success_message "${pkg} is already installed"
      continue
    fi
    yay -S --needed --noconfirm --answerclean All --answerdiff None "${pkg}"
  done
}