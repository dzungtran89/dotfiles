if PlugLoaded('vim-easy-align')

  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)

elseif PlugLoaded("tabular")

  " nmap <localleader>a: :Tabularize /:\zs<CR>
  " vmap <localleader>a: :Tabularize /:\zs<CR>

  " Auto align as pressing |
  inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

  function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
      let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
      let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
      Tabularize/|/l1
      normal! 0
      call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
  endfunction

  vmap <localleader>a :Tabularize /
  nmap <localleader>a :Tabularize /

endif

if PlugLoaded('vim-markdown')

  let g:vim_markdown_folding_disabled = 1
  let g:vim_markdown_no_default_key_mappings = 1

  let g:vim_markdown_conceal = 0
  let g:vim_markdown_conceal_code_blocks = 0

  " let g:vim_markdown_override_foldtext       = 0
  " let g:vim_markdown_emphasis_multiline      = 0
  " let g:vim_markdown_frontmatter             = 1

endif
