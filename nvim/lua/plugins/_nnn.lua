local vimp = require("vimp")
local nnoremap = vimp.nnoremap

require('nnn').setup{
  -- replace_netrw = true,
  set_default_mappings = false,
  session = 'local',
  command = 'NNN_COLORS="" nnn',
  layout = {
    window = { width= 0.9, height= 0.6, highlight= 'Debug' }
  }
  --[[ action = {
    '<c-t>' = 'tab split',
    '<c-x>' = 'split',
    '<c-v>' = 'vsplit',
  } ]]
}

nnoremap("<Leader>n", ":NnnPicker %:p:h<CR>")

