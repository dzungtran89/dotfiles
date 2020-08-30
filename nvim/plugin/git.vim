" Git

if has_key(plugs, 'vim-fugitive')

  noremap <localleader>go : .Gbrowse<CR>
  noremap <localleader>gw : Gbrowse<CR>
  " noremap <leader>ga  : Gwrite<CR>
  " noremap <leader>gc  : Gcommit<CR>
  " noremap <leader>gsh : Gpush<CR>
  " noremap <leader>gll : Gpull<CR>
  " noremap <leader>gs  : Gstatus<CR>
  " noremap <leader>gb  : Gblame<CR>
  " noremap <leader>gd  : Gvdiff<CR>
  " noremap <leader>gr  : Gremove<CR>

  " Git
  let g:fugitive_gitlab_domains = ['https://gitlab.trobz.com']

endif

