" vim:fileencoding=utf-8

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'shumphrey/fugitive-gitlab.vim'
" Plug 'vim-scripts/grep.vim'
" Plug 'vim-scripts/CSApprox'
" Plug 'Raimondi/delimitMate'
Plug 'preservim/tagbar'
Plug 'dense-analysis/ale'
Plug 'editor-bootstrap/vim-bootstrap-updater'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse

let g:polyglot_disabled = []
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
  Plug 'pbogut/fzf-mru.vim'
endif

let g:make = 'gmake'
if exists('make')
  let g:make = 'make'
endif

Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

"" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dzungtran89/vim-odoo-snippets'

" javascript
"" Javascript Bundle
" Plug 'jelera/vim-javascript-syntax'

" python
"" Python Bundle
" Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" vuejs
Plug 'posva/vim-vue'
Plug 'leafOfTree/vim-vue-plugin'

" Addons
Plug 'raimon49/requirements.txt.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'Yggdroot/indentLine'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'dhruvasagar/vim-zoom'
Plug 'easymotion/vim-easymotion'
Plug 'andymass/vim-matchup'

Plug 'pechorin/any-jump.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'godlygeek/tabular'
Plug 'samgriesemer/wiki.vim'
Plug 'samgriesemer/vim-roam'

" Plug 'nvim-lua/plenary.nvim'
" Plug 'vhyrro/neorg'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'itchyny/lightline.vim'
" Plug 'crispgm/nvim-tabline'
" Plug 'hoob3rt/lualine.nvim'
Plug 'alvarosevilla95/luatab.nvim'

Plug 'christoomey/vim-tmux-navigator'
Plug 'liuchengxu/vim-which-key'

Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'

Plug 'rafi/awesome-vim-colorschemes'
Plug 'vhyrro/neorg' | Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim' | Plug 'nvim-lua/popup.nvim'
Plug 'mfussenegger/nvim-dap'
