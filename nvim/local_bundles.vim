" vim:fileencoding=utf-8

" -------------------------------
" LIBRARIES
" -------------------------------
Plug 'sheerun/vim-polyglot'
" Plug 'Shougo/vimproc.vim', {'do': g:make}
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'

Plug 'junegunn/' . 'fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/' . 'fzf.vim'
Plug 'pbogut/'   . 'fzf-mru.vim'

" Add `.notags` file into the $HOME dir
" in order to avoid tags processing in that big dir
" Plug 'ludovicchabant/vim-gutentags'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" -------------------------------
" TELESCOPE
" -------------------------------
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-frecency.nvim'

" -------------------------------
" TREESITTER
" -------------------------------
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" -------------------------------
" EDITORS
" -------------------------------
Plug 'raimon49/requirements.txt.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'master'}
Plug 'jeetsukumaran/vim-indentwise'
" Plug 'ntpeters/vim-better-whitespace'
Plug 'jiangmiao/auto-pairs'
Plug 'dhruvasagar/vim-zoom'
" Plug 'kdav5758/HighStr.nvim'
Plug 'easymotion/vim-easymotion'

Plug 'preservim/tagbar'
Plug 'pechorin/any-jump.vim'
Plug 'dyng/ctrlsf.vim'

" -------------------------------
"  WIKI / WRITING
" -------------------------------
Plug 'godlygeek/tabular'
Plug 'samgriesemer/wiki.vim'
Plug 'samgriesemer/vim-roam'
Plug 'vhyrro/neorg'

" -------------------------------
" SNIPPETS
" -------------------------------
Plug 'SirVer/ultisnips'
Plug 'dzungtran89/vim-odoo-snippets'
" Plug 'akretion/vim-odoo-snippets'
" Plug 'honza/vim-snippets'

" -------------------------------
"  TOOLS
" -------------------------------
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
" Plug 'junegunn/gv.vim'
" required by fugitive to :Gbrowse
Plug 'shumphrey/fugitive-gitlab.vim'

" -------------------------------
" LSP
" -------------------------------
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'

" -------------------------------
" VISUAL
" -------------------------------
Plug 'crispgm/nvim-tabline'
Plug 'norcalli/nvim-colorizer.lua'

" Plug 'rktjmp/lush.nvim'
" Plug 'eddyekofo94/gruvbox-flat.nvim'
Plug 'arcticicestudio/nord-vim'
" Plug 'projekt0n/github-nvim-theme'
" Plug 'itchyny/lightline.vim'
" Plug 'famiu/feline.nvim'
Plug 'hoob3rt/lualine.nvim'

" -------------------------------
" MISC
" -------------------------------
" Plug 'preservim/nerdtree'
" Plug 'kyazdani42/nvim-tree.lua'
Plug 'ptzz/lf.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

Plug 'christoomey/vim-tmux-navigator'
Plug 'liuchengxu/vim-which-key'

Plug 'voldikss/vim-floaterm'
Plug 'svermeulen/vimpeccable'
