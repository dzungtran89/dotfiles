require'nvim-tree'.setup {
  disable_netrw       = false,
  git = {
    enable = false,
    ignore = true,
    timeout = 500,
  },
}

vim.cmd([[nnoremap <leader>t; :NvimTreeToggle<cr>]])
vim.cmd([[nnoremap <leader>tr :NvimTreeRefresh<cr>]])
vim.cmd([[nnoremap <leader>tf :NvimTreeFindFile<cr>]])
