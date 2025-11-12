local wezterm = require 'wezterm'
local config = {}

-- 🎨 Tema oscuro elegante
config.color_scheme = 'Catppuccin Mocha' -- Alternativas: 'Dracula', 'Gruvbox Dark (Gogh)'

-- 🔠 Tipografía moderna
config.font = wezterm.font_with_fallback({
  'JetBrainsMono Nerd Font',
  'FiraCode Nerd Font',
})
config.font_size = 12.5

-- 🪟 Ventana: estilo KDE acrílico (recta)
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true
config.enable_wayland = true

-- 💎 Transparencia tipo acrílico
config.window_background_opacity = 0.85
config.text_background_opacity = 0.85

-- 🧱 Márgenes rectos
config.window_padding = {
  left = 10,
  right = 10,
  top = 8,
  bottom = 6,
}

-- 📏 Tamaño inicial de ventana
config.initial_rows = 33
config.initial_cols = 122

-- 🧠 Comportamiento general
config.scrollback_lines = 7000
config.audible_bell = "Disabled"
config.cursor_blink_rate = 750
config.animation_fps = 60
config.max_fps = 60
config.adjust_window_size_when_changing_font_size = false

-- 🐚 Shell Zsh por defecto
config.default_prog = { '/usr/bin/zsh', '-l' }

-- ⚡️ Atajos personalizados
config.keys = {
  -- pestañas
  { key = 't', mods = 'CTRL|SHIFT', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
  { key = 'w', mods = 'CTRL|SHIFT', action = wezterm.action.CloseCurrentTab { confirm = true } },
  { key = 'PageUp', mods = 'CTRL', action = wezterm.action.ActivateTabRelative(-1) },
  { key = 'PageDown', mods = 'CTRL', action = wezterm.action.ActivateTabRelative(1) },

  -- paneles
  { key = '%', mods = 'CTRL|SHIFT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = '"', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'h', mods = 'CTRL|ALT', action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'l', mods = 'CTRL|ALT', action = wezterm.action.ActivatePaneDirection 'Right' },
  { key = 'k', mods = 'CTRL|ALT', action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = 'j', mods = 'CTRL|ALT', action = wezterm.action.ActivatePaneDirection 'Down' },
  -- 🔹 Cerrar panel actual
  { key = 'x', mods = 'CTRL|SHIFT', action = wezterm.action.CloseCurrentPane { confirm = true } },

  -- pantalla completa
  { key = 'Enter', mods = 'SUPER', action = wezterm.action.ToggleFullScreen },

  -- búsqueda
  { key = 'f', mods = 'CTRL|SHIFT', action = wezterm.action.Search { CaseSensitiveString = '' } },
}

-- 📸 Fondo opcional (imagen o textura)
-- config.window_background_image = "/usr/share/wallpapers/Next/contents/images/1920x1080.png"
-- config.window_background_image_hsb = {
--   brightness = 0.15,
--   hue = 1.0,
--   saturation = 1.0,
-- }

return config
