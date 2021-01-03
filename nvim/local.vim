let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = "python"
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

" Bundles
call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'tpope/vim-commentary'

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

Plug 'mcchrish/nnn.vim'
Plug 'sinetoami/fzy.nvim'
Plug 'srstevenson/vim-picker'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular'
Plug 'junegunn/goyo.vim'

" Git
Plug 'junegunn/gv.vim'
" Plug 'will133/vim-dirdiff'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-rhubarb'

if isdirectory('/usr/local/bin/fzf')
  Plug '/usr/local/bin/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif

Plug 'jesseleite/vim-agriculture'

call plug#end()

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set softtabstop=0
set expandtab
set cc=79

"" Map leader to ,
" let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

if exists('$SHELL')
  set shell=$SHELL
else
  set shell=/bin/sh
endif

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"" Disable the blinking cursor.
" set gcr=a:blinkon0
set scrolloff=3

"" Status bar
" set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

" Git
let g:fugitive_gitlab_domains = ['https://gitlab.trobz.com']

let $NNN_TRASH=1

" Disable default mappings
let g:nnn#set_default_mappings = 0

" Then set your own
" nnoremap <silent> <leader>nn :NnnPicker<CR>

let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }

" search
set noic

set foldmethod=syntax
set nonu
set norelativenumber

let g:python3_host_prog = '/Users/tran/.pyenv/shims/python'

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1
let g:indentLine_char = '.'
let g:indentLine_first_char = '.'

if has_key(plugs, 'spaceline.vim')
  let g:spaceline_seperate_style= 'slant-cons'
  let g:spaceline_line_symbol = 0
endif

"" fzf.vim
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

"*****************************************************************************
"" Mappings / Shortcuts
"*****************************************************************************"

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
nnoremap <silent> <leader>ff :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>

"Recovery commands from history through FZF
nmap <leader>y :History:<CR>

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>x :bn<CR>
" noremap <leader>q :bp<CR>
" noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

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

"" Open current line on GitHub
nnoremap <Leader>o :Gbrowse<CR>

nmap <Leader>B :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>

nmap <Leader>C :Commands<CR>
nmap <Leader>: :History:<CR>
nmap <Leader>S :Filetypes<CR>

noremap <leader>c :bd!<CR>
noremap <leader>w <C-w>
noremap <leader>Z :e!<CR>
noremap <leader>E :e<CR>
noremap <leader>Q :qa!<CR>

" Set working dir to the current file path
nnoremap <leader>de :lcd %:p:h<CR>

" set relativenumber
nmap <leader>l :set invrelativenumber<CR>
nmap <C-N> :cn<CR>
nmap <C-P> :cp<CR>

nmap <leader>vc @:

" vmux (evolution of vim + tmux)
"
" Prompt for a command to run
map <leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <leader>vl :VimuxRunLastCommand<CR>

" " Zoom the tmux runner pane
" map <leader>vz :VimuxZoomRunner<CR>
" " Inspect runner pane
" map <leader>vi :VimuxInspectRunner<CR>

" vim-agriculture
nmap <leader>/ <plug>RgRawSearch
vmap <leader>/ <plug>RgRawVisualSelection
nmap <leader>* <plug>RgRawWordUnderCursor

" n3
nnoremap <leader>n :NnnPicker '%:p:h'<CR>

if has_key(plugs, 'fzy.nvim')
  nnoremap <leader>fu :Fzy<CR>
endif

