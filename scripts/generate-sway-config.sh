#!/usr/bin/env bash
set -euo pipefail

echo "======================================"
echo "  Gerador de config Sway (limpo)"
echo "======================================"

SWAY_DIR="$HOME/.config/sway"
mkdir -p "$SWAY_DIR"

cat > "$SWAY_DIR/config" << 'SWAYEOF'
# Mint-Ricing Sway config
# Baseado nas keybinds do Omarchy + suas personalizações

### Variables
set $mod Mod4
set $left h
set $down j
set $up k
set $right l
set $term foot
set $menu rofi -show drun

### Output
output * bg #000000 solid_color

### Input
input "type:keyboard" {
    xkb_layout us
    xkb_variant intl
    xkb_options caps:escape
}

input type:touchpad {
    dwt enabled
    tap enabled
    natural_scroll enabled
    middle_emulation enabled
}

### Key bindings - Essentials
bindsym $mod+Return exec $term
bindsym $mod+Shift+Return exec firefox
bindsym $mod+Shift+e exec thunar
bindsym $mod+q kill
bindsym Ctrl+Alt+Delete kill
bindsym $mod+Space exec $menu
bindsym $mod+Shift+Space floating toggle
bindsym $mod+Escape exec swaynag -t warning -m 'Sair do Sway?' -B 'Sair' 'swaymsg exit'

### Window management
bindsym $mod+f fullscreen
bindsym $mod+Shift+f fullscreen
bindsym $mod+Ctrl+f fullscreen global
bindsym $mod+t floating toggle
bindsym $mod+j layout toggle split
bindsym $mod+p pseudo
bindsym $mod+o floating enable, sticky enable

### Focus
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right
bindsym Alt+Tab focus next
bindsym Alt+Shift+Tab focus prev

### Move
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

### Resize
mode "resize" {
    bindsym $left resize shrink width 10px
    bindsym $down resize grow height 10px
    bindsym $up resize shrink height 10px
    bindsym $right resize grow width 10px
    bindsym Left resize shrink width 10px
    bindsym Down resize grow height 10px
    bindsym Up resize shrink height 10px
    bindsym Right resize grow width 10px
    bindsym Return mode "default"
    bindsym Escape mode "default"
}
bindsym $mod+r mode "resize"

### Workspaces
bindsym $mod+1 workspace number 1
bindsym $mod+2 workspace number 2
bindsym $mod+3 workspace number 3
bindsym $mod+4 workspace number 4
bindsym $mod+5 workspace number 5
bindsym $mod+6 workspace number 6
bindsym $mod+7 workspace number 7
bindsym $mod+8 workspace number 8
bindsym $mod+9 workspace number 9
bindsym $mod+0 workspace number 10

bindsym $mod+Shift+1 move container to workspace number 1
bindsym $mod+Shift+2 move container to workspace number 2
bindsym $mod+Shift+3 move container to workspace number 3
bindsym $mod+Shift+4 move container to workspace number 4
bindsym $mod+Shift+5 move container to workspace number 5
bindsym $mod+Shift+6 move container to workspace number 6
bindsym $mod+Shift+7 move container to workspace number 7
bindsym $mod+Shift+8 move container to workspace number 8
bindsym $mod+Shift+9 move container to workspace number 9
bindsym $mod+Shift+0 move container to workspace number 10

bindsym $mod+Tab workspace next
bindsym $mod+Shift+Tab workspace prev
bindsym $mod+Ctrl+Tab workspace back_and_forth

### Scratchpad
bindsym $mod+Shift+minus move scratchpad
bindsym $mod+minus scratchpad show

### Screenshots
bindsym Print exec grim -g "$(slurp)" ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png
bindsym Shift+Print exec grim ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png
bindsym $mod+Print exec grim -g "$(slurp)" - | wl-copy

### Volume
bindsym XF86AudioRaiseVolume exec pamixer -i 5
bindsym XF86AudioLowerVolume exec pamixer -d 5
bindsym XF86AudioMute exec pamixer -t
bindsym XF86AudioMicMute exec pactl set-source-mute @DEFAULT_SOURCE@ toggle

### Brightness
bindsym XF86MonBrightnessUp exec brightnessctl set +5% 2>/dev/null || true
bindsym XF86MonBrightnessDown exec brightnessctl set 5%- 2>/dev/null || true

### Media
bindsym XF86AudioPlay exec playerctl play-pause
bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPrev exec playerctl previous

### Clipboard
bindsym $mod+Ctrl+v exec cliphist list | rofi -dmenu | cliphist decode | wl-copy

### Move/resize with mouse
floating_modifier $mod normal

### Bar
bar {
    position top
    swaybar_command waybar
}

### Autostart
exec --no-startup-id nm-applet
exec --no-startup-id blueman-applet
exec --no-startup-id /usr/libexec/polkit-gnome-authentication-agent-1
exec --no-startup-id wl-paste --type text --watch cliphist store
exec --no-startup-id wl-paste --type image --watch cliphist store
exec mako 2>/dev/null || true

include /etc/sway/config.d/*
SWAYEOF

chmod +x "$SWAY_DIR/config"
echo "[OK] Config Sway gerado em $SWAY_DIR/config"
