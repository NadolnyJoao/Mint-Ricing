-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- YouTube: moved from the default SUPER + SHIFT + Y to SUPER + Y.
hl.unbind("SUPER + SHIFT + Y")
o.bind("SUPER + Y", "YouTube", { webapp = "https://youtube.com/" })

-- Gmail on SUPER + G. This takes over the default "Toggle window grouping",
-- which now moves to SUPER + SHIFT + G (previously Signal, moved to
-- SUPER + CTRL + G).
hl.unbind("SUPER + G")
hl.unbind("SUPER + SHIFT + G")
o.bind("SUPER + G", "Gmail", { webapp = "https://mail.google.com/", focus = true })
o.bind("SUPER + CTRL + G", "Signal", { omarchy = "signal" })
o.bind("SUPER + SHIFT + G", "Toggle window grouping", hl.dsp.group.toggle())

--Abrir o dolphin com SUPER E
hl.unbind("SUPER + SHIFT + F")
hl.unbind("SUPER + E")
o.bind("SUPER + E", "Thunar", "thunar")

-- Agenda do google
hl.unbind("SUPER + A")
o.bind("SUPER + A", "Agenda", { webapp = "https://calendar.google.com", focus = true })

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")
