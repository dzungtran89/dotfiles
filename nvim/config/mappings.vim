" -----------------------------------------------
" Common {{{1
" -----------------------------------------------

"" Map leader/localleader to <space>
let mapleader=" "
let maplocalleader=","

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

" Auto insert dash with the same length of header
" -----------------------------------------------
nnoremap <localleader>u YpVr-<CR>

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

" quick way to search wholeword
nnoremap <localleader>/ /\<\><left><left>

" TL;DR quit faster
nnoremap <leader>qq :qa!<CR>

nnoremap <silent> <leader>]  g<C-]>

" search and replace pattern under the cursor
nnoremap c* *Ncgn

noremap <localleader>c :bd!<CR>
" noremap <leader>w <C-w>
noremap <leader>Q :qa!<CR>

" noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" Set working dir to the current file path
nnoremap <leader>dd :lcd %:p:h<CR>

nmap <silent> <leader>L :set invrelativenumber<CR>

" nmap <C-N> :cn<CR>
" nmap <C-P> :cp<CR>

nmap <leader>vc @:

" Disable Ex mode keybinding
nnoremap Q <Nop>

" noremap <localleader>c :b#<bar>bd#<CR>
noremap <localleader>bd :bd!<CR>
noremap <localleader>be :e!<CR>
noremap <localleader>bq :close<CR>
noremap <localleader>bs :split<CR>
noremap <localleader>bv :vsplit<CR>
nnoremap <silent> <leader>i :set ic!<CR>

" Wrap
nnoremap <localleader>w :set wrap!<CR>


" nmap <silent> <leader>l :set invrelativenumber<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <S-t> :tabnew<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" Set working dir to the current file path
nnoremap <leader>ed :lcd %:p:h<CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" }}}
