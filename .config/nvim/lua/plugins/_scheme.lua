local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local o = vim.o

-- Default
o.background = "dark"

if fn.PlugLoaded('nord-vim') == 1 then
  g.nord_bold_vertical_split_line = 1
  g.nord_uniform_diff_background = 1
  g.nord_uniform_status_lines = 1
  g.nord_style = 'hard'

  cmd[[colorscheme nord]]
end

if fn.PlugLoaded('gruvbox.nvim') == 1 then
  require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = false,
    italic = true,
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true,
    contrast = "hard", -- can be "hard", "soft" or empty string
    overrides = {},
  })
end

if fn.PlugLoaded('onedark.nvim') == 1 then
  require("onedark").setup({
    style = 'darker'
  })
end

-- Default
cmd[[colorscheme iceberg]]
