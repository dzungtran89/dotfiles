if PlugLoaded('nvim-tree.lua')
  let g:nvim_tree_disable_netrw = 0                                       " 1 by default, disables netrw
  let g:nvim_tree_side = 'right'                                          " left by default
  let g:nvim_tree_width = 60                                              " 30 by default
  let g:nvim_tree_highlight_opened_files = 1
  let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]           " empty by default
  let g:nvim_tree_gitignore = 1                                           " 0 by default
  let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ]            " empty by default, don't auto open tree on specific filetypes.
  let g:nvim_tree_special_files = [ 'README.md', 'Makefile', 'MAKEFILE' ] " List of filenames that gets highlighted with NvimTreeSpecialFile

  nnoremap <leader>tt :NvimTreeToggle<CR>
  nnoremap <leader>tr :NvimTreeRefresh<CR>
  nnoremap <leader>tf :NvimTreeFindFile<CR>
endif
