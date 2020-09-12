" Git

if has_key(plugs, 'vim-fugitive')

  noremap <localleader>go :.Gbrowse<CR>
  noremap <localleader>gw :Gbrowse<CR>
  noremap <localleader>gb :Gblame<CR>
  noremap <localleader>gq :gq<CR>
  " noremap <localleader>ga  :Gwrite<CR>
  " noremap <localleader>gc :Gcommit<CR>
  " noremap <localleader>gP :Gpush<CR>
  " noremap <localleader>gp :Gpull<CR>
  " noremap <localleader>gs :Gstatus<CR>
  " noremap <localleader>gd  :Gvdiff<CR>
  " noremap <localleader>gr  :Gremove<CR>

  " Git
  let g:fugitive_gitlab_domains = ['https://gitlab.trobz.com']

endif

