
" Key mappings definition
"

if has_key(plugs, 'editorconfig-vim')

  " note that if you are using Plug mapping you should not use `noremap` mappings.
  nmap <F5> <Plug>(lcn-menu)
  " Or map each action separately
  nmap <silent>K <Plug>(lcn-hover)
  nmap <silent>gd <Plug>(lcn-definition)
  nmap <leader>rn <Plug>(lcn-rename)

endif

