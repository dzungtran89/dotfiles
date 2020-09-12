
if has_key(plugs, 'vimwiki')

  " let g:vimwiki_conceal_onechar_markers = 0
  let g:vimwiki_conceallevel = 3
  " let g:vimwiki_conceal_pre = 1

  let g:vimwiki_key_mappings =
    \ {
    \   'global': 1,
    \   'headers': 1,
    \   'text_objs': 1,
    \   'table_format': 1,
    \   'table_mappings': 1,
    \   'lists': 1,
    \   'links': 0,
    \   'html': 1,
    \   'mouse': 0,
    \ }

  " let g:vimwiki_listsyms = '✗○◐●✓'
  let g:vimwiki_map_prefix = '<leader>o'
  let g:vimwiki_list = [{'path': '~/vimwiki/',
        \ 'syntax': 'markdown', 'ext': '.md'}]

endif
