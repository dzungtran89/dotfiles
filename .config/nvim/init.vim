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
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) .
  \" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.nvim/plugged'))

if filereadable(expand("$HOME/.config/nvim/plugs.vim"))
  source $HOME/.config/nvim/plugs.vim
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

"" Set wildmenu (autocompletions in command line).
set wildmenu
set wildoptions+=pum

"" Command prompt completion keystroke is tab (\t).
set wildchar=<Tab>

"" How to refer to wildchar inside of mappings (26 == ctrl-z).
set wildcharm=26

set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__,node_modules

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
"" Convenience variables {{{1
"*****************************************************************************

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

" Special/lazy mappings
nnoremap <silent> <leader>;  :Explore<CR>
nnoremap <silent> <leader>re :Rexplore<CR>
nnoremap <localleader>gd     :r!date "+\%Y-\%m-\%d"<CR>
nnoremap <leader>w!          :w !sudo tee > /dev/null %

" Formatting py
nnoremap <localleader>fm     :!black %

" And, lua as well, to be continued ...
lua require('init')

if has('nvim-0.6')
  unmap Y
endif
