local fn = vim.fn

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
  print('Navigator.nvim is loaded!')
  require('plugins._tmux')
end

if fn.PlugLoaded('lualine.nvim') == 1 then
  require('plugins._lualine')
end

if fn.PlugLoaded('nvim-lspconfig') == 1 then
  require('plugins._lsp')
end

