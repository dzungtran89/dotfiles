if PlugLoaded('wiki.vim') || PlugLoaded('vim-roam')

  let g:wiki_root = $HOME . '/code/github/og-abc'
  let g:wiki_filetypes = ['md', 'markdown']
  let g:wiki_link_target_type = 'md'
  let g:wiki_link_extension = '.md'

  autocmd VimEnter * unmap! [[
endif
