if PlugLoaded('lf.vim')

  let g:lf_map_keys = 0
  let g:lf_replace_netrw = 1

  nnoremap <silent> <leader>n :Lf<CR>
  let g:lf_command_override = 'lf -command "set hidden"'

endif
