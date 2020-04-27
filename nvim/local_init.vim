" Editor
"
let w:airline_disable_statusline = 1
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#ale#enabled = 0
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tagbar#enabled = 0
let g:airline_skip_empty_sections = 1

" IndentLine {{
let g:indentLine_char = '.'
let g:indentLine_first_char = '.'
" let g:indentLine_char = ''
" let g:indentLine_first_char = ''
" let g:indentLine_showFirstIndentLevel = 1
" let g:indentLine_setColors = 0
" }}

" important!!
if has('termguicolors')
  set termguicolors
endif

" for dark version
" set background=dark
"
" set contrast
" this configuration option should be placed before `colorscheme gruvbox-material`
" available values: 'hard', 'medium'(default), 'soft'
" let g:gruvbox_material_background = 'hard'

colorscheme gruvbox

" this theme has a buildin lightline theme, you can turn it on
let g:lightline = {
  \ 'colorscheme': 'one',
  \ }

imap jk <Esc>
" imap kk <Esc>

" Set working dir to the current file path
nnoremap <leader>dd :cd %:p:h<CR>

" Fix slow: insert -> <esc> -> O
" ref: https://github.com/vim/vim/issues/24
" set timeout timeoutlen=5000 ttimeoutlen=100

set nonu
" set relativenumber
nmap <leader>l :set invrelativenumber<CR>

" search
nmap <C-N> :cn<CR>
nmap <C-P> :cp<CR>

" markdown
let g:vim_markdown_folding_disabled = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
" Add support for markdown files in tagbar.
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '/Users/tran/code/github/markdown2ctags/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes --sro=»',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '»',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }

" closetag
let g:closetag_filetypes = 'html,xml,phtml'

" Git
let g:fugitive_gitlab_domains = ['https://gitlab.trobz.com']
