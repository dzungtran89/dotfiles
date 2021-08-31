" vim:fileencoding=utf-8

" CORE {{{
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'                    " required by fugitive to :Gbrowse
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'preservim/tagbar'
Plug 'dense-analysis/ale'
Plug 'editor-bootstrap/vim-bootstrap-updater'
Plug 'Jorengarenar/fauxClip'

" RIP {{{

" Plug 'airblade/vim-gitgutter'
" Plug 'rstacruz/vim-closer'
" Plug 'liuchengxu/vim-which-key'

let g:polyglot_disabled = []
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'

"" SNIPPETS {{{
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dzungtran89/vim-odoo-snippets'

" NOTE-TAKING {{{
Plug 'godlygeek/tabular'
Plug 'samgriesemer/wiki.vim'
Plug 'samgriesemer/vim-roam'
Plug 'kristijanhusak/orgmode.nvim'
Plug 'akinsho/org-bullets.nvim'

" SEARCHING {{{
Plug 'pechorin/any-jump.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'brooth/far.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'

" MISC {{{
Plug 'Konfekt/FastFold'
Plug 'Jorengarenar/vim-syntaxMarkerFold'
Plug 'editorconfig/editorconfig-vim'
Plug 'Yggdroot/indentLine'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'easymotion/vim-easymotion'
Plug 'andymass/vim-matchup'
Plug 'numToStr/Navigator.nvim'
Plug 'folke/which-key.nvim'
Plug 'vimlab/split-term.vim'
Plug 'voldikss/vim-floaterm'

Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

" DEBUGGING {{{
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

" FOR FUN {{{

Plug 'hoob3rt/lualine.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'monaqa/dial.nvim'
Plug 'tweekmonster/startuptime.vim'

" Plug 'kyazdani42/nvim-web-devicons'
" Plug 'lukas-reineke/format.nvim'

" Required plenary
" Plug 'nvim-telescope/telescope.nvim'              
" Plug 'alec-gibson/nvim-tetris'

" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" LATER {{{
" Plug 'posva/vim-vue'
" Plug 'leafOfTree/vim-vue-plugin'
" Plug 'mattn/emmet-vim'
" Plug 'ggandor/lightspeed.nvim'                  " easymotion alternative
" Plug 'pwntester/octo.nvim'                      " github actions
" Plug 'SmiteshP/nvim-gps'                        " tagbar alternative
