#!/usr/bin/env bash
set -euo pipefail

echo "======================================"
echo "  Restaurar backup do OpenCode"
echo "======================================"

if [ $# -lt 1 ]; then
  echo "Uso: $0 arquivo.zip ou arquivo.zip.gpg"
  exit 1
fi

FILE="$1"

if [[ "$FILE" == *.gpg ]]; then
  echo "[INFO] Descriptografando..."
  gpg -d "$FILE" > /tmp/opencode-restore.zip
  ZIP="/tmp/opencode-restore.zip"
else
  ZIP="$FILE"
fi

echo "[INFO] Restaurando para ~/"
unzip -o "$ZIP" -d ~/
chmod +x ~/.local/bin/opencode 2>/dev/null || true

[ -n "${ZIP:-}" ] && [[ "$ZIP" == /tmp/* ]] && rm "$ZIP"

echo "[OK] Restaurado! Abra o OpenCode e seus chats devem aparecer."
