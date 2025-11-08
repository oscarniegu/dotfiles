-- Guía WezTerm: Configuración de Ejemplo (Versión 4.1, Revisión Experta Final)
-- Por: Un Ingeniero de DevOps
-- Misión: Crear una terminal robusta, eficiente y a prueba de futuro.

local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local utils = {}

function utils.is_remote()
  local pane = wezterm.mux.get_active_pane()
  if not pane then
    return false
  end
  return pane:get_domain_info().domain_type == 'Ssh'
end

-- ESTÉTICA Y APARIENCIA
config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font_with_fallback { 'JetBrainsMono Nerd Font', 'monospace' }
config.font_size = 13.0
config.harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }
config.window_padding = { left = 15, right = 15, top = 15, bottom = 7 }
config.window_background_opacity = 0.95
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false

-- ATAJOS
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  { key = '-',   mods = 'LEADER',     action = wezterm.action.SplitPane { direction = 'Down', command = { domain = 'CurrentPaneDomain' } } },
  { key = 'º',   mods = 'LEADER',     action = wezterm.action.SplitPane { direction = 'Right', command = { domain = 'CurrentPaneDomain' } } },
  { key = 'h',   mods = 'ALT',        action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'l',   mods = 'ALT',        action = wezterm.action.ActivatePaneDirection 'Right' },
  { key = 'k',   mods = 'ALT',        action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = 'j',   mods = 'ALT',        action = wezterm.action.ActivatePaneDirection 'Down' },
  { key = 'Tab', mods = 'CTRL',       action = wezterm.action.ActivateTabRelative(1) },
  { key = 'Tab', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTabRelative(-1) },
  { key = 'x',   mods = 'LEADER',     action = wezterm.action.CloseCurrentPane { confirm = true } },
  { key = 'c',   mods = 'LEADER',     action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
  { key = '[',   mods = 'LEADER',     action = wezterm.action.ActivateCopyMode },
  { key = 'z',   mods = 'LEADER',     action = wezterm.action.TogglePaneZoomState },
}

-- EVENTOS
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local pane = tab.active_pane
  local title = pane.title
  local prefix = utils.is_remote() and '  ' or ''

  if title:find('nvim') then
    title = '  ' .. title
  elseif title:find('lazygit') then
    title = '  ' .. title
  end
  return { { Text = prefix .. title } }
end)

wezterm.on('update-status', function(window, pane)
  local status = ''
  if pane:is_zoomed() then status = 'ZOOM' end
  local color = utils.is_remote() and '#F9E2AF' or '#C9CBFF'
  window:set_right_status(wezterm.format { { Foreground = { Color = color } }, { Text = status } })
end)

wezterm.on('open-uri', function(window, pane, uri)
  wezterm.open_with(uri)
  return false
end)

-- CONFIGURACIÓN AVANZADA
config.ssh_domains = {
  {
    name = 'servidor-produccion',
    remote_address = 'usuario@ip.del.servidor',
  },
}
config.scrollback_lines = 10000
config.warn_about_missing_glyphs = false

-- Mouse bindings:
-- Orden importante: primero MODS específicas (CTRL, SHIFT), luego NONE.
config.mouse_bindings = {
  -- CTRL + WheelUp  -> aumentar tamaño de fuente
  {
    event = { Down = { streak = 1, button = { WheelUp = 1 } } },
    mods = "CTRL",
    action = wezterm.action.IncreaseFontSize,
  },
  -- CTRL + WheelDown -> reducir tamaño de fuente
  {
    event = { Down = { streak = 1, button = { WheelDown = 1 } } },
    mods = "CTRL",
    action = wezterm.action.DecreaseFontSize,
  },

  -- Shift + WheelUp -> mover 1 línea hacia arriba (scroll fino)
  {
    event = { Down = { streak = 1, button = { WheelUp = 1 } } },
    mods = "SHIFT",
    action = wezterm.action.ScrollByLine(-1),
  },
  -- Shift + WheelDown -> mover 1 línea hacia abajo (scroll fino)
  {
    event = { Down = { streak = 1, button = { WheelDown = 1 } } },
    mods = "SHIFT",
    action = wezterm.action.ScrollByLine(1),
  },

  -- Rueda normal: una PÁGINA por tick (comportamiento por defecto)
  {
    event = { Down = { streak = 1, button = { WheelUp = 1 } } },
    mods = "NONE",
    action = wezterm.action.ScrollByPage(-1),
  },
  {
    event = { Down = { streak = 1, button = { WheelDown = 1 } } },
    mods = "NONE",
    action = wezterm.action.ScrollByPage(1),
  },
}

-- (Opcional) si quieres un atajo para resetear el tamaño con Ctrl+0, puedes descomentar:
-- table.insert(config.keys, { key = '0', mods = 'CTRL', action = wezterm.action.ResetFontSize })

return config
