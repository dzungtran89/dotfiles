if has_key(plugs, 'vim-vsnip')

  if has_key(plugs, 'deoplete.nvim')
    let g:deoplete#enable_at_startup = 1
  endif

  " Expand
  imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
  smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

  " Expand or jump
  imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
  smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

  " Jump forward or backward
  imap <expr> <C-n>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
  smap <expr> <C-n>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
  imap <expr> <C-p>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
  smap <expr> <C-p>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

  " Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
  " See https://github.com/hrsh7th/vim-vsnip/pull/50
  nmap        <C-l>   <Plug>(vsnip-select-text)
  xmap        <C-l>   <Plug>(vsnip-select-text)
  smap        <C-l>   <Plug>(vsnip-select-text)
  nmap        <C-j>   <Plug>(vsnip-cut-text)
  xmap        <C-j>   <Plug>(vsnip-cut-text)
  smap        <C-j>   <Plug>(vsnip-cut-text)

" elseif has_key(plugs, 'deoplete.nvim')

"   let g:deoplete#enable_at_startup = 1

  " " deoplete tab-complete
  " inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

  " imap <C-l>     <Plug>(neosnippet_expand_or_jump)
  " smap <C-l>     <Plug>(neosnippet_expand_or_jump)
  " xmap <C-l>     <Plug>(neosnippet_expand_target)

  "function! s:check_back_space() abort "{{{
  "  let col = col('.') - 1
  "  return !col || getline('.')[col - 1]  =~ '\s'
  "endfunction
  ""}}}

  " inoremap <silent><expr> <TAB>
  "       \ pumvisible() ? "\<C-n>" :
  "       \ <SID>check_back_space() ? "\<TAB>" :
  "       \ deoplete#manual_complete()

  "  " SuperTab like snippets behavior.
  "  " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
  "  imap <expr><TAB>
  "   \ pumvisible() ? "\<C-n>" :
  "   \ neosnippet#expandable_or_jumpable() ?
  "   \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  "  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  "        \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  " " For conceal markers.
  " if has('conceal')
  "   set conceallevel=2 concealcursor=niv
  " endif

else

  " coc-snippets {{{

  " Use <C-l> for trigger snippet expand.
  imap <C-l> <Plug>(coc-snippets-expand)

  " Use <C-j> for select text for visual placeholder of snippet.
  vmap <C-j> <Plug>(coc-snippets-select)

  " Use <C-j> for jump to next placeholder, it's default of coc.nvim
  let g:coc_snippet_next = '<c-j>'

  " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
  let g:coc_snippet_prev = '<c-k>'

  " Use <C-j> for both expand and jump (make expand higher priority.)
  imap <C-l> <Plug>(coc-snippets-expand-jump)

  " }}}

endif

