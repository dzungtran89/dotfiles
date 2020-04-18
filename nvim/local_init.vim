" Editor
"

let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1

silent! colorscheme gruvbox
imap jj <Esc>
imap kk <Esc>

" Set working dir to the current file path
nnoremap <leader>dd :cd %:p:h<CR>

" Fix slow: insert -> <esc> -> O
" ref: https://github.com/vim/vim/issues/24

" set timeout timeoutlen=5000 ttimeoutlen=100

" set nonu
" set relativenumber
nmap <leader>l :set invrelativenumber<CR>

" search
nmap <C-N> :cn<CR>
nmap <C-P> :cp<CR>

" markdown
let g:vim_markdown_folding_disabled = 0
let g:vim_markdown_conceal = 1
let g:vim_markdown_conceal_code_blocks = 0

" closetag
let g:closetag_filetypes = 'html,xml,phtml'

