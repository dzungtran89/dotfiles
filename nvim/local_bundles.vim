" vim:fileencoding=utf-8:foldmethod=marker

" common {{{
Plug 'ThePrimeagen/vim-be-good'
Plug 'lifepillar/vim-colortemplate'

" You would love this
Plug 'ludovicchabant/vim-gutentags'
" }}}

" themes {{{
Plug 'chrisbra/Colorizer'
Plug 'itchyny/lightline.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'edersonferreira/dalton-vim'
Plug 'dzungtran89/photon.vim'
Plug 'lifepillar/vim-gruvbox8'
Plug 'chriskempson/base16-vim'
Plug 'barlog-m/oceanic-primal-vim', { 'branch': 'main' }

" Plug 'andreypopp/vim-colors-plain'
" Plug 'joshdick/onedark.vim'
" Plug 'connorholyday/vim-snazzy'
" Plug 'doums/darcula'
" Plug 'dzungtran89/vim-gruvbox8-mono'
" Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" }}}

" editor {{{

Plug 'tpope/vim-surround'
Plug 'jesseleite/vim-agriculture'
Plug 'ronakg/quickr-preview.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'bignimbus/you-are-here.vim'
Plug 'preservim/tagbar'
Plug 'voldikss/vim-floaterm'
Plug 'liuchengxu/vim-which-key'
Plug 'pechorin/any-jump.vim'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'ntpeters/vim-better-whitespace'
Plug 'dyng/ctrlsf.vim'
Plug 'plasticboy/vim-markdown'
Plug 'yaronkh/vim-winmanip'
" Plug 'jbgutierrez/vim-better-comments'

" Plug 'terryma/vim-multiple-cursors'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

" wiki / writing
Plug 'godlygeek/tabular'
Plug 'junegunn/goyo.vim'

Plug 'ryanoasis/vim-devicons'

" }}}

" explorer {{{

Plug 'mcchrish/nnn.vim'

" Plug 'ptzz/lf.vim'
" for neovim (ranger patched)
" Plug 'rbgrouleff/bclose.vim'
" Plug 'mattn/vim-molder'
" Plug 'mattn/vim-molder-operations'

" editorconfig
Plug 'editorconfig/editorconfig-vim'
" Plug 'chiel92/vim-autoformat'

" snippets
" replaced by coc-snippets
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

" motion {{{

Plug 'easymotion/vim-easymotion'

" tmux
Plug 'christoomey/vim-tmux-navigator'

" }}}

" git {{{

Plug 'junegunn/gv.vim'
Plug 'shumphrey/fugitive-gitlab.vim'
" required by fugitive to :Gbrowse
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
" }}}

" if has('nvim') || has('patch-8.0.902')
"   Plug 'mhinz/vim-signify'
" else
"   Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
" endif

