#!/usr/bin/env bash
set -euo pipefail

EMAIL="${1:-$(git config --global user.email 2>/dev/null || echo '')}"

echo "======================================"
echo "  Gerar e configurar chave SSH"
echo "======================================"

[ -z "$EMAIL" ] && read -p "Digite seu email do GitHub: " EMAIL

mkdir -p ~/.ssh && chmod 700 ~/.ssh
KEY="$HOME/.ssh/id_ed25519"

if [ -f "$KEY" ]; then
  echo "[AVISO] Chave já existe: $KEY"
else
  ssh-keygen -t ed25519 -C "$EMAIL" -f "$KEY" -N ""
  chmod 600 "$KEY" && chmod 644 "$KEY.pub"
  echo "[OK] Chave gerada!"
fi

eval "$(ssh-agent -s)" >/dev/null
ssh-add "$KEY" 2>/dev/null || true

echo ""
echo "=== CHAVE PÚBLICA ==="
cat "$KEY.pub"
echo "====================="
echo ""
echo "[AÇÃO] Copie essa chave e adicione em: https://github.com/settings/ssh/new"
echo "[TESTE] Após adicionar: ssh -T git@github.com"
