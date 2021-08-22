local wezterm = require 'wezterm';

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  -- Configs for Windows only
  default_prog = {'wsl.exe', '~', '-d', 'Ubuntu-20.04'}
end

if wezterm.target_triple == 'x86_64-apple-darwin' then
  -- Configs for OSX only
  -- font_dirs    = { '$HOME/.dotfiles/.fonts' }
  font_size = 16
end

if wezterm.target_triple == 'x86_65-unknown-linux-gnu' then
  -- Configs for Linux only
  -- font_dirs    = { '$HOME/.dotfiles/.fonts' }
end

return {

  window_background_opacity = 0.9,

  default_prog = default_prog,
  color_scheme = 'iceberg-dark',
  hide_tab_bar_if_only_one_tab = true,

  -- Do not hold on exit by default.
  -- Because the default 'CloseOnCleanExit' can be annoying when exiting with
  -- Ctrl-D and the last command exited with non-zero: the shell will exit
  -- with non-zero and the terminal would hang until the window is closed manually.
  exit_behavior = 'Close',

  -- Pad window to avoid the content to be too close to the border,
  -- so it's easier to see and select.
  window_padding = {
    left = 3, right = 3,
    top = 3, bottom = 3,
  },

  inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.8,
  },

  -- Fonts
  font_size   = font_size,
  line_height = 1.1,
  font        = wezterm.font('Iosevka Fixed', { weight = 'Light' }),
}
