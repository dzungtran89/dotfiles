local wezterm = require 'wezterm';
local launch_menu = {}

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  table.insert(launch_menu, {
      label = "PowerShell",
      args = {"nu.exe"},
    })

  -- Configs for Windows only
  default_prog = {'wsl.exe', '~', '-d', 'Ubuntu-20.04'}
  font_dirs    = {'$HOME/scoop/apps/RobotoMono-NF/current'}
  font         = wezterm.font(
    'RobotoMono NF',
    {weight='Regular'}
    )
  font_size    = 10.5
  hide_tab_bar_if_only_one_tab = false
end

if wezterm.target_triple == 'x86_64-apple-darwin' then
  -- Configs for OSX only
  font_dirs = { '$HOME/Library/Fonts' }
  font      = wezterm.font('RobotoMono Nerd Font', { weight = 'Regular' })
  font_size = 14
  table.insert(launch_menu, {})
  hide_tab_bar_if_only_one_tab = true
end

if wezterm.target_triple == 'x86_65-unknown-linux-gnu' then
  -- Configs for Linux only
  -- font_dirs    = { '$HOME/.dotfiles/.fonts' }
  table.insert(launch_menu, {})
end

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

wezterm.on("update-right-status", function(window, pane)
  -- Each element holds the text for a cell in a "powerline" style << fade
  local cells = {};

  -- Figure out the cwd and host of the current pane.
  -- This will pick up the hostname for the remote host if your
  -- shell is using OSC 7 on the remote host.
  local cwd_uri = pane:get_current_working_dir()
  if cwd_uri then
    cwd_uri = cwd_uri:sub(8);
    local slash = cwd_uri:find("/")
    local cwd = ""
    local hostname = ""
    if slash then
      hostname = cwd_uri:sub(1, slash-1)
      -- Remove the domain name portion of the hostname
      local dot = hostname:find("[.]")
      if dot then
        hostname = hostname:sub(1, dot-1)
      end
      -- and extract the cwd from the uri
      cwd = cwd_uri:sub(slash)

      table.insert(cells, cwd);
      table.insert(cells, hostname);
    end
  end

  -- I like my date/time in this style: "Wed Mar 3 08:14"
  local date = wezterm.strftime("%a %b %-d");
  table.insert(cells, date);

  -- -- An entry for each battery (typically 0 or 1 battery)
  -- for _, b in ipairs(wezterm.battery_info()) do
  --   table.insert(cells, string.format("%.0f%%", b.state_of_charge * 100))
  -- end

  -- Color palette for the backgrounds of each cell
  local colors = {
    "#3c1361",
    "#52307c",
    "#663a82",
    "#7c5295",
    "#b491c8",
  };

  -- Foreground color for the text across the fade
  local text_fg = "#c0c0c0";

  -- The elements to be formatted
  local elements = {};
  -- How many cells have been formatted
  local num_cells = 0;

  -- Translate a cell into elements
  function push(text, is_last)
    local cell_no = num_cells + 1
    table.insert(elements, {Foreground={Color=text_fg}})
    table.insert(elements, {Background={Color=colors[cell_no]}})
    table.insert(elements, {Text=" "..text.." "})
    if not is_last then
      table.insert(elements, {Foreground={Color=colors[cell_no+1]}})
      table.insert(elements, {Text=SOLID_LEFT_ARROW})
    end
    num_cells = num_cells + 1
  end

  while #cells > 0 do
    local cell = table.remove(cells, 1)
    push(cell, #cells == 0)
  end

  window:set_right_status(wezterm.format(elements));
end);

return {

  launch_menu = launch_menu,
  default_prog = default_prog,

  -- Hide title bar, but allow to resize border
  window_decorations           = "RESIZE",
  window_background_opacity    = 0.9,
  -- hide_tab_bar_if_only_one_tab = hide_tab_bar_if_only_one_tab,

  color_scheme = 'iceberg-dark',

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
  font = font,

  -- Disable font ligatures
  harfbuzz_features =  {"calt=0", "clig=0", "liga=0"},

  -- MISC
  scrollback_lines = 3500,
}
