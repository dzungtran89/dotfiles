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
    italic = false,
    strikethrough = false,
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

if fn.PlugLoaded('kanagawa.nvim') == 1 then
  -- -- Beauty the splits
  -- vim.opt.laststatus = 3
  -- vim.opt.fillchars:append({
  --   horiz = '━',
  --   horizup = '┻',
  --   horizdown = '┳',
  --   vert = '┃',
  --   vertleft = '┨',
  --   vertright = '┣',
  --   verthoriz = '╋',
  -- })

  local my_colors = {
    sumiInk1 = "#181820",
    sumiInk1b = "#1F1F28",
  }

  require("kanagawa").setup({
    statementStyle = { bold = false, italic = false },
    keywordStyle = { bold = false, italic = false },
    dimInactive = true,
    globalStatus = false,
    colors = my_colors
  })

end

if fn.PlugLoaded('catppuccin') == 1 then
  vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

  require('catppuccin').setup({
      dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.15,
      },
      integrations = {
        native_lsp = {
          enabled = false,
        },
        coc_nvim = true,
        telescope = false,
        cmp = false
      }
    }
  )

end

if fn.PlugLoaded('gruvbox-material') == 1 then
  g.gruvbox_material_background = 'hard'
  g.gruvbox_material_statusline_style = 'mix'
  g.gruvbox_material_better_performance = true
end

-- Default
cmd[[colorscheme iceberg]]
