if vim.fn.PlugLoaded('vimwiki') ~=1 then
  return
end

vim.g.vimwiki_list = {
  {
    path = '~/code/github/og-abc',
    syntax = 'markdown',
    ext = '.md',
  }
}

vim.g.vimwiki_folding = 'expr'

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', "<leader>wf", ":exe 'Files ' . expand(g:vimwiki_list[0].path)<CR>", opts)
