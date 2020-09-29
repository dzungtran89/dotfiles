" Git

if has_key(plugs, 'vim-fugitive')

  noremap <leader>go :.Gbrowse<CR>
  noremap <leader>gw :Gbrowse<CR>
  noremap <leader>gb :Gblame<CR>
  noremap <leader>gq :gq<CR>
  " noremap <leader>ga :Gwrite<CR>
  " noremap <leader>gc :Gcommit<CR>
  " noremap <leader>gP :Gpush<CR>
  " noremap <leader>gp :Gpull<CR>
  " noremap <leader>gs :Gstatus<CR>
  " noremap <leader>gd :Gvdiff<CR>
  " noremap <leader>gr :Gremove<CR>

  " Git
  let g:fugitive_gitlab_domains = ['https://gitlab.trobz.com']

endif

if has_key(plugs, 'vim-gitgutter')
  set updatetime=250
endif
