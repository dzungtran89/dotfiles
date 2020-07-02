"
" Common
Plug 'ThePrimeagen/vim-be-good'

" Themes
Plug 'drewtempelmeyer/palenight.vim'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'junegunn/limelight.vim'
" Plug 'NLKNguyen/papercolor-theme'
Plug 'lifepillar/vim-gruvbox8'

" Editor
Plug 'tpope/vim-surround'
Plug 'jesseleite/vim-agriculture'
Plug 'ronakg/quickr-preview.vim'
'
" Plug 'mhinz/vim-startify'
" Plug 'lervag/vimtex'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" explorer
" Plug 'wvanlint/twf'
Plug 'mcchrish/nnn.vim'
Plug 'sinetoami/fzy.nvim'
Plug 'srstevenson/vim-picker'

if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" editorconfig
Plug 'editorconfig/editorconfig-vim'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/gutentags_plus'

" snippets
" replaced by coc-snippets
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dzungtran89/vim-odoo-snippets'

" motion
Plug 'easymotion/vim-easymotion'
" Plug 'justinmk/vim-sneak'

" js
" Plug 'ternjs/tern_for_vim'
" Plug 'Quramy/tsuquyomi'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

" wiki / writing
" Plug 'vimwiki/vimwiki'
" Plug 'jceb/vim-orgmode'
" Plug 'tpope/vim-speeddating'
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular'
Plug 'junegunn/goyo.vim'

" Git
Plug 'junegunn/gv.vim'
Plug 'will133/vim-dirdiff'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-rhubarb'

