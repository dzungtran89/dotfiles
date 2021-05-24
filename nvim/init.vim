" vim-bootstrap
" vim: set ft=vim fdm=marker:

"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = "python"

" nvim or vim
let g:vim_bootstrap_editor = "nvim"

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif

  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))


"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/grep.vim'

" Plug 'vim-scripts/CSApprox'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'

Plug 'avelino/vim-bootstrap-updater'
Plug 'sheerun/vim-polyglot'

let g:ale_disable_lsp = 1
let g:polyglot_disabled = ['python' , 'javascript']

let g:make = 'gmake'
if exists('make')
  let g:make = 'make'
endif

Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Vim-Session
Plug 'xolox/vim-misc'

"*****************************************************************************
"" Custom bundles
"*****************************************************************************

" html
"" HTML Bundle
" Plug 'hail2u/vim-css3-syntax'
" Plug 'gorodinskiy/vim-coloresque'
" Plug 'tpope/vim-haml'
" Plug 'mattn/emmet-vim'


" javascript
"" Javascript Bundle
" Plug 'jelera/vim-javascript-syntax'

Plug 'raimon49/requirements.txt.vim'

"*****************************************************************************
"*****************************************************************************

"" Include user's extra bundle
if filereadable(expand("~/.config/nvim/local_bundles.vim"))
  source ~/.config/nvim/local_bundles.vim
endif

call plug#end()

" Required:
filetype plugin on
filetype indent on
" set ai
" set si

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8


"" Fix backspace indent
set backspace=eol,start,indent

"" Tabs. May be overridden by autocmd rules
" set tabstop=4
set softtabstop=0
" set shiftwidth=4
set expandtab
set cc=79

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
" set nois
set noic
" set smartcase

set fileformats=unix,dos,mac

if exists('$SHELL')
  set shell=$SHELL
else
  set shell=/bin/sh
endif

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number

let no_buffers_menu=1

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
" set gfn=Monaco \10

if has("gui_running")

  if has("gui_mac") || has("gui_macvim")
    set guifont=Iosevka\ Fixed:h12
    set transparency=7
  endif

else

  " let g:CSApprox_loaded = 1

  " " IndentLine
  " let g:indentLine_enabled = 1
  " let g:indentLine_concealcursor = 0
  " let g:indentLine_char = '┆'
  " let g:indentLine_faster = 1

endif

"" Disable the blinking cursor.
" set gcr=a:blinkon0
" set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20

set scrolloff=3

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

" nnoremap n nzzzv
" nnoremap N Nzzzv

" vim-airline
if has_key(plugs, 'vim-airline')

  let g:airline_theme = 'powerlineish'
  let g:airline#extensions#branch#enabled = 1
  " let g:airline#extensions#ale#enabled = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tagbar#enabled = 1
  let g:airline_skip_empty_sections = 1

endif

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

"" NERDTree configuration
if has_key(plugs, 'nerdtree')

  let g:NERDTreeChDirMode=2
  let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
  let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
  let g:NERDTreeShowBookmarks=1
  let g:nerdtree_tabs_focus_on_files=1
  let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
  let g:NERDTreeWinSize = 50
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
  nnoremap <silent> <F2> :NERDTreeFind<CR>
  nnoremap <silent> <F3> :NERDTreeToggle<CR>

endif

" grep.vim
nnoremap <silent> <leader>sf :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'


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
  " autocmd BufEnter * :syntax sync maxlines=200
  autocmd BufEnter * :syntax sync fromstart
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

" set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Split
" noremap <Leader>h :<C-u>split<CR>
" noremap <Leader>v :<C-u>vsplit<CR>

" " session management
" nnoremap <leader>so :OpenSession<Space>
" nnoremap <leader>ss :SaveSession<Space>
" nnoremap <leader>sd :DeleteSession<CR>
" nnoremap <leader>sc :CloseSession<CR>

" "" Tabs
" nnoremap <Tab> gt
" nnoremap <S-Tab> gT
" nnoremap <S-t> :tabnew<CR>

" "" Set working directory
" " nnoremap <leader>. :lcd %:p:h<CR>

" " Tagbar
" if has_key(plugs, 'tagbar')
"   nmap <silent> <F4> :TagbarToggle<CR>
"   let g:tagbar_autofocus = 1
" endif

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

" if has('macunix')
"   " pbcopy for OSX copy/paste
"   vmap <C-x> :!pbcopy<CR>
"   vmap <C-c> :w !pbcopy<CR><CR>
" endif

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>x :bn<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

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

"*****************************************************************************
"" Custom configs
"*****************************************************************************

" html
" for html files, 2 spaces
" autocmd Filetype html setlocal ts=2 sw=2 expandtab


" javascript
" let g:javascript_enable_domhtmlcss = 1

" vim-javascript
" augroup vimrc-javascript
"   autocmd!
"   autocmd FileType javascript setl tabstop=4|setl shiftwidth=4|setl expandtab softtabstop=4
" augroup END

" python
" vim-python
" augroup vimrc-python
"   autocmd!
"   autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
"       \ formatoptions+=croq softtabstop=4
"       \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
" augroup END

" jedi-vim

if has_key(plugs, 'jedi-vim')
  let g:jedi#popup_on_dot = 0
  let g:jedi#goto_assignments_command = "<leader>g"
  let g:jedi#goto_definitions_command = "<leader>d"
  let g:jedi#documentation_command = "K"
  let g:jedi#usages_command = "<leader>n"
  let g:jedi#rename_command = "<leader>r"
  let g:jedi#show_call_signatures = "0"
  let g:jedi#completions_command = "<C-Space>"
  let g:jedi#smart_auto_mappings = 0
endif

" ale
" :call extend(g:ale_linters, {

" Syntax highlight
" Default highlight is better than polyglot
let python_highlight_all = 1

"*****************************************************************************
"*****************************************************************************

"" Include user's local vim config
if filereadable(expand("~/.config/nvim/local_init.vim"))
  source ~/.config/nvim/local_init.vim
endif
