" vim:fileencoding=utf-8

" common {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" You would love this
" Please add `.notags` file into the $HOME dir in order to avoid tags processing
"   in that big dir
Plug 'ludovicchabant/vim-gutentags'
" }}}

" tree-sitter stuff {{{
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'nvim-lua/plenary.nvim'
" Plug 'lewis6991/gitsigns.nvim', {'branch': 'main'}
" Plug 'romgrk/nvim-treesitter-context', { 'branch': 'main' }
" }}}

" themes {{{
Plug 'rktjmp/lush.nvim', {'branch': 'main'}
Plug 'briones-gabriel/darcula-solid.nvim', { 'branch': 'main' }
Plug 'eddyekofo94/gruvbox-flat.nvim'

Plug 'norcalli/nvim-colorizer.lua'
" Plug 'itchyny/lightline.vim'
Plug 'hoob3rt/lualine.nvim'
" Plug 'famiu/feline.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'kyazdani42/nvim-tree.lua'


Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-compe'

" }}}

" -------------------------------
"  EDITORS
" -------------------------------

" Plug 'suxpert/vimcaps'
Plug 'Yggdroot/indentLine'
" Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }
Plug 'dhruvasagar/vim-zoom'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/tagbar'
Plug 'liuchengxu/vim-which-key'
Plug 'pechorin/any-jump.vim'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'ntpeters/vim-better-whitespace'
Plug 'dyng/ctrlsf.vim'
Plug 'kdav5758/HighStr.nvim'
" Plug 'simrat39/symbols-outline.nvim'

" -------------------------------
"  WIKI / WRITING
" -------------------------------

Plug 'godlygeek/tabular'
Plug 'samgriesemer/wiki.vim'
Plug 'samgriesemer/vim-roam'

" -------------------------------
"  EXPLORER
" -------------------------------

Plug 'nvim-telescope/telescope.nvim'
" Plug 'ptzz/lf.vim'
Plug 'mcchrish/nnn.vim'
Plug 'voldikss/vim-floaterm'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

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

" Plug 'lambdalisue/gina.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
" Plug 'junegunn/gv.vim'
" required by fugitive to :Gbrowse
Plug 'shumphrey/fugitive-gitlab.vim'

" }}}
