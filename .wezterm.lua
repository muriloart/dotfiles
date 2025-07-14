-- COPIAR ARQUIVO PARA C:\Users\*seu-usuario* POIS MESMO USANDO WSL O WEZTERM NECESSITA DE UM MOTOR GRÁFICO, E EU (ART) NÃO USO WSLg, X Servers nem outra ~gambiarra~ ferramenta.
local wezterm = require 'wezterm'

local act = wezterm.action

return {
  font = wezterm.font_with_fallback { 'JetBrainsMono Nerd Font', 'Noto Color Emoji' },
  font_size = 12.0,
  color_scheme = 'One Dark (Gogh)',
  hide_tab_bar_if_only_one_tab = true,

  window_decorations = "RESIZE",
  enable_scroll_bar = false,
  check_for_updates = false,
  audible_bell = "Disabled",
  window_background_opacity = 0.95,
  enable_wayland = false,              -- se você usar no Linux
  warn_about_missing_glyphs = false,

  -- WSL Integration
  default_domain = "WSL:Ubuntu",
  default_prog = { "wsl.exe", "--cd", "~" },

  -- Leader key (prefix para atalhos)
  leader = { key="a", mods="CTRL", timeout_milliseconds=1000 },

  keys = {
    -- Splits
    { key="Enter", mods="LEADER|ALT",   action=act.SplitHorizontal { domain="CurrentPaneDomain" } },
    { key="Enter", mods="LEADER|CTRL|ALT", action=act.SplitVertical   { domain="CurrentPaneDomain" } },

    -- Navegação entre panes com hjkl
    { key="h", mods="LEADER", action=act.ActivatePaneDirection "Left" },
    { key="j", mods="LEADER", action=act.ActivatePaneDirection "Down" },
    { key="k", mods="LEADER", action=act.ActivatePaneDirection "Up" },
    { key="l", mods="LEADER", action=act.ActivatePaneDirection "Right" },

    -- Tabs
    { key="t", mods="LEADER", action=act.SpawnTab "CurrentPaneDomain" },
    { key="w", mods="LEADER", action=act.CloseCurrentTab { confirm=true } },
    { key="L", mods="LEADER", action=act.ActivateTabRelative(1) },
    { key="H", mods="LEADER", action=act.ActivateTabRelative(-1) },

    -- Copy / Paste
    { key="c", mods="LEADER|CTRL", action=act.CopyTo "ClipboardAndPrimarySelection" },
    { key="v", mods="LEADER|CTRL", action=act.PasteFrom "Clipboard" },

    -- Zoom Font
    { key="=", mods="LEADER", action=act.IncreaseFontSize },
    { key="-", mods="LEADER", action=act.DecreaseFontSize },
    { key="0", mods="LEADER", action=act.ResetFontSize },

    -- Quick reload config
    { key="r", mods="LEADER", action=act.ReloadConfiguration },

    -- Clear scrollback
    { key="k", mods="LEADER|SHIFT", action=act.ClearScrollback "ScrollbackAndViewport" },
  },

  -- Título da janela mostra caminho atual
  window_frame = {
    font = wezterm.font { family="JetBrainsMono Nerd Font", weight="Bold", stretch="Normal", style="Normal" },
    font_size = 10.0,
  },

  enable_tab_bar = true,
  tab_bar_at_bottom = false,
}
