#!/usr/bin/env bash
set -euo pipefail

echo "======================================"
echo "  Aplicando configurações"
echo "======================================"

mkdir -p ~/.config ~/.local/bin
rsync -av --exclude='.git' "$(dirname "$0")/../config/home/" ~/
cp -r "$(dirname "$0")/../config/waybar" ~/.config/ 2>/dev/null || true
cp -r "$(dirname "$0")/../config/rofi" ~/.config/ 2>/dev/null || true
cp -r "$(dirname "$0")/../config/foot" ~/.config/ 2>/dev/null || true
cp -r "$(dirname "$0")/../config/kitty" ~/.config/ 2>/dev/null || true
mkdir -p ~/.config/sway
cp -r "$(dirname "$0")/../config/sway/"* ~/.config/sway/ 2>/dev/null || true

chmod +x ~/.local/bin/* 2>/dev/null || true
echo "[OK] Configurações aplicadas!"
