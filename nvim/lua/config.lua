local g = vim.g
local fn = vim.fn
local map = vim.api.nvim_set_keymap
local unmap = vim.api.nvim_del_keymap

if fn.PlugLoaded("nvim-dap") == 1 then
  require('plugins._dap')
end

if fn.PlugLoaded("hop.nvim") == 1 then
  print(fn.PlugLoaded("hop.nvim"))
  print('Hope is loading')
  require('hop').setup {
    keys = 'etovxqpdygfblzhckisuran',
    term_seq_bias = 0.5
  }
end

if fn.PlugLoaded("telescope.nvim") == 1 then
  require('plugins._telescope')

  -- Candidates
  map('n' , '<leader>ft' , '<cmd>Telescope <cr>'           , {noremap = true})
  map('n' , '<leader>ff' , '<cmd>Telescope find_files<cr>' , {noremap = true})
  map('n' , '<leader>fg' , '<cmd>Telescope live_grep<cr>'  , {noremap = true})
  map('n' , '<leader>fb' , '<cmd>Telescope buffers<cr>'    , {noremap = true})
  map('n' , '<leader>fh' , '<cmd>Telescope help_tags<cr>'  , {noremap = true})

end

if fn.PlugLoaded("nvim-bufferline.lua") == 1 then
  require("bufferline").setup{}
end

if fn.PlugLoaded("nvim-tabline") == 1 then
  require('tabline').setup{
    show_index = true,    -- show tab index
    show_modify = true,   -- show buffer modification indicator
    no_name = '[No name]' -- no name buffer name
  }
end

if fn.PlugLoaded('neorg') == 1 then
  require('plugins._neorg')
end

if fn.PlugLoaded('nvim-treesitter') == 1 then
  require('plugins._treesitter')
end

if fn.PlugLoaded('Navigator.nvim') == 1 then
  require('plugins._tmux')
end

if fn.PlugLoaded('lualine.nvim') == 1 then
  require('plugins._lualine')
  -- require'tabline'.setup {}
end

if fn.PlugLoaded('nvim-lspconfig') == 1 then
  require('plugins._lsp')
end

if fn.PlugLoaded('shade.nvim') == 1 then
  require('plugins._shade')
end


