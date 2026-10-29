#!/usr/bin/env bash
set -euo pipefail

echo "======================================"
echo "  Mint-Ricing - Instalação de Pacotes"
echo "======================================"

if [ "$EUID" -eq 0 ]; then
  echo "[ERRO] Não rode como root. Use seu usuário normal."
  exit 1
fi

sudo apt update && sudo apt upgrade -y

echo "[INFO] Instalando base Sway + Wayland..."
sudo apt install -y \
  sway waybar rofi wofi fuzzel \
  swaybg swaylock swayidle \
  swaync mako-notifier \
  foot kitty alacritty \
  wl-clipboard cliphist grim slurp swappy \
  brightnessctl pamixer pavucontrol pulseaudio-utils \
  network-manager-gnome blueman \
  lxappearance qt5ct qt6ct \
  thunar thunar-archive-plugin thunar-volman \
  xarchiver zip unzip p7zip-full \
  polkit-1-gnome \
  xdg-desktop-portal xdg-desktop-portal-wlr xdg-desktop-portal-gtk \
  dbus-user-session \
  fonts-font-awesome fonts-jetbrains-mono fonts-noto-core fonts-noto-color-emoji \
  curl wget git neovim vim \
  htop btop fastfetch \
  ripgrep fd-find bat eza zoxide fzf \
  jq sqlite3 tree ncdu \
  openssh-client keyd

echo "[INFO] Instalando extras..."
sudo apt install -y \
  firefox chromium \
  vlc mpv \
  imv

echo "[OK] Pacotes instalados!"
echo "[INFO] Agora rode: ./scripts/setup-keyboard-remap.sh"
