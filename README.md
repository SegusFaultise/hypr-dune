<div align="center">

  # Hyprland Tokyo Night


  
  [![Hyprland](https://img.shields.io/badge/Hyprland-2d4d54?style=for-the-badge&logo=hyprland&logoColor=F8F8F2)](https://hyprland.org)
  [![Arch Linux](https://img.shields.io/badge/Arch%20Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=F8F8F2)](https://archlinux.org)
  [![Eww](https://img.shields.io/badge/Eww-F14041?style=for-the-badge&logo=eww&logoColor=F8F8F2)](https://github.com/elkowar/eww)
  [![Alacritty](https://img.shields.io/badge/Alacritty-F8F8F2?style=for-the-badge&logo=alacritty&logoColor=212328)](https://alacritty.org)
  [![Tokyo Night](https://img.shields.io/badge/Tokyo%20Night-2d2d3e?style=for-the-badge&logo=neovim&logoColor=F8F8F2)](https://github.com/folke/tokyonight.nvim)
  [![Git](https://img.shields.io/badge/Git-blue?style=for-the-badge&logo=git&logoColor=F8F8F2)](https://git-scm.com)

</div>

***

### Screenshots

_Add a screenshot here to show off your setup!_
<div align="center">
    <img src="" alt="Hyprland Setup" width="800"/>
</div>

***

### Features

* **Window Manager:** Hyprland
* **Status Bar:** Eww (Elkowar's Wayland Widgets)
* **Terminal:** Alacritty
* **Launcher:** Rofi
* **Wallpaper:** Swww
* **Lock Screen:** wlogout
* **Screenshots:** Grimblast

### Dependencies

The provided `install.sh` script will automatically install these packages for you using `yay`, a helper for the Arch User Repository (AUR).

* `git`
* `gitui`
* `github-desktop`
* `lazydocker`
* `htop`
* `jq`
* `socat`
* `ttf-jetbrains-mono-nerd`
* `base-devel`
* `glib2`
* `gtk3`
* `pango`
* `cairo`
* `gdk-pixbuf2`
* `eww` (built from source)
* `swww`
* `rofi`
* `alacritty`
* `hyprpicker`
* `hypridle`
* `wlogout`
* `grimblast`

### Installation

1.  **Clone the repository:**

    ```bash
    git clone [https://github.com/SegusFaultise/nvim](https://github.com/SegusFaultise/nvim) ~/.config/hypr
    ```

2.  **Run the installation script:**

    This script will perform a full system update, install all the required packages, and build `Eww` from source.

    ```bash
    cd ~/.config/hypr/scripts
    ./install.sh
    ```

### File Structure

```bash
.
├── alacritty
│   └── alacritty.toml
├── eww
│   ├── eww.scss
│   ├── eww.yuck
│   └── scripts
│       ├── battery.sh
│       ├── cpu.sh
│       ├── docker.sh
│       ├── get_git_projects.py
│       ├── get_workspaces.py
│       ├── git.sh
│       ├── network_speed.sh
│       ├── packages.sh
│       ├── ram.sh
│       ├── volume.sh
│       ├── wifi.sh
│       └── workspaces_map.json
├── hyprland.conf
├── rofi
│   ├── config.rasi
│   └── themes
│       └── tokyo_night.rasi
├── scripts
│   ├── get_workspaces.sh
│   ├── install.sh
│   ├── launch_eww.sh
│   └── wallpaper.sh
└── wallpapers
└── arch_00_3840x2160.png
```
