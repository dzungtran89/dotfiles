" Git

if PlugLoaded('vim-fugitive')
  noremap <leader>ga :Git<space>
  " noremap <leader>go :.GBrowse<CR>
  " noremap <leader>gw :GBrowse<CR>
  " noremap <leader>gb :Git blame<CR>

  "" Open current line on GitHub
  " let g:fugitive_gitlab_domains = ['https://gitlab.trobz.com']
endif
