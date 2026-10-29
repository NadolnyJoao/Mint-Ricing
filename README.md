# Mint-Ricing - Linux Mint XFCE + Sway

Guia completo para migrar meu ambiente do Omarchy (Arch) para Linux Mint XFCE + Sway, mantendo o máximo possível das configurações, keybinds e fluxos.

## Índice

- [Objetivo](#objetivo)
- [1) Preparação](#1-preparação)
- [2) Instalar dependências](#2-instalar-dependências)
- [3) Clonar este repositório](#3-clonar-este-repositório)
- [4) Aplicar configurações](#4-aplicar-configurações)
- [5) Configurar teclado (Right Ctrl -> / ?)](#5-configurar-teclado-right-ctrl---)
- [6] Gerar chave SSH para GitHub](#6-gerar-chave-ssh-para-github)
- [7) Configurar Sway](#7-configurar-sway)
- [8) Restaurar OpenCode](#8-restaurar-opencode)
- [9) Migrar keybinds do Hyprland para Sway](#9-migrar-keybinds-do-hyprland-para-sway)
- [10) Dicas e Troubleshooting](#10-dicas-e-troubleshooting)

## Objetivo

Restaurar meu ambiente no **Linux Mint 22.x XFCE** com **Sway** (Wayland compositor) o mais próximo possível do Omarchy.

## 1) Preparação

### 1.1 Instalar Linux Mint XFCE
Instale normalmente o Linux Mint XFCE na sua máquina. Crie seu usuário com o mesmo nome pra facilitar: `nadolny`

### 1.2 Atualizar sistema
```bash
sudo apt update && sudo apt upgrade -y
```

### 1.3 Instalar Git
```bash
sudo apt install git
```

## 2) Instalar dependências

Clone e rode o script de instalação:

```bash
git clone git@github.com:NadolnyJoao/Mint-Ricing.git ~/Mint-Ricing
cd ~/Mint-Ricing
chmod +x scripts/*.sh
./scripts/install-packages.sh
```

**O que esse script instala:**
- Sway, Waybar, Rofi, Foot/Kitty
- wl-clipboard, grim, slurp, swappy
- brightnessctl, pamixer, pavucontrol
- Thunar, lxappearance, qt5ct
- Fonts (JetBrains Mono, Font Awesome, Noto)
- Ferramentas CLI (ripgrep, fd, bat, eza, fzf, zoxide)
- keyd, polkit, xdg-desktop-portal
- Apps básicos

## 3) Clonar este repositório

Se já clonou no passo 2, pule. Senão:

```bash
git clone git@github.com:NadolnyJoao/Mint-Ricing.git ~/Mint-Ricing
cd ~/Mint-Ricing
```

## 4) Aplicar configurações

```bash
./scripts/apply-configs.sh
```

Isso copia tudo que está em `config/home/` pro seu home: `.config/`, `.local/bin/`, `.bashrc`, etc.

## 5) Configurar teclado (Right Ctrl -> / ?)

No meu setup, o Right Control deve funcionar como `/` e `?`.

```bash
./scripts/setup-keyboard-remap.sh
```

Teste apertando Right Ctrl - deve sair `/`

## 6) Gerar chave SSH para GitHub

```bash
./scripts/setup-ssh.sh seuemail@exemplo.com
```

Copie a chave pública que aparecer e adicione em: [github.com/settings/ssh/new](https://github.com/settings/ssh/new)

Teste:

```bash
ssh -T git@github.com
```

## 7) Configurar Sway

### 7.1 Criar config base
```bash
mkdir -p ~/.config/sway
cp -r ~/Mint-Ricing/config/sway/* ~/.config/sway/ 2>/dev/null || true
```

### 7.2 Iniciar Sway

**Opção A: Pelo LightDM/Display Manager (recomendado)**
Ao logar, mude a sessão pra `Sway` no seletor.

**Opção B: Pelo TTY**
```bash
# Em tty (Ctrl+Alt+F2)
exec sway
```

### 7.3 Configurações importantes pro Sway

Edite `~/.config/sway/config` conforme necessário. Os arquivos em `config/hyprland-ref/` servem como referência pra migrar keybinds.

## 8) Restaurar OpenCode

Se você tem o backup do OpenCode:

```bash
# Normal
./scripts/restore-opencode.sh ~/Downloads/opencode-backup-*.zip

# Criptografado
./scripts/restore-opencode.sh ~/Downloads/opencode-backup-*.zip.gpg
```

## 9) Migrar keybinds do Hyprland para Sway

O Hyprland usa `bind = $mod, ...` diferente do Sway (`bindsym $mod+...`). 

**Principais diferenças:**
| Hyprland | Sway |
|---|---|
| `bind = SUPER, Return, exec, kitty` | `bindsym $mod+Return exec kitty` |
| `bindm = SUPER, mouse:272, movewindow` | `floating_modifier $mod normal` |
| `exec-once` | `exec` no config (roda uma vez) |
| `workspace` | `workspace` igual |
| `movefocus` | `focus` com `left/right/up/down` |

Use os arquivos em `config/hyprland-ref/` pra mapear tudo. Já tem seu `hyprland.conf`, `bindings.lua`, etc. Copie o que for essencial pro `~/.config/sway/config`.

**Dica:** Comece pelo essencial (terminal, launcher, fechar janela, trocar workspace).

## 10) Dicas e Troubleshooting

### 10.1 Polkit não aparece
```bash
/usr/libexec/polkit-gnome-authentication-agent-1 &
# ou
/usr/bin/gnome-keyring-daemon --start --components=secrets
```

### 10.2 Wallpaper
```bash
swaybg -i /caminho/da/imagem.jpg -m fill &
```

### 10.3 Screenshots
```bash
grim -g "$(slurp)" ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png
```

### 10.4 Clipboard
```# PR Title
Mint-Ricing - Linux Mint XFCE + Sway

Guia completo para migrar meu ambiente do Omarchy (Arch) para Linux Mint XFCE + Sway, mantendo o máximo possível das configurações, keybinds e fluxos.

## Índice

- [Objetivo](#objetivo)
- [1) Preparação](#1-preparação)
- [2) Instalar dependências](#2-instalar-dependências)
- [3) Clonar este repositório](#3-clonar-este-repositório)
- [4) Aplicar configurações](#4-aplicar-configurações)
- [5) Configurar teclado (Right Ctrl -> / ?)](#5-configurar-teclado-right-ctrl---)
- [6) Gerar chave SSH para GitHub](#6-gerar-chave-ssh-para-github)
- [7) Configurar Sway](#7-configurar-sway)
- [8) Restaurar OpenCode](#8-restaurar-opencode)
- [9) Migrar keybinds do Hyprland para Sway](#9-migrar-keybinds-do-hyprland-para-sway)
- [10) Dicas e Troubleshooting](#10-dicas-e-troubleshooting)

## Objetivo

Restaurar meu ambiente no **Linux Mint 22.x XFCE** com **Sway** (Wayland compositor) o mais próximo possível do Omarchy.

## 1) Preparação

### 1.1 Instalar Linux Mint XFCE
Instale normalmenteo omarchy) pra tema. Use config/hyprland-ref como espelho.
