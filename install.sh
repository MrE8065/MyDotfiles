#!/bin/bash

# Welcome to my dotfiles installer :)

clear

### Displaying welcome message ###

echo -e "\n\t=== === === === === === === === === === === "
echo -e "\t=== Welcome to my dotfiles installer :) ==="
echo -e "\t=== === === === === === === === === === ===\n\n"

##################################

sleep 1
clear

### Ask if the user wants to do a backup of the current .config folder ###

read -p "Do you want to backup your current .config directory? (y/n, default: y): " backup_choice
backup_choice=${backup_choice:-y}  # Default to 'y' if empty
if [[ "$backup_choice" == "y" ]]; then
  cp -r ~/.config ~/config_backup
  echo "Backup of .config created at ~/config_backup"
fi

##########################################################################

sleep 1
clear

### Ask the user if wants to update the mirrorlist ###
read -p "Do you to update the mirrorlist to use the 10 best servers of your country? (y/n, default:y): " mirror_choice
mirror_choice=${mirror_choice:-y} # Default to 'y' if empty

if [[ "$mirror_choice" == "y" ]]; then
    read -p "Specify you country (country name, default: Spain): " country_choice
    country_choice=${country_choice:-Spain} # Default to 'Spain' if empty
	  pacman -S --needed reflector
	  sudo reflector --country "$country_choice" --latest 10 --sort rate --save /etc/pacman.d/mirrorlist
fi

######################################################

sleep 1
clear

### Check if yay is installed. If not, installs it ###

if command -v yay > /dev/null; then
  echo "yay is installed. Skipping installation"
else
  echo "yay is not installed. Installing..."
  sudo pacman -S --needed base-devel less
  SCRIPT=$(realpath "$0")
  temp_path=$(dirname "$SCRIPT")
  git clone https://aur.archlinux.org/yay.git ~/Downloads/yay
  cd ~/Downloads/yay
  makepkg -si
  cd $temp_path
  echo "yay has been installed successfully"
fi

######################################################

sleep 1
clear

### Install packages ###

echo "Installing packages...."

# Hypr packages
yay -S- -needed hypridle hyprlock hyprpicker hyprshot

# Terminal
yay -S --needed zsh unzip starship ripgrep neovim lsd fastfetch htop

# Network
yay -S --needed network-manager-applet nm-connection-editor

# File explorer
yay -S --needed thunar tumbler gvfs

# Wallpapers
yay -S --needed waypaper swww

# Various
yay -S --needed wlogout wofi swaync waybar pavucontrol wf-recorder slurp checkupdates-with-aur python-pywal16 python-pywalfox ddcutil xdg-desktop-portal-gtk xdg-desktop-portal-hyprland

# GTK Themes
yay -S --needed materia-gtk-theme bibata-cursor-theme-bin papirus-icon-theme nwg-look

# Fonts
yay -S --needed ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra

########################

sleep 1
clear

### Apply oh-my-zsh ###

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Applying plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

#######################

sleep 1
clear

### Ask the user if wants to install laptop packages ###

read -p "Do you want to install the laptop packages (bluetooth, and power-plans)? (y/n, default:n): " laptop_choice
laptop_choice=${laptop_choice:-n} # Default to 'n' if empty

if [[ "$laptop_choice" == "y" ]]; then
	yay -S --needed blueman power-profiles-daemon
  systemctl enable bluetooth
fi

########################################################

sleep 1
clear

### Optional apps ###

read -p "Do you want to install the optional apps? (y/n, default:y): " apps_choice
apps_choice=${apps_choice:-y} # Defaults to 'y' if empty
if [[ "$apps_choice" == "y" ]]; then
	yay -S --needed firefox spotify-launcher visual-studio-code-bin vlc vcl-plugins-all
fi

#####################

sleep 1
clear

### Copying the config files ###

cp -r ~/MyDotfiles/wallpapers ~/
cp -a ~/MyDotfiles/.config/* ~/.config
cp ~/MyDotfiles/.zshrc ~/

################################


### Changing the wallpaper and colors ###

waypaper --wallpaper ~/wallpapers/GNU-LINUX.png
sh ~/.config/waypaper/change.sh ~/wallpapers/GNU-LINUX.png

#########################################


notify-send "Welcome, $USER" "Thank you for downloading my Dotfiles :)"

echo -e "\n\tChanging shell to zsh"
chsh -s $(which zsh)

echo "Finished customizations. Restart the machine to enjoy your new customization :)"
