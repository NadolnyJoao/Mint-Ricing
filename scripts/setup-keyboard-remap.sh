#!/usr/bin/env bash
set -euo pipefail

echo "======================================"
echo "  Remapeamento: Right Ctrl -> / ?"
echo "======================================"

sudo mkdir -p /etc/keyd

sudo tee /etc/keyd/default.conf > /dev/null << 'CONF'
[ids]
*

[main]
rightcontrol = slash
CONF

sudo systemctl enable --now keyd
systemctl status keyd --no-pager | tail -3
echo "[OK] Feito! Right Control agora funciona como /"
