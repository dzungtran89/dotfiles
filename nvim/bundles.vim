" vim:fileencoding=utf-8

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
Plug 'airblade/vim-gitgutter'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'preservim/tagbar'
Plug 'dense-analysis/ale'
Plug 'editor-bootstrap/vim-bootstrap-updater'

let g:polyglot_disabled = []
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'

let g:make = 'gmake'
if exists('make')
  let g:make = 'make'
endif

Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dzungtran89/vim-odoo-snippets'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" vuejs
Plug 'posva/vim-vue'
Plug 'leafOfTree/vim-vue-plugin'

" Addons
Plug 'editorconfig/editorconfig-vim'
Plug 'Yggdroot/indentLine'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'dhruvasagar/vim-zoom'
Plug 'easymotion/vim-easymotion'
Plug 'andymass/vim-matchup'

Plug 'pechorin/any-jump.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'brooth/far.vim'
Plug 'godlygeek/tabular'
Plug 'samgriesemer/wiki.vim'
Plug 'samgriesemer/vim-roam'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'itchyny/lightline.vim'
" Plug 'crispgm/nvim-tabline'
" Plug 'hoob3rt/lualine.nvim'

Plug 'numToStr/Navigator.nvim'
Plug 'liuchengxu/vim-which-key'

Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'vimlab/split-term.vim'

Plug 'rafi/awesome-vim-colorschemes'
Plug 'vhyrro/neorg'
Plug 'mfussenegger/nvim-dap'
Plug 'tweekmonster/startuptime.vim'
" Plug 'nvim-telescope/telescope.nvim'

" Plug 'L3MON4D3/LuaSnip'
" Plug 'hrsh7th/nvim-compe'
" Plug 'neovim/nvim-lspconfig'
