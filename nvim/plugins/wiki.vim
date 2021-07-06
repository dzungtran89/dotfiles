if PlugLoaded('wiki.vim') || PlugLoaded('vim-roam')

  let g:wiki_root = $HOME . '/code/github/abc-og'
  let g:wiki_filetypes = ['md', 'markdown']
  let g:wiki_link_target_type = 'md'
  let g:wiki_link_extension = '.md'

  autocmd VimEnter * unmap! [[

elseif has_key(plugs, 'vimwiki')

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

  let g:vimwiki_map_prefix = '<c-w>w'
  let g:vimwiki_list = [{
        \'path': '~/vimwiki/',
        \'syntax': 'markdown',
        \'ext': '.md'
        \}]

endif

if has_key(plugs, 'vim-notes')
  let g:notes_directories = ['~/vimwiki']
endif

