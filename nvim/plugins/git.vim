" Git

if has_key(plugs, 'vim-fugitive')

  noremap <leader>go :.GBrowse<CR>
  noremap <leader>gw :GBrowse<CR>
  noremap <leader>gb :Git blame<CR>
  noremap <leader>gq :gq<CR>
  noremap <leader>gc :GFiles<CR>
  noremap <leader>gl :Commits<CR>
  noremap <leader>gg :Git<space>
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

  " let g:gitgutter_sign_removed          = '🔥'
  " let g:gitgutter_sign_modified_removed = '🤔'
  " let g:gitgutter_sign_added            = '🐣'
  " let g:gitgutter_sign_modified         = '🐍'

  set signcolumn=yes
endif
