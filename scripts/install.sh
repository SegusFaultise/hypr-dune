#!/bin/bash
# ------------------------------------------------------------------
# Segus Faultise
# hyprland config install script
# ------------------------------------------------------------------

set -e

# ------------------------------------------------------------------
# PACKAGE LIST
# ------------------------------------------------------------------
PACKAGES=(
  git
  jq
  socat
  ttf-jetbrains-mono-nerd
  base-devel
  glib2
  gtk3
  pango
  cairo
  gdk-pixbuf2
)

# ------------------------------------------------------------------
# SCRIPT START
# ------------------------------------------------------------------
# ------------------------------------------------------------------
# SYSTEM UPDATE
# ------------------------------------------------------------------
echo "Performing a full system update..."
sudo pacman -Syu --noconfirm

# ------------------------------------------------------------------
# BASH FILE PERMISIONS
# ------------------------------------------------------------------
chmod +x ~/.config/hypr/scripts/get_workspaces.sh

# ------------------------------------------------------------------
# INSTALL YAY (AUR Helper)
# ------------------------------------------------------------------
if ! command -v yay &>/dev/null; then
  echo "yay not found. Installing..."
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  (cd /tmp/yay && makepkg -si --noconfirm)
  rm -rf /tmp/yay
else
  echo "yay is already installed."
fi

# ------------------------------------------------------------------
# INSTALL PACKAGES
# ------------------------------------------------------------------
echo "Installing required packages with yay..."
yay -S --needed --noconfirm "${PACKAGES[@]}"

# ------------------------------------------------------------------
# INSTALL RUSTUP (Non-interactive)
# ------------------------------------------------------------------
if ! command -v rustup &>/dev/null; then
  echo "Installing rustup..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source "$HOME/.cargo/env"
else
  echo "rustup is already installed."
fi

# ------------------------------------------------------------------
# BUILD AND INSTALL EWW
# ------------------------------------------------------------------
echo "Building and installing Eww for Wayland..."

TMP_DIR=$(mktemp -d)
echo "Using temporary directory: $TMP_DIR"

git clone https://github.com/elkowar/eww "$TMP_DIR/eww"
cd "$TMP_DIR/eww"

cargo build --release --no-default-features --features="wayland"

mkdir -p ~/.local/bin
cp "target/release/eww" ~/.local/bin/

rm -rf "$TMP_DIR"
cd ~

# ------------------------------------------------------------------
# INSTALL swww
# ------------------------------------------------------------------
yay -S swww

# ------------------------------------------------------------------
# INSTALL rofi
# ------------------------------------------------------------------
yay -S rofi

# ------------------------------------------------------------------
# INSTALL alacritty
# ------------------------------------------------------------------
yay -S alacritty
