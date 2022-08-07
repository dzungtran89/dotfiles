" vim:ft=vim:fdm=marker:fdl=0:sw=2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CREDITS:
"       Amir Salihefendic — @amix3k
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" UPDATE:
"       A minimal vimrc for quickly troubleshooting purpose
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugins {{{1
let vimplug_exists=expand('~/.vim/autoload/plug.vim')
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

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Core
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'junegunn/vim-easy-align'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

Plug 'easymotion/vim-easymotion'
Plug 'dhruvasagar/vim-zoom'
Plug 'Yggdroot/indentLine'

Plug 'itchyny/lightline.vim'
Plug 'cocopon/iceberg.vim'

" Plugin options
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500
set conceallevel=0
set cursorline
set cursorcolumn
set relativenumber
" set foldmethod=syntax
" set foldcolumn=1
set undodir="~/.vim/undo-dir"
set list
set listchars=tab:→\ ,eol:¬,extends:❯,precedes:❮,trail:·,nbsp:·

if &term =~ '^screen'
  set term=xterm-256color
endif

" Remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

if has('macunix')
  " vim hardcodes background color erase even if the terminfo file does
  " not contain bce (not to mention that libvte based terminals
  " incorrectly contain bce in their terminfo files). This causes
  " incorrect background rendering when using a color theme with a
  " background color.
  let &t_ut=''
  au BufNewFile,BufRead /private/**/gopass** setlocal noswapfile nobackup noundofile
else
  au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile
endif

" Enable filetype plugins
filetype plugin on
filetype indent on

set signcolumn=yes

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<space>"
let maplocalleader = ","

nnoremap cd         :cd %:p:h<CR>:pwd<CR>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
  augroup WSLYank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
  augroup END

elseif has('unnamedplus')
  set clipboard+=unnamedplus

elseif has('macunix')
  set clipboard=unnamed
endif

set path+=**

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set nowrap
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
" set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

if exists('$SHELL')
  set shell=$SHELL
else
  set shell=/bin/sh
endif

" Properly disable sound on errors on MacVim
if has("gui_macvim")
  autocmd GUIEnter * set vb t_vb=
  set guifont=Iosevka\ Fixed:h16
  set guioptions+=k
  set guicursor+=a:blinkon0
  " set guioptions-=m
endif

command! CopyBuffer let @+ = expand('%:p')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

set background=dark
set termguicolors
colorscheme iceberg

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

let g:netrw_banner = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent

""""""""""""""""""""""""""""""
" => Visual mode related {{{1
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :b#\|bd#<cr>
map <leader>fd :bw!<cr>
nn  <leader>fe :e!<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Explorer
nmap <leader>; :Explore<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""""""""""""""""""""""""""""""
" => Status line {{{1
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

"" Disable the blinking cursor.
" set gcr=a:blinkon0
set scrolloff=3

" Format the status line
set statusline=\ %{HasPaste()}%t%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ %l:%c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun

if has("autocmd")
  autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
nnoremap <localleader>fm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <localleader>p :setlocal paste!<cr>

set sessionoptions=buffers,curdir,tabpages

" session management
nnoremap <leader>qo :source ~/.vim/sessions/
nnoremap <leader>qw :mks! ~/.vim/sessions/
nnoremap <leader>qq :qa!<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction

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

if has_key(plugs, 'vim-easymotion')

  let g:EasyMotion_do_mapping = 0 " Disable default mappings

  " Turn on case-insensitive feature
  let g:EasyMotion_smartcase = 1

  " JK motions: Line motions
  nmap <localleader>j <Plug>(easymotion-j)
  nmap <localleader>k <Plug>(easymotion-k)

  " s{char}{char} to move to {char}{char}
  nmap s <Plug>(easymotion-s2)
  nmap S <Plug>(easymotion-overwin-f2)
  omap t <Plug>(easymotion-bd-tl)

endif

if has_key(plugs, 'any-jump.vim')
  " Normal mode: Jump to definition under cursor
  nnoremap <leader>js :AnyJump<CR>
  " Visual mode: jump to selected text in visual mode
  xnoremap <leader>js :AnyJumpVisual<CR>
  " Normal mode: open previous opened file (after jump)
  nnoremap <leader>jb :AnyJumpBack<CR>
  " Normal mode: open last closed search window again
  nnoremap <leader>jl :AnyJumpLastResults<CR>
endif

if has_key(plugs, 'indentLine')
  " let g:indentLine_conceallevel = 0
  let g:indentLine_enabled = 0
  let g:indentLine_char_list = ['│', '¦', '┆', '┊']
  nnoremap <leader>ti :IndentLinesToggle<cr>
endif

" lightline {{{1
if has_key(plugs, 'lightline.vim')
  let g:lightline = {
        \'colorscheme': 'one',
        \'active': {
        \  'left': [
        \    ['mode', 'paste'],
        \    ['readonly', 'cwd'],
        \    ['filename', 'lineinfo', 'percent']
        \    ],
        \  'right': [
        \    ['zoom'],
        \    ['fileformat', 'fileencoding', 'filetype'],
        \    ]
        \  },
        \  'component': {
        \    'cwd': '%{getcwd()}',
        \    'zoom': '%{zoom#statusline()}',
        \    'lineinfo': '%3l:%-2v%<',
        \  },
        \'component_function': {
        \    'fileformat': 'LightlineFileformat',
        \    'filetype': 'LightlineFiletype',
        \    'filename': 'LightlineFilename',
        \}
        \    }

  function! LightlineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
  endfunction

  function! LightlineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
  endfunction

  function! LightlineFilename()
    let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    let modified = &modified ? ' +' : ''
    return filename . modified
  endfunction

endif
" }}}

" SEARCHING {{{

" Quickfix
nnoremap <leader>p      :copen<CR>
nnoremap <localleader>p :lopen<CR>
nnoremap <silent> <c-n> :cnext<CR>
nnoremap <silent> <c-p> :cprevious<CR>

if has_key(plugs, 'ack.vim')

  if executable('rg')
    let g:ackprg = 'rg --vimgrep --smart-case'
  endif

  let g:ack_autoclose = 1
  let g:ack_use_cword_for_empty_search = 1

  cnoreabbrev Ack Ack!
  cnoreabbrev LAck LAck!
  nnoremap <leader>/       :LAck -t
  vnoremap <leader>/       y:LAck -we "<C-r>=fnameescape(@")<CR>" -tpy %

  " lazy mappings
  " wholeword, ignore !tests and l10n*
  nmap <leader>st :LAck  --glob "!test*" --glob "!l10n*" -we "\#.*(TODO\\|TOCHECK\\|FIXME)"<space>

endif

" Lazy mappings for editor
nnoremap <localleader>gd :r!date "+\%Y-\%m-\%d"<CR>
nnoremap <C-i> <C-a>

if has_key(plugs, 'fzf.vim')

  "" fzf.vim
  let g:fzf_preview_window = ['right:40%:hidden', 'ctrl-/']

  let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.6, 'border': 'sharp'} }

  set wildmode=list:longest,list:full
  set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
  let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

  " ripgrep
  if executable('rg')
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
    " command! -bang -nargs=* Find
    "       \ call fzf#vim#grep('rg --column --line-number --no-heading --smart-case --hidden --follow --glob "!.git/*" --color "always"
    "       \'.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
    command! -bang -nargs=* Rg
          \ call fzf#vim#grep('rg --column --line-number --no-heading --smart-case --hidden --follow --glob "!.git/*" --color "always" '
          \ . <q-args>, 1, fzf#vim#with_preview(), <bang>0)
  endif

  nn <leader>bb :Buffers<CR>
  nn <Leader>ss :BLines<CR>

  nn <leader>ef :Files<CR>
  nn <leader>ew :Windows<CR>
  nn <leader>eh :History:<CR>
  nn <Leader>em :Marks<CR>
  nn <Leader>C  :Commands<CR>
  nn <Leader>ch :History:<CR>
  nn <Leader>es :Filetypes<CR>

endif
" }}}
