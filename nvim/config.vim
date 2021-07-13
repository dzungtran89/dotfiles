" ---------------------------------------------------------------
" Options
" ---------------------------------------------------------------
set nojoinspaces                    " Join sentences with single space
set shiftround                      " Round >> to nearest shiftwidth multiple
set nowrap

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

set undodir=$HOME/.vim/undo         " Undo history location
set undofile                        " Undo history

if has('nvim')
  set inccommand=split
endif

set relativenumber
nmap <silent> <leader>L :set invrelativenumber<CR>

" ---------------------------------------------------------------
" Functions
" ---------------------------------------------------------------
" Folding
function! CustomFold()
  return printf('  %6-d%s', v:foldend - v:foldstart + 1, getline(v:foldstart))
endfunction

set fillchars=fold:\ | set foldtext=CustomFold() 

" CheckBackspace
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Auto resize windows
augroup windows
  autocmd!
  " Evenly resize windows on terminal screen change.
  autocmd VimResized * :wincmd =
  " Split help windows vertically, on the right.
  autocmd FileType help wincmd L
augroup END

function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction

function! s:get_git_root()
  let root = split(system('git rev-parse --show-toplevel'), '\n')[0]
  return v:shell_error ? '' : root
endfunction


" ---------------------------------------------------------------
" AUTOCOMMANDS
" ---------------------------------------------------------------
" Filetype: Close location list
autocmd FileType qf nnoremap <buffer> <CR> <CR>:lclose<CR>

" Filetype: Conceal level
autocmd FileType markdown   setlocal conceallevel=0

" " Filetype: Indenting and Tabs
" autocmd FileType css        setlocal expandtab shiftwidth=2 softtabstop=4 tabstop=4
" autocmd FileType fortran    setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
" autocmd FileType haskell    setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
" autocmd FileType html       setlocal expandtab shiftwidth=2 softtabstop=4 tabstop=4
" autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=4 tabstop=4
" autocmd FileType lisp       setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
" autocmd FileType lua        setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
" autocmd FileType markdown   setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
" autocmd FileType python     setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
" autocmd FileType tex        setlocal expandtab shiftwidth=2 softtabstop=4 tabstop=4
" autocmd FileType typescript setlocal expandtab shiftwidth=2 softtabstop=4 tabstop=4

" Filetype: Text width
autocmd FileType python     setlocal textwidth=79 colorcolumn=79
autocmd FileType tex        setlocal textwidth=79 colorcolumn=79

" Buffer: Determine filetype based on path
autocmd BufRead,BufNewFile *.cls setlocal filetype=tex
autocmd BufRead,BufNewFile *.nxc setlocal filetype=cpp
autocmd BufRead,BufNewFile *rc setlocal filetype=config

" autocmd BufRead,BufNewFile if empty(&filetype) | ~/.config/* setlocal filetype=config | endif
" autocmd BufRead,BufNewFile if empty(&filetype) | ~/dotfiles/*/.config/* setlocal filetype=config | endif
" autocmd BufRead,BufNewFile if empty(&filetype) | ~/dotfiles/bash/* setlocal filetype=zsh | endif
" autocmd BufRead,BufNewFile if empty(&filetype) | ~/dotfiles/zsh/* setlocal filetype=zsh | endif

" Buffer: Disable continue comment on new line
autocmd BufRead,BufNewFile * setlocal formatoptions-=cro

" Miscellaneous: Auto close preview
autocmd InsertLeave * silent! pclose!

" " Miscellaneous: Check up to date plugins
" autocmd VimEnter * call CheckForUpdates()

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Disabling the cursor-line/column in unused windows/buffers.
augroup cursorline
  autocmd!
  autocmd WinEnter,BufEnter * setlocal cursorline
  autocmd WinLeave,BufLeave * setlocal nocursorline
augroup END

" -------------------------------------------------
" UI
" -------------------------------------------------
" set redrawtime=10000

" Always draw gutter for gitgutter, signify, etc.
set signcolumn=yes

" don't syntax-highlight long lines
set synmaxcol=200

set list
set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:·,nbsp:·

" Highlight the column after 'textwidth'
set colorcolumn=+1

" Set program title to 'nvim'
set title
setglobal titlestring=nvim

set nonu

" Highlight the current line, don't highlight the current column
set nocursorcolumn

" Remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

" Clar registers {{{1
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), " ") | endfor

" Copy search matches {{{1
command! -register CopyMatches call CopyMatches(<q-reg>)

command! CopyBuffer let @+ = expand('%:p')

" fzf {{{1
if PlugLoaded('fzf.vim')
  command! -bang -nargs=? -complete=dir LocateFiles
        \ call fzf#run(fzf#wrap({
        \     'source': 'locate --database=./.locate.db <q-args>',
        \     'options': '-m' },
        \   <bang>0))

  " command! -bang -nargs=* -complete=dir SmartFiles
  "       \ call SmartFiles(<q-args>)

  command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, &columns > 120 ?
        \ fzf#vim#with_preview() : {}, <bang>0)

  command! -bang -nargs=? -complete=dir Buffers
        \ call fzf#vim#buffers(<q-args>, &columns > 120 ?
        \ fzf#vim#with_preview() : {}, <bang>0)
endif
" }}}

nnoremap <silent> <leader>ts
      \ :if exists("syntax_on") <BAR>
      \    syntax off <BAR>
      \ else <BAR>
      \    syntax enable <BAR>
      \ endif<CR>

" Mappings
" Auto insert dash with the same length of header
" -----------------------------------------------
nnoremap <localleader>u YpVr-<CR>

"" Keep cursor at the first match
nnoremap * *N
nnoremap # #N

" quick way to search wholeword
nnoremap <localleader>/ /\<\><left><left>

" TL;DR quit faster
nnoremap <leader>qq :qa!<CR>

" Go to definitions
nnoremap <silent> <leader>]  g<C-]>

" search and replace pattern under the cursor
nnoremap c* *Ncgn

" -----------------------------------------------
" FZF
" -----------------------------------------------
" nnoremap("<Leader>es"     ,  ":LocateFiles .<CR>")
nnoremap <Leader>ef :FZF -m<CR>
nnoremap <Leader>ew :Windows<CR>
nnoremap <Leader>ee :FZFMru<CR>
nnoremap <Leader>eg :GFiles --cached --others --exclude-standard<CR>
nnoremap <Leader>eh :History<CR>
nnoremap <Leader>el :Lines<CR>
nnoremap <Leader>ea :Ag!<CR>
nnoremap <Leader>er :Rg!<CR>
nnoremap <Leader>em :Marks<CR>
nnoremap <Leader>et :Tags<CR>
nnoremap <Leader>ec :History:<CR>
nnoremap <Leader>es :Filetypes<CR>
" nnoremap("<Leader>,"      ,  ":SmartFiles<CR>")

" Wrap
nnoremap <localleader>w :set wrap!<CR>

if PlugLoaded('nord-vim')
  let g:nord_bold_vertical_split_line = 1
  let g:nord_uniform_diff_background = 1
  let g:nord_uniform_status_lines = 1
  let g:nord_style = 'hard'
endif

if PlugLoaded('gruvbox-flat.nvim')
  let g:gruvbox_flat_style = "hard"
endif

nnoremap <silent> <leader>ui :colorscheme<space>
colorscheme termschool

if PlugLoaded('editorconfig-vim')
  let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
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

if PlugLoaded('nvim-colorizer.lua')
lua << EOF
  require 'colorizer'.setup({
    'css';
    'javascript';
    html = { mode = 'background' };
    }, { mode = 'foreground' })
EOF

  noremap <leader>tc :ColorizerToggle<CR>
endif

" WSL yank support
if has("unix")
  let s:clip = 'clip.exe'  " change this path according to your mount point
  if executable(s:clip)
    augroup WSLYank
      autocmd!
      autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
  endif
endif
