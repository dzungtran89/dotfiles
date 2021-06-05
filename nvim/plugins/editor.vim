
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable Ex mode keybinding
nnoremap Q <Nop>

noremap <localleader>c :bd!<CR>
noremap <leader>w <C-w>
noremap <leader>Q :qa!<CR>

nnoremap <silent> <leader>i :set ic!<CR>

" Wrap
set nowrap
nnoremap <localleader>w :set wrap!<CR>

" Set working dir to the current file path
nnoremap <leader>ed :lcd %:p:h<CR>

nmap <silent> <leader>l :set invrelativenumber<CR>

"" Split
" noremap <Leader>h :<C-u>split<CR>
" noremap <Leader>v :<C-u>vsplit<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <S-t> :tabnew<CR>

"" Set working directory
" nnoremap <leader>. :lcd %:p:h<CR>

" Tagbar
if has_key(plugs, 'tagbar')
  nmap <silent> <F4> :TagbarToggle<CR>
  let g:tagbar_autofocus = 1
endif

if has_key(plugs, 'editorconfig-vim')
  let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
endif

let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1
let g:indentLine_first_char = '.'

" set ai "Auto indent
" set si "Smart indent
" set wrap "Wrap lines

" Session management
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>x :bn<CR>

" Auto insert dash with the same length of header
" -----------------------------------------------
nnoremap <localleader>u YpVr-<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Keep cursor at the first match
nnoremap * *N
nnoremap # #N

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

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
  let g:better_whitespace_enabled = 0
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

if has_key(plugs, 'vim-prettier')
  let g:prettier#autoformat = 0
endif

if has_key(plugs, 'scrollbar.nvim')
  augroup ScrollbarInit
    autocmd!
    autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()
    autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
    autocmd WinLeave,FocusLost             * silent! lua require('scrollbar').clear()
  augroup end
endif

if has_key(plugs, 'minimap.vim')
  let g:minimap_width = 10
  let g:minimap_auto_start = 1
  let g:minimap_auto_start_win_enter = 1
endif

" Disabling the cursor-line/column in unused windows/buffers.
augroup cursorline
  autocmd!
  autocmd WinEnter,BufEnter * setlocal cursorline
  autocmd WinLeave,BufLeave * setlocal nocursorline
augroup END

" Markdown
augroup Markdown
  autocmd!
  autocmd FileType markdown set wrap
augroup END

if has_key(plugs, 'HighStr.nvim')
  vnoremap <silent> <leader>h1 :<c-u>HSHighlight 1<CR>
  vnoremap <silent> <leader>h2 :<c-u>HSHighlight 2<CR>
  vnoremap <silent> <leader>h3 :<c-u>HSHighlight 3<CR>
  vnoremap <silent> <leader>h0 :<c-u>HSRmHighlight<CR>
endif

if has_key(plugs, 'nvim-treesitter')
lua <<EOF
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  }
}
EOF
endif

if has_key(plugs, 'nvim-colorizer.lua')
  noremap <leader>tc :ColorizerToggle<CR>
endif
