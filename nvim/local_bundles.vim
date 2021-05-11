" vim:fileencoding=utf-8

" common {{{
Plug 'xolox/vim-session'
" Plug 'thaerkh/vim-workspace'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" You would love this
" Please add `.notags` file into the $HOME dir in order to avoid tags processing 
"   in that big dir
Plug 'ludovicchabant/vim-gutentags'
" }}}

" themes {{{
Plug 'arcticicestudio/nord-vim'
Plug 'chrisbra/Colorizer'
Plug 'itchyny/lightline.vim'

" Plug 'gruvbox-community/gruvbox'
" Plug 'dzungtran89/photon.vim'
" Plug 'dracula/vim', {'dir': '/Users/tran/.config/nvim/plugged/dracula'}
Plug 'edersonferreira/dalton-vim'
Plug 'mhartington/oceanic-next'

" }}}

" editor {{{

" Plug 'suxpert/vimcaps'
Plug 'tpope/vim-surround'
Plug 'ronakg/quickr-preview.vim'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/tagbar'
Plug 'liuchengxu/vim-which-key'
Plug 'pechorin/any-jump.vim'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'ntpeters/vim-better-whitespace'
Plug 'dyng/ctrlsf.vim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
" Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}

" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

" wiki / writing
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'samgriesemer/wiki.vim'
Plug 'samgriesemer/vim-roam'

" }}}

" explorer {{{

" Plug 'mcchrish/nnn.vim'
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'

" editorconfig
Plug 'editorconfig/editorconfig-vim'
" Plug 'datwaft/bubbly.nvim'

" Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" " snippets
" " replaced by coc-snippets
" Plug 'Jorengarenar/miniSnip'
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'

" Plug 'microsoft/vscode-python'
" Plug 'mstuttgart/vscode-odoo-snippets'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dzungtran89/vim-odoo-snippets'

" }}}
"
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'

" git {{{

Plug 'junegunn/gv.vim'
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
" required by fugitive to :Gbrowse
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

" }}}
