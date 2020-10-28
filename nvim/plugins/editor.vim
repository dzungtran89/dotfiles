
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" set ai "Auto indent
" set si "Smart indent
" set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...

set nobackup
set nowb
set noswapfile

" Don't redraw while executing macros (good performance config)
set lazyredraw
" set relativenumber
" set complete-=i

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

function! CmdLine(str)
  call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'gv'
    call CmdLine("Ack '" . l:pattern . "' " )
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

if has_key(plugs, 'vim-autoformat')

  let g:autoformat_autoindent = 0
  let g:autoformat_retab = 0
  let g:autoformat_remove_trailing_spaces = 0

endif

if has_key(plugs, 'vim-multiple-cursors')
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
  let g:strip_whitespace_on_save=0
endif

if has_key(plugs, 'vim-winmanip')

  let g:winmanip_disable_key_mapping = 1

  nmap   1<Right>    <Plug>(JumpRight)
  nmap   1<Left>     <Plug>(JumpLeft)
  nmap   1<Down>     <Plug>(JumpDown)
  nmap   1<Up>       <Plug>(JumpUp)

  nmap   2<Right>    <Plug>(MoveBufRight)
  nmap   2<Left>     <Plug>(MoveBufLeft)
  nmap   2<Down>     <Plug>(MoveBufDown)
  nmap   2<Up>       <Plug>(MoveBufUp)

  nmap   3<Right>    <Plug>(MoveJumpBufRight)
  nmap   3<Left>     <Plug>(MoveJumpBufLeft)
  nmap   3<Down>     <Plug>(MoveJumpBufDown)
  nmap   3<Up>       <Plug>(MoveJumpBufUp)

  nmap   4<Right>    <Plug>(MoveWinToNextTab)
  nmap   4<Left>     <Plug>(MoveWinToPrevTab)

  nmap   5<Right>    <Plug>(CopyBufRight)
  nmap   5<Left>     <Plug>(CopyBufLeft)
  nmap   5<Down>     <Plug>(CopyBufDown)
  nmap   5<Up>       <Plug>(CopyBufUp)

  nmap   6<Right>    <Plug>(CopyJumpBufRight)
  nmap   6<Left>     <Plug>(CopyJumpBufLeft)
  nmap   6<Down>     <Plug>(CopyJumpBufDown)
  nmap   6<Up>       <Plug>(CopyJumpBufUp)

  nmap   <leader>z   <Plug>(MaximizeWin)
  nmap   <silent>    <leader>dw                 <Plug>(ClearAllWindows)
  nmap   <silent>    <leader>db                 <Plug>(ClearBufferList)

endif

" lua <<EOF
" local nvim_lsp = require'nvim_lsp'
" require'nvim_lsp'.jedi-language-server.setup{}
" EOF

if has_key(plugs, 'vim-run')
  let g:rundir = "/Users/tran/.config/nvim/rundir"
  let g:run_shell = $SHELL
  let g:run_quiet_default = 0
  let g:run_autosave_logs = 0
  let g:run_nostream_default = 0
  let g:run_browse_default_limit = 10
endif
