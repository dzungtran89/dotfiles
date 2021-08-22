" vim:fileencoding=utf-8

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
" Plug 'rstacruz/vim-closer'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
Plug 'airblade/vim-gitgutter'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'preservim/tagbar'
Plug 'dense-analysis/ale'
Plug 'editor-bootstrap/vim-bootstrap-updater'
Plug 'Konfekt/FastFold'

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

" " vuejs
" Plug 'posva/vim-vue'
" Plug 'leafOfTree/vim-vue-plugin'

" Addons
Plug 'editorconfig/editorconfig-vim'
Plug 'Yggdroot/indentLine'
Plug 'jeetsukumaran/vim-indentwise'
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

Plug 'norcalli/nvim-colorizer.lua'
Plug 'hoob3rt/lualine.nvim'

Plug 'numToStr/Navigator.nvim'
Plug 'liuchengxu/vim-which-key'

Plug 'voldikss/vim-floaterm'
Plug 'vimlab/split-term.vim'

Plug 'vhyrro/neorg'

" Debugging {{{
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
" }}}

" For fun {{{

Plug 'kyazdani42/nvim-web-devicons'
Plug 'tweekmonster/startuptime.vim'
Plug 'lukas-reineke/format.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Plug 'pwntester/octo.nvim'
Plug 'alec-gibson/nvim-tetris'

" }}}
