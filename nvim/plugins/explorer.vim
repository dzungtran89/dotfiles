" File explorer

if has_key(plugs, 'nnn.vim')

  let g:nnn#replace_netrw = 1

  " use the same n³ session within a vim session
  let g:nnn#session = 'local'

  " OR, to pass env variables
  let g:nnn#command = 'NNN_COLORS="" nnn'

  " Disable default mappings
  let g:nnn#set_default_mappings = 0

  " Opens the nnn window in a split
  let g:nnn#layout = 'new' " or vnew, tabnew etc.

  " Or pass a dictionary with window size
  " let g:nnn#layout = { 'left': '~20%' } " or right, up, down

  let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

  nnoremap <leader>n :NnnPicker %:p:h<CR>

  let g:nnn#action = {
        \ '<c-t>': 'tab split',
        \ '<c-x>': 'split',
        \ '<c-v>': 'vsplit' }

elseif has_key(plugs, 'lf.vim')

  let g:lf_map_keys = 0
  let g:lf_replace_netrw = 1

  nnoremap <silent> <leader>n :Lf<CR>
  " nnoremap   <silent>   <leader>n          :FloatermNew lf<CR>
  let g:lf_command_override = 'lf -command "set hidden"'
  " let g:lf_open_new_tab = 1

elseif has_key(plugs, 'ranger.vim')

  let g:ranger_map_keys = 0
  " open ranger when vim open a directory
  let g:ranger_replace_netrw = 1

elseif has_key(plugs, 'vim-molder')
  let g:molder_show_hidden = 1
endif

" fzf / telescope

