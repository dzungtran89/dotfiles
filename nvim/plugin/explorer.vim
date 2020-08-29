if has_key(plugs, 'nnn.vim')

  let $NNN_TRASH=1

  " Disable default mappings
  let g:nnn#set_default_mappings = 0

  " Opens the nnn window in a split
  let g:nnn#layout = 'new' " or vnew, tabnew etc.

  " Or pass a dictionary with window size
  let g:nnn#layout = { 'left': '~20%' } " or right, up, down

  " Floating window (neovim latest and vim with patch 8.2.191)
  let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

  " Or override
  " Start nnn in the current file's directory
  nnoremap <leader>n :NnnPicker '%:p:h'<CR>

  let g:nnn#action = {
        \ '<c-t>': 'tab split',
        \ '<c-x>': 'split',
        \ '<c-v>': 'vsplit' }

endif

if has_key(plugs, 'ranger.vim')

  let g:ranger_map_keys = 0
  " open ranger when vim open a directory
  let g:ranger_replace_netrw = 1

endif
