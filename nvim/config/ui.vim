" appearance.vim
" Settings styling vim

" " Color Scheme
set bg=dark

if PlugLoaded('github-nvim-theme')
lua << EOF
require('github-theme').setup({
    themeStyle = 'dark'
})
EOF
endif

if PlugLoaded('nord-vim')
lua << EOF
  local g = vim.g
  g.nord_bold_vertical_split_line = 1
  g.nord_uniform_diff_background = 1
  g.nord_uniform_status_lines = 1
EOF
endif

if PlugLoaded('gruvbox-flat.nvim')
lua << EOF
  local g = vim.g
  -- g.gruvbox_flat_style = "hard"
  -- g.gruvbox_italic_functions = 0
  -- g.gruvbox_italic_keywords = 0
  g.gruvbox_italic_comments = 0
  g.gruvbox_colors = { hint = "orange", error = "#ff0000" }

EOF
endif

colorscheme nord

" Use true colors
set termguicolors

if !has('gui_running')
  set t_Co=256
endif

" don't syntax-highlight long lines
set synmaxcol=200

" Show whitespace
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:·,nbsp:·
" set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:·,nbsp:·,space:·

" Highlight the column after 'textwidth'
set colorcolumn=+1

" Set program title to 'nvim'
set title
setglobal titlestring=nvim

" Show line numbers
set number

" Highlight the current line, don't highlight the current column
set cursorline
set nocursorcolumn

" Always draw gutter for gitgutter, signify, etc.
set signcolumn=yes

" Don't redraw for macros
set lazyredraw
set redrawtime=10000

" Code Folding
" See https://github.com/w0rp/ale/issues/1829
" Don't set foldmethod=syntax
" set foldlevelstart=99

" " Show clipboards and macros
" let g:peekaboo_delay = 500
" let g:peekaboo_compact = 1

augroup windows
  autocmd!
  " Evenly resize windows on terminal screen change.
  autocmd VimResized * :wincmd =
  " Split help windows vertically, on the right.
  autocmd FileType help wincmd L
augroup END

" " Reset the cursor on exit
" " See https://github.com/neovim/neovim/issues/4867#issuecomment-291249173
" " and https://github.com/neovim/neovim/wiki/FAQ#cursor-style-isnt-restored-after-exiting-nvim
" " set guicursor=a:blinkon100
" augroup cursor
"   autocmd!
"   autocmd VimLeave,VimSuspend * set guicursor=a:ver25-blinkon1
" augroup END

