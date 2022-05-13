" vim: ft=vim

"*****************************************************************************
"" Vim-Plug core
"*****************************************************************************
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if has('win32')&&!has('win60')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.nvim/plugged'))

if filereadable(expand("$HOME/.config/nvim/bundles.vim"))
  source $HOME/.config/nvim/bundles.vim
endif

call plug#end()

" Required:
if !has('nvim')
  filetype plugin indent on
endif

function! PlugLoaded(name)
  return has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir)
endfunction

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set history=500
set ttyfast

"" split more natural
set splitbelow
set splitright

"" Use true colors
" " using vim + tmux: https://github.com/vim/vim/issues/993
" set t_8f=^[[38;2;%lu;%lu;%lum
" set t_8b=^[[48;2;%lu;%lu;%lum
if has('nvim')
  set termguicolors
else
  set term=screen-256color 
endif


"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set lazyredraw
set colorcolumn=79

let mapleader=' '
let maplocalleader=','

"" Enable hidden buffers
set hidden

"" Searching
set nohlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac
set numberwidth=2

set nofoldenable
set fml=2
set viewoptions=folds,cursor
augroup SaveFolds
  autocmd!
  autocmd BufWinLeave,BufWritePost *.* mkview
  autocmd BufWinEnter,BufRead      *.* silent! loadview
augroup END

if $SHELL == '/usr/bin/fish'
  set shell=/usr/bin/zsh
else
  set shell=$SHELL
endif

let g:session_directory = "~/.nvim/session"

" session management
if PlugLoaded('vim-session')
  let g:session_autoload = "no"
  let g:session_autosave = "no"
  let g:session_command_aliases = 1
  set sessionoptions=buffers,curdir,tabpages
endif

let g:netrw_banner = 1

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set nonu relativenumber

let no_buffers_menu=1

set mousemodel=popup
set t_Co=256

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  " let g:CSApprox_loaded = 1

  " IndentLine
  if PlugLoaded('indentLine')
    let g:indentLine_enabled = 1
    let g:indentLine_char_list = ['│', '¦', '┆', '┊']
    let g:indentLine_fileType = ['python', 'js', 'xml']
  endif

  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif

endif


if &term =~ '256color'
  set t_ut=
endif

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=2

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap <F3> :grep! "^def\\\|^class\\\|^    def\\\\| = fields\\." `find . -name "*.py"`<CR><CR>
vnoremap <F3> "zy:grep! "<C-R>z" `find . -name "*.py"`<LEFT><LEFT>

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" grep.vim
if PlugLoaded('grep.vim')
  nnoremap <silent> <leader>f :Rgrep<CR>
  let Grep_Default_Options = '-IR'
  let Grep_Skip_Files = '*.log *.db'
  let Grep_Skip_Dirs = '.git node_modules'
endif

"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <S-t> :tabnew<CR>

nnoremap <leader>bq :close<CR>
nnoremap <leader>bd :b#\|bw#<CR>

" Save the file without leaving the mode
inoremap <C-s>      <Cmd>update<CR>

nnoremap  <leader>fw :update<CR>
nnoremap  <leader>fe :e!<CR>
nnoremap  <leader>fd :bw!<CR>
nnoremap  qq         :bw!<CR>

nnoremap <localleader>le :setl expandtab sw=2<CR>
nnoremap <localleader>ls :setl syntax=

"" Set working directory
nnoremap cd :cd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>ed :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" fzf.vim
if PlugLoaded('fzf.vim')
  set wildmode=list:longest,list:full
  set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
  let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

  " The Silver Searcher
  if executable('ag')
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
    set grepprg=ag\ --nogroup\ --nocolor
  endif

  " ripgrep
  if executable('rg')
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
    set grepprg=rg\ --vimgrep
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
  endif
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
"Recovery commands from history through FZF

" snippets
if PlugLoaded('ultisnips')
  let g:UltiSnipsExpandTrigger="<c-j>"
  let g:UltiSnipsJumpForwardTrigger="<c-l>"
  let g:UltiSnipsJumpBackwardTrigger="<c-h>"
  let g:UltiSnipsEditSplit="vertical"
endif

" Tagbar
if PlugLoaded('tagbar')
  nmap <silent> <leader>to :TagbarToggle<CR>
  let g:tagbar_autofocus = 1
endif

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
  augroup WSLYank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
  augroup END

elseif has('unnamedplus')
  set clipboard+=unnamedplus
endif

" noremap YY "+y<CR>
" noremap <leader>p "+gP<CR>
" noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
noremap <leader>z :bp<CR>
" noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
" noremap <leader>w :bn<CR>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


"*****************************************************************************
"" Custom configs
"*****************************************************************************

" javascript
let g:javascript_enable_domhtmlcss = 1

" " vim-javascript
" augroup vimrc-javascript
"   autocmd!
"   autocmd FileType javascript setl tabstop=4|setl shiftwidth=4|setl expandtab softtabstop=4
" augroup END
"
" " python
" " vim-python
" augroup vimrc-python
"   autocmd!
"   autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
"         \ formatoptions+=croq softtabstop=4
"         \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
" augroup END
"
if PlugLoaded('ale')

  " on purpose, enabled manually
  let g:ale_enabled = 0
  nnoremap <localleader>te :ALEEnableBuffer<CR>
  nnoremap <leader>te      :ALEEnable<CR>

  let g:ale_pattern_options = {'[^\.py]+$': {'ale_enabled': 0}}
  let g:ale_list_window_size = 5

  let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_insert_leave = 0

  " You can disable this option too
  " if you don't want linters to run on opening a file
  let g:ale_lint_on_enter = 0

  " " keep gutter always show
  " let g:ale_sign_column_always = 1

  let g:ale_linters = {
        \   'python': ['flake8'],
        \}

  " Disable warnings about trailing whitespace for Python files.
  let g:ale_warn_about_trailing_whitespace = 0

  nmap <silent> <C-up> <Plug>(ale_previous_wrap)
  nmap <silent> <C-down> <Plug>(ale_next_wrap)
endif

" " Syntax highlight
" let python_highlight_all = 1

" vuejs
" vim vue
let g:vue_disable_pre_processors=1
" vim vue plugin
let g:vim_vue_plugin_load_full_syntax = 1

"*****************************************************************************
"" Convenience variables {{{1
"*****************************************************************************

if PlugLoaded('vim-airline')
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  if !exists('g:airline_powerline_fonts')
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline_left_sep          = '▶'
    let g:airline_left_alt_sep      = '»'
    let g:airline_right_sep         = '◀'
    let g:airline_right_alt_sep     = '«'
    let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
    let g:airline#extensions#readonly#symbol   = '⊘'
    let g:airline#extensions#linecolumn#prefix = '¶'
    let g:airline#extensions#paste#symbol      = 'ρ'
    let g:airline_symbols.linenr    = '␊'
    let g:airline_symbols.branch    = '⎇'
    let g:airline_symbols.paste     = 'ρ'
    let g:airline_symbols.paste     = 'Þ'
    let g:airline_symbols.paste     = '∥'
    let g:airline_symbols.whitespace = 'Ξ'
  else
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''

    " powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
  endif
endif

" More vim configs {{{1
source $HOME/.config/nvim/config.vim

source $HOME/.config/nvim/config/_fzf.vim
source $HOME/.config/nvim/config/_find.vim

source $HOME/.config/nvim/config/_coc.vim
source $HOME/.config/nvim/config/_git.vim
source $HOME/.config/nvim/config/_snips.vim
source $HOME/.config/nvim/config/_jump.vim
source $HOME/.config/nvim/config/_wiki.vim
source $HOME/.config/nvim/config/_md.vim
source $HOME/.config/nvim/config/_linter.vim
source $HOME/.config/nvim/config/_gopass.vim

" Special mappings
nnoremap <silent> <leader>;  :Explore<CR>
nnoremap <silent> <leader>re :Rexplore<CR>

if PlugLoaded('gitsigns.nvim')
  set timeoutlen=250
endif

" Cache lua configs
if PlugLoaded('impatient.nvim')
  lua require('impatient')
endif

" And, lua as well, to be continued ...
lua require('init')

if has('nvim-0.6')
  unmap Y
endif
