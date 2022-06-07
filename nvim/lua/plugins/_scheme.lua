local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local o = vim.o

-- Default
o.background = "dark"
cmd[[colorscheme iceberg]]

if fn.PlugLoaded('nord-vim') == 1 then
  g.nord_bold_vertical_split_line = 1
  g.nord_uniform_diff_background = 1
  g.nord_uniform_status_lines = 1
  g.nord_style = 'hard'

  cmd[[colorscheme nord]]
end

if fn.PlugLoaded('gruvbox-material') == 1 then
  g.gruvbox_material_background = 'hard'
  g.gruvbox_material_foreground = 'mix'
  g.gruvbox_material_better_performance = 1
end
