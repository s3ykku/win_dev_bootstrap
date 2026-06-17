local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local mux = wezterm.mux

-- BASE SETTINGS

config.front_end = 'WebGpu'
config.color_scheme = 'kanagawabones'
config.default_prog = { 'C:\\Users\\Roman\\AppData\\Local\\Programs\\nu\\bin\\nu.exe', '' }
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- FONT

config.default_cursor_style = 'SteadyUnderline'

config.font = wezterm.font {
  family = 'Lilex Nerd Font',
  weight = 'Medium',
  harfbuzz_features = { 'calt', 'liga' },
}

config.font_size = 12

-- KEYS

config.keys = {
  {
    key = 's',
    mods = 'CTRL|ALT',
    action = wezterm.action.SplitHorizontal,
  },
  {
    key = 'v',
    mods = 'CTRL|ALT',
    action = wezterm.action.SplitVertical,
  },
  {
    key = 'x',
    mods = 'CTRL|ALT',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'LeftArrow',
    mods = 'CTRL|ALT',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'CTRL|ALT',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'CTRL|ALT',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'CTRL|ALT',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key = 'c',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CopyTo 'Clipboard',
  },
  {
    key = 'v',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.PasteFrom 'Clipboard',
  },
}

for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'CTRL|ALT',
    action = wezterm.action.ActivateTab(i - 1),
  })
end

return config
