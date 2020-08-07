
" Common
Plug 'ThePrimeagen/vim-be-good'
Plug 'mileszs/ack.vim'

" You would love this
Plug 'ludovicchabant/vim-gutentags'
" Plug 'zackhsi/fzf-tags'
" Plug 'kien/ctrlp.vim'

" Themes
Plug 'drewtempelmeyer/palenight.vim'
Plug 'itchyny/lightline.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'hardcoreplayers/oceanic-material'

" Plug 'junegunn/limelight.vim'
" Plug 'joshdick/onedark.vim'
" Plug 'dracula/vim'
" Plug 'skbolton/embark'
" Plug 'chaoren/vim-wordmotion'

" Editor
Plug 'tpope/vim-surround'
Plug 'jesseleite/vim-agriculture'
Plug 'ronakg/quickr-preview.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" explorer
Plug 'mcchrish/nnn.vim'
" Plug 'sinetoami/fzy.nvim'
" Plug 'srstevenson/vim-picker'

if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" snippets
" replaced by coc-snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dzungtran89/vim-odoo-snippets'

" motion
Plug 'easymotion/vim-easymotion'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

" wiki / writing
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular'
Plug 'junegunn/goyo.vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'will133/vim-dirdiff'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse

Plug 'ryanoasis/vim-devicons'
" Plug 'hardcoreplayers/spaceline.vim'
" Plug 'tyru/caw.vim'

" Plug 'neovim/nvim-lsp'
