" Tagbar
if PlugLoaded('tagbar')
  nmap <silent> <F4> :TagbarToggle<CR>
  let g:tagbar_autofocus = 1
endif

if PlugLoaded('editorconfig-vim')
  let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
endif

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
" vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
" vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" function! CmdLine(str)
"   call feedkeys(":" . a:str)
" endfunction

" function! VisualSelection(direction, extra_filter) range
"   let l:saved_reg = @"
"   execute "normal! vgvy"

"   let l:pattern = escape(@", "\\/.*'$^~[]")
"   let l:pattern = substitute(l:pattern, "\n$", "", "")

"   if a:direction == 'gv'
"     call CmdLine("Ack '" . l:pattern . "' " )
"   elseif a:direction == 'replace'
"     call CmdLine("%s" . '/'. l:pattern . '/')
"   endif

"   let @/ = l:pattern
"   let @" = l:saved_reg
" endfunction

if PlugLoaded('vim-autoformat')

  let g:autoformat_autoindent = 0
  let g:autoformat_retab = 0
  let g:autoformat_remove_trailing_spaces = 0

endif

if PlugLoaded('vim-multiple-cursors')
  let g:multi_cursor_use_default_mapping=0

  " Default mapping
  let g:multi_cursor_start_word_key      = '<C-n>'
  let g:multi_cursor_select_all_word_key = '<A-n>'
  let g:multi_cursor_start_key           = 'g<C-n>'
  let g:multi_cursor_select_all_key      = 'g<A-n>'
  let g:multi_cursor_next_key            = '<C-n>'
  let g:multi_cursor_prev_key            = '<C-p>'
  let g:multi_cursor_skip_key            = '<C-x>'
  let g:multi_cursor_quit_key            = '<Esc>'
endif

if has_key(plugs, 'vim-better-whitespace')
  let g:better_whitespace_enabled = 1
  let g:strip_whitespace_on_save=0
endif

" " Markdown
" augroup Markdown
"   autocmd!
"   autocmd FileType markdown set wrap
" augroup END

if PlugLoaded('nvim-treesitter')
lua <<EOF
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  }
}
EOF
endif

if PlugLoaded('nvim-colorizer.lua')
lua << eof
  require 'colorizer'.setup({
    'css';
    'javascript';
    html = { mode = 'background' };
    }, { mode = 'foreground' })
eof

  noremap <leader>tc :ColorizerToggle<CR>
endif

