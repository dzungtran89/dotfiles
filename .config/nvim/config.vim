" Options {{{
nnoremap <leader>ui :colorscheme<space>

if PlugLoaded('vim-hardtime')
  let g:hardtime_default_on = 1
  let g:hardtime_allow_different_key = 1
  let g:hardtime_ignore_quickfix = 1
endif

set nojoinspaces                    " Join sentences with single space
set shiftround                      " Round >> to nearest shiftwidth multiple
set nowrap

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowritebackup
set noswapfile

" Usefull to search all files recursively
set path+=**

" Give more space for displaying messages.
" set cmdheight=2

set undodir=$HOME/.nvim/undo          " Undo history location
set undofile                          " Undo history

if has('nvim')
  set inccommand=split
endif

" Auto resize windows
augroup windows
  autocmd!
  " Evenly resize windows on terminal screen change.
  autocmd VimResized * :wincmd =
  " Split help windows vertically, on the right.
  autocmd FileType help wincmd L
augroup END

" ---------------------------------------------------------------
" Functions
" ---------------------------------------------------------------
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
" autocmd FileType markdown setl conceallevel=0

" Buffer: Determine filetype based on path
autocmd BufRead,BufNewFile *.cls setlocal filetype=tex
autocmd BufRead,BufNewFile *.nxc setlocal filetype=cpp
autocmd BufRead,BufNewFile *rc   setlocal filetype=config

" Buffer: Disable continue comment on new line
autocmd BufRead,BufNewFile * setlocal formatoptions-=cro

" Miscellaneous: Auto close preview
autocmd InsertLeave * silent! pclose!

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Disabling the cursor-line/column in unused windows/buffers.
augroup cursorline
  autocmd!
  autocmd WinEnter,BufEnter * setlocal cursorline cursorcolumn
  autocmd WinLeave,BufLeave * setlocal nocursorline nocursorcolumn
augroup END

" -------------------------------------------------
" UI
" -------------------------------------------------
" Always draw gutter for gitgutter, signify, etc.
set signcolumn=yes

" don't syntax-highlight long lines
set synmaxcol=200

set list
set listchars=tab:▸—\ ,eol:¬,extends:❯,precedes:❮,trail:·,nbsp:·

" Highlight the column after 'textwidth'
" set colorcolumn=+1

" Set program title to 'nvim'
set title
setglobal titlestring=nvim

" Remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

" Clar registers {{{1
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), " ") | endfor

" Copy search matches {{{1
command! -register CopyMatches call CopyMatches(<q-reg>)

command! CopyBuffer let @+ = expand('%:p')

" Mappings
" Auto insert dash with the same length of header
" -----------------------------------------------
nnoremap <localleader>u YpVr=<CR>

"" Keep cursor at the first match
nnoremap * *N
nnoremap # #N

" quick way to search wholeword
nnoremap <localleader>/ /\<\><left><left>

" TL;DR quit faster
nnoremap <leader>qq :qa!<CR>

" Go to definitions
nmap <silent> gd  g<C-]>

" search and replace pattern under the cursor
nnoremap c* *Ncgn

" }}}

" -----------------------------------------------
" FZF
" -----------------------------------------------
nnoremap <Leader>gt :!ctags -R --languages=python

" Wrap
nnoremap <localleader>w :setl wrap!<CR>

if PlugLoaded('editorconfig-vim')
  let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
endif

if PlugLoaded('vim-matchup')
  " let g:matchup_delim_noskips = 1   " recognize symbols within comments
  let g:matchup_delim_noskips = 2   " don't recognize anything in comments
  " Note: cs% command might be conflicted with vim-surround
  let g:matchup_surround_enabled = 1
  let g:matchup_delim_stopline = 500
endif

if PlugLoaded('split-term.vim')
  nnoremap <localleader>tt :Term<SPACE>
  nnoremap <localleader>t2 :2Term<SPACE>
  nnoremap <localleader>tv :VTerm<SPACE>
  nnoremap <localleader>tn :TTerm<SPACE>
endif

if PlugLoaded('vim-floaterm')
  let g:floaterm_keymap_toggle = '<leader>tt'
  let g:floaterm_keymap_next   = '<leader>tn'
  let g:floaterm_keymap_prev   = '<leader>tp'
  " let g:floaterm_keymap_new    = '<leader>tt'

  " Floaterm
  let g:floaterm_gitcommit='floaterm'
  let g:floaterm_autoinsert=1
  let g:floaterm_width=0.8
  let g:floaterm_height=0.8
  let g:floaterm_wintitle=0
  let g:floaterm_autoclose=1
endif

if !PlugLoaded('coc.nvim')
  " Fallback to native session if coc is not loaded
  nnoremap <leader>qo :source ~/.nvim/session/
  nnoremap <leader>qw :mks! ~/.nvim/session/
endif

if PlugLoaded('vim-surround')
  let g:surround_no_mappings = 1
  nmap ds       <Plug>Dsurround
  nmap cs       <Plug>Csurround
  nmap cS       <Plug>CSurround
  nmap ys       <Plug>Ysurround
  nmap yS       <Plug>YSurround
  nmap yss      <Plug>Yssurround
  nmap ySs      <Plug>YSsurround
  nmap ySS      <Plug>YSsurround
  xmap gs       <Plug>VSurround
  xmap gS       <Plug>VgSurround
endif

if PlugLoaded('indentLine')
  let g:indentLine_enabled = 0
endif
