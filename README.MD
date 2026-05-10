<div align="center">

![Typing SVG](https://readme-typing-svg.demolab.com?font=Bitcount+Grid+Single&pause=1000&color=DCDCDC&center=true&vCenter=true&random=true&width=435&lines=Welcome+to+my+dotfiles!;Are+you+reading+this%3F;I+use+Arch+BTW!)

<a href="#welcome"><kbd> <br> Welcome! <br> </kbd></a>&ensp;&ensp;
<a href="#system-overview"><kbd> <br> System overview <br> </kbd></a>&ensp;&ensp;
<a href="#final-look"><kbd> <br> Final look <br> </kbd></a>&ensp;&ensp;
<a href="#how-to-install"><kbd> <br> How to install? <br> </kbd></a>&ensp;&ensp;
<a href="#keybinds"><kbd> <br> Keybinds <br> </kbd></a>&ensp;&ensp;
<a href="#packages"><kbd> <br> Packages <br> </kbd></a>&ensp;&ensp;
<a href="#after-installation"><kbd> <br> After Installation <br> </kbd></a>

</div>

<br>

> [!IMPORTANT]
> I have updated most of the things in this repo. Are you looking for the old hyprland dotfiles? [They are in a separate branch](https://github.com/MrE8065/MyDotfiles/tree/hyprland)

<a id="welcome"></a>

# 👋 Welcome!

Hi! This is my personal repo for my linux rice. First of all: I configured things the way I WANT THEM. Maybe you like it, maybe you don't. Read all this readme before you download anything.

If you find any errors or need help, feel free to [create an issue](https://github.com/MrE8065/MyDotfiles/issues) and i will try to help :).

<br>

<a id="system-overview"></a>

# 🔍 System overview

<br>

<div align="center">

|      Distro       |                                            [Arch](https://archlinux.org)                                            |
| :---------------: | :-----------------------------------------------------------------------------------------------------------------: |
|        WM         |                                       [Niri](https://niri-wm.github.io/niri/)                                       |
|     Terminal      |                                  [Alacritty](https://github.com/kovidgoyal/kitty)                                   |
|        Bar        |                                     [Waybar](https://github.com/Alexays/Waybar)                                     |
|       Shell       |                          [Zsh](https://www.zsh.org) with [Antidote](https://antidote.sh/)                           |
|   Shell Prompt    |                                           [Starship](https://starship.rs)                                           |
|   App launcher    |                                         [Vicinae](https://www.vicinae.com/)                                         |
|   File manager    |                                 [Nautilus](https://gitlab.gnome.org/GNOME/nautilus)                                 |
|      Editors      |               [Neovim](https://github.com/neovim/neovim) and [VSCode](https://code.visualstudio.com/)               |
|      Browser      |                                           [Firefox](https://firefox.com)                                            |
|    Power menu     |                                  [wlogout](https://github.com/ArtsyMacaw/wlogout)                                   |
|   Notifications   |                                      [Mako](https://github.com/emersion/mako)                                       |
|    Lockscreen     |                                   [Swaylock](https://github.com/swaywm/swaylock)                                    |
|  Display Manager  |                                      [Ly](https://codeberg.org/fairyglade/ly)                                       |
| Wallpaper manager |                                     [Swaybg](https://github.com/swaywm/swaybg)                                      |
|   Image viewer    |                                      [qview](https://interversehq.com/qview/)                                       |
|  GTK/Icons theme  |                 [Kanagawa (dragon variant)](https://github.com/Fausto-Korpsvart/Kanagawa-GKT-Theme)                 |
|   Cursor theme    |                                  [Bibata](https://github.com/ful1e5/Bibata_Cursor)                                  |
|       Fonts       | [MesloLG from Nerd Fonts](https://www.nerdfonts.com/font-downloads) and [Noto Fonts](https://fonts.google.com/noto) |

</div>

<br>

<a id="final-look"></a>

# 👀 Final look

Here you can see how the system will look after the customization. Cool, right?

`Images coming soon...`

<a id="how-to-install"></a>

<br>

# 🛠️ How to install?

Simply execute this command:

```
  git clone -b main --single-branch https://github.com/MrE8065/MyDotfiles.git ~/MyDotfiles
```

> [!NOTE]
> This repo has two dotfiles: the one I currently use and the old one. With the command above, you only download the main branch.

> [!IMPORTANT]
> Once the installation is done, take a look to the [after installation](#after-installation) recommendations.

<br>

<a id="keybinds"></a>

# ⌨️ Keybinds

`Mod+Q` - Close app

`Mod+D` - Open App Launcher

`Mod+B` - Open browser

`Mod+E` - Open file manager

`Mod+Period` - Open emoji menu

`Print` - Take screenshot

`Mod+F` - Maximize app

`Mod+Shift+F` - Fullscreen app

`Mod+V` - Toggle floating window

`Mod+L` - Activate lockscreen

`Mod+Shift+Ctrl+R` - Reload waybar

> [!Tip]
> This are just the most used keybinds.
>
> More can be found and changed in `~/.config/niri/binds.kdl`

<br>

<a id="packages"></a>

# 📦 Packages

This are all the packages that I like to be installed:

```
niri
xdg-desktop-portal-gtk
xdg-desktop-portal-gnome
xwayland-satellite
alacritty
swaylock
swaybg
vicinae
wlogout
mako
waybar
sunsetr
zsh
starship
ripgrep
lsd
fastfetch
neovim
tree-sitter-cli
networkmanager
nautilus
tumbler
gvfs
ffmpegthumbnailer
pavucontrol
qview
mpv
nwg-look
kanagawa-gtk-theme
bibata-cursor-theme-bin
ttf-meslo-nerd
noto-fonts
noto-fonts-cjk
noto-fonts-emoji
noto-fonts-extra
bluez
tlp
brightnessctl
```

<br>

<a id="after-installation"></a>

# 💽 After installation

After the installation is completed, you should edit some config files to adjust:

- The resolution of the screen (`~/.config/niri/output.kdl`)
- The bar thickness (`~/.config/waybar/style.css`)
- The buttons of the power menu (`~/.config/wlogout/style.css`)

> [!TIP]
> The css files have comments to help changing important values
