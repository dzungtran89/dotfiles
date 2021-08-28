" Git
if PlugLoaded('vim-fugitive')
  noremap <leader>gg :Git<space>
  noremap <leader>go :.GBrowse<CR>
  noremap <leader>gw :GBrowse<CR>
  noremap <leader>gb :Git blame<CR>
  noremap <leader>gq :gq<CR>

  "" Open current line on GitHub
  let g:fugitive_gitlab_domains = ['https://gitlab.trobz.com']
endif
