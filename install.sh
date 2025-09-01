#!/bin/bash

# ----------------------------------------------------------
# Load the library and packages list
# ----------------------------------------------------------

source ./scripts/lib.sh
source ./scripts/packages.sh


# ----------------------------------------------------------
# Displaying welcome message
# ----------------------------------------------------------

welcome_message

sleep 2
clear


# ----------------------------------------------------------
# Ask if the user wants to do a backup of the current .config folder
# ----------------------------------------------------------

info_message "Do you want to backup your current .config directory? (y/n, default: y): "
read backup_choice
backup_choice=${backup_choice:-y}  # Default to 'y' if empty
if [[ "$backup_choice" == "y" ]]; then
  cp -a ~/.config ~/config_backup
  success_message "Backup of .config created at ~/config_backup"
fi

sleep 1
clear


# ----------------------------------------------------------
# Ask if the user wants to update the mirrorlist
# ----------------------------------------------------------

info_message "Do you want to update the mirrorlist to use the 10 best servers of your country? (y/n, default:y): "
read mirror_choice
mirror_choice=${mirror_choice:-y}

if [[ "$mirror_choice" == "y" ]]; then
  sudo pacman -S --needed --noconfirm reflector rsync
  while true; do
    clear
    info_message "Specify your country (country name):"
    read country_choice
    
    if reflector --list-countries 2>/dev/null | grep -qi "^${country_choice}"; then
      info_message "Updating mirrorlist for $country_choice..."
      if sudo reflector --country "$country_choice" --latest 10 --sort rate --save /etc/pacman.d/mirrorlist; then
        success_message "Mirrorlist updated successfully!"
        break
      else
        error_message "Error updating mirrorlist. Please try again."
        sleep 1
      fi
    else
      error_message "'$country_choice' is not a valid country name."
      sleep 1
      info_message "Would you like to try again? (y/n, default:y): "
      read retry_choice
      retry_choice=${retry_choice:-y}
      if [[ "$retry_choice" != "y" ]]; then
        info_message "Skipping mirrorlist update."
        break
      fi
    fi
  done
fi

sleep 1
clear


# ----------------------------------------------------------
# Check if yay is installed. If not, installs it
# ----------------------------------------------------------

if command -v yay > /dev/null; then
  success_message "yay is installed. Skipping installation"
else
  error_message "yay is not installed. Installing..."
  sleep 1
  sudo pacman -S --needed --noconfirm base-devel less
  whereami=$(pwd)
  git clone https://aur.archlinux.org/yay.git ~/Downloads/yay
  cd ~/Downloads/yay
  makepkg -si
  cd $whereami
  rm -rf ~/Downloads/yay
  success_message "yay has been installed successfully"
fi

sleep 1
clear


# ----------------------------------------------------------
# Install packages
# ----------------------------------------------------------

info_message "Installing packages...."

sleep 1

# Hypr packages
installPackages "${hypr[@]}"

# Terminal
installPackages "${terminal[@]}"

# Network
installPackages "${network[@]}"

# File explorer
installPackages "${file_explorer[@]}"

# Wallpapers
installPackages "${wallpapers[@]}"

# Apps
installPackages "${apps[@]}"

# Various
installPackages "${various[@]}"

# GTK Themes
installPackages "${gtk_themes[@]}"

# Fonts
installPackages "${fonts[@]}"

success_message "Packages installed successfully."

sleep 1
clear


# ----------------------------------------------------------
# Apply oh-my-zsh and plugins
# ----------------------------------------------------------

info_message "Installing Oh My Zsh and plugins..."

sleep 1

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Applying plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

success_message "Oh My Zsh and plugins installed successfully."

sleep 1
clear


# ----------------------------------------------------------
# Download and apply plymouth boot animation
# ----------------------------------------------------------

info_message "Downloading and applying Plymouth boot animation..."

sleep 1

git clone https://github.com/MrE8065/PSLinux.git ~/PSLinux
sudo cp -r ~/PSLinux/pslinux /usr/share/plymouth/themes
sudo plymouth-set-default-theme -R pslinux

success_message "Plymouth boot animation downloaded successfully."

sleep 2
clear

info_message "Do you want to add the plymouth entry to the mkinitcpio file? If you select no, REMEMBER TO ADD IT TO SHOW THE CUSTOM BOOT ANIMATION (y/n, default:y): "
read mkinit_choice
mkinit_choice=${mkinit_choice:-y}

if [[ "$mkinit_choice" == "y" ]]; then
  info_message "Creating a backup of mkinitcpio.conf."
  sudo cp /etc/mkinitcpio.conf /etc/mkinitcpio_backup.conf
  info_message "REMEMBER TO DELETE IT IF THE INSTALLATION IS SUCCESSFUL"
  sleep 2

  # Script to autodetect if the user is using systemd or udev and add plymouth entry accordingly
  HOOKS_LINE=$(grep "^HOOKS=" /etc/mkinitcpio.conf)

  if [[ "$HOOKS_LINE" == *"udev"* ]]; then
    info_message "udev detected"
    NEW_LINE=$(echo "$HOOKS_LINE" | sed -E 's/(udev)/\1 plymouth/')
  elif [[ "$HOOKS_LINE" == *"systemd"* ]]; then
    info_message "systemd detected"
    NEW_LINE=$(echo "$HOOKS_LINE" | sed -E 's/(systemd)/\1 plymouth/')
  else
    info_message "No udev or systemd found in HOOKS. Aborting."
    exit 1
  fi

  # Replace HOOKS line with the modified one
  sudo sed -i "s|^HOOKS=.*|$NEW_LINE|" /etc/mkinitcpio.conf

  info_message "HOOKS line updated."
  grep "^HOOKS=" /etc/mkinitcpio.conf

  # Regenerate initramfs
  info_message "Regenerating initramfs images..."
  sudo mkinitcpio -P
  success_message "Plymouth entry successfully added to the mkinitcpio.conf file."
  info_message "Remember to add splash to your kernel parameters to see the boot animation."
  info_message "See the archwiki entry for Plymouth for more information."
  sleep 2
else
  info_message "Skipping mkinitcpio modification." 
  info_message "REMEMBER TO ADD PLYMOUTH ENTRY MANUALLY TO SHOW THE CUSTOM BOOT ANIMATION."
  info_message "ALSO ADD SPLASH TO THE KERNEL PARAMETERS TO SEE THE ANIMATION."
  info_message "See the archwiki entry for Plymouth for more information."
  sleep 2
fi

sleep 2
clear


# ----------------------------------------------------------
# Download and apply sddm theme
# ----------------------------------------------------------

info_message "Do you want to install and apply the sddm theme? (y/n, default:y): "
read sddm_choice
sddm_choice=${sddm_choice:-y} # Default to 'y' if empty

if [[ "$sddm_choice" == "y" ]]; then
  info_message "Downloading SDDM theme..."

  sleep 1

	installPackages "sddm-silent-theme"

  sleep 1

  success_message "SDDM theme downloaded successfully."

  sleep 1

  info_message "Applying SDDM theme..."

  sleep 1

  sudo tee /etc/sddm.conf > /dev/null << 'EOF'
[Theme]
Current=silent

[General]
InputMethod=qtvirtualkeyboard
GreeterEnvironment=QML2_IMPORT_PATH=/usr/share/sddm/themes/silent/components/,QT_IM_MODULE=qtvirtualkeyboard
EOF

  success_message "SDDM theme applied successfully."
fi

sleep 1
clear


# ----------------------------------------------------------
# Ask the user if wants to install laptop packages
# ----------------------------------------------------------

info_message "Do you want to install the laptop packages (brightnessctl, bluetooth and power-profiles)? (y/n, default:n): "
read laptop_choice
laptop_choice=${laptop_choice:-n} # Default to 'n' if empty

if [[ "$laptop_choice" == "y" ]]; then
	installPackages "${laptop[@]}"
  systemctl enable bluetooth
  success_message "Laptop packages installed and Bluetooth service enabled."
else
  info_message "Skipping laptop packages installation."
  sleep 1
  info_message "Installing brightness controller for desktop computers."
  sleep 2
  installPackages "ddcutil"
  success_message "Brightness controller for desktop computers installed successfully."
fi

sleep 1
clear


# ----------------------------------------------------------
# Optional apps
# ----------------------------------------------------------

info_message "Do you want to install the optional apps? (y/n, default:y): "
read apps_choice
apps_choice=${apps_choice:-y} # Defaults to 'y' if empty
if [[ "$apps_choice" == "y" ]]; then
	installPackages "${optional[@]}"
  success_message "Optional apps installed successfully."

  sleep 1

  info_message "Installing Spicetify for Spotify customization..."

  sleep 1

  # Install Spicetify for Spotify customization
  curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
  success_message "Spicetify has been installed successfully."
fi

sleep 1
clear


# ----------------------------------------------------------
# Copying the config files
# ----------------------------------------------------------

info_message "Copying config files..."

sleep 1

cp -r ~/MyDotfiles/wallpapers ~/
cp -a ~/MyDotfiles/.config ~/
cp ~/MyDotfiles/.zshrc ~/

success_message "Config files copied successfully."

sleep 1
clear


# ----------------------------------------------------------
# Changing the wallpaper and colors
# ----------------------------------------------------------

info_message "Changing the wallpaper and colors..."

sleep 1

waypaper --wallpaper ~/wallpapers/GNU-LINUX.png
wal -i ~/wallpapers/GNU-LINUX.png -n --cols16

success_message "Wallpaper and colors changed successfully."

sleep 1
clear


# ----------------------------------------------------------
# Finish message
# ----------------------------------------------------------

finish_setup
