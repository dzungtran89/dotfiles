" File explorer

if has_key(plugs, 'nnn.vim')

  " let g:nnn#replace_netrw = 1

  let $NNN_TRASH=1

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

if has_key(plugs, 'telescope.nvim')
  " Find files using Telescope command-line sugar.
  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>

  " Using lua functions
  nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
  nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
  nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
  nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
endif

if has_key(plugs, 'nvim-tree.lua')
  let g:nvim_tree_side = 'right'  "left by default
  let g:nvim_tree_width = 60      "30 by default
  let g:nvim_tree_highlight_opened_files = 1
  nnoremap <leader>tt :NvimTreeToggle<CR>
  nnoremap <leader>tr :NvimTreeRefresh<CR>
  nnoremap <leader>tf :NvimTreeFindFile<CR>
endif
