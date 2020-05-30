" vim:fileencoding=utf-8:foldmethod=marker

" Editor {{{

if has_key(plugs, 'vim-airline')
  let g:airline_disable_statusline = 1
  let g:airline_theme = 'onedark'
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#branch#enabled = 0
  let g:airline#extensions#ale#enabled = 0
  let g:airline#extensions#tabline#enabled = 0
  let g:airline#extensions#tagbar#enabled = 0
  let g:airline_skip_empty_sections = 1
endif

let g:jedi#auto_initialization = 0

let g:python3_host_prog = '/Users/tran/.pyenv/shims/python'

" }}}

" IndentLine {{{
let g:indentLine_char = '.'
let g:indentLine_first_char = '.'
" let g:indentLine_char = ''
" let g:indentLine_first_char = ''
" let g:indentLine_showFirstIndentLevel = 1
" let g:indentLine_setColors = 0
" }}}

" important!!
if has('termguicolors')
  set termguicolors
endif

" for dark version
" set background=light
"
" set contrast
" this configuration option should be placed before `colorscheme gruvbox-material`
" available values: 'hard', 'medium'(default), 'soft'
" let g:gruvbox_material_background = 'hard'

colorscheme gruvbox

" imap jk <Esc>
" imap kk <Esc>

" fzf cool stuff {{{

nmap <Leader>B :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>

nmap <Leader>C :Commands<CR>
nmap <Leader>: :History:<CR>
nmap <Leader>S :Filetypes<CR>

" }}}

noremap <leader>c :bd!<CR>
noremap <leader>w <C-w>
noremap <leader>Z :e!<CR>
noremap <leader>E :e<CR>
noremap <leader>Q :qa!<CR>


" Set working dir to the current file path
nnoremap <leader>dd :cd %:p:h<CR>

" dirvish {{{

" nnoremap <silent> <F2> :Dirvish<CR>
" nnoremap <silent> <F3> :NERDTreeToggle<CR>

" }}}

" Fix slow: insert -> <esc> -> O
" ref: https://github.com/vim/vim/issues/24
" set timeout timeoutlen=5000 ttimeoutlen=100

set nonu
" set relativenumber
nmap <leader>l :set invrelativenumber<CR>

" vimwiki
" let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" search
set noic
nmap <C-N> :cn<CR>
nmap <C-P> :cp<CR>

" vim-agriculture
nmap <leader>/ <plug>RgRawSearch
vmap <leader>/ <plug>RgRawVisualSelection
nmap <leader>* <plug>RgRawWordUnderCursor

" quick preview {{{
" let g:quickr_preview_keymaps = 0
let g:quickr_preview_on_cursor = 1
" let g:quickr_preview_exit_on_enter = 1
" }}}

" Git
noremap <leader>gw :Gbrowse<CR>

" nerdcommenter {{{

if has_key(plugs, 'nerdcommenter')

  " Add spaces after comment delimiters by default
  let g:NERDSpaceDelims = 1

  " Use compact syntax for prettified multi-line comments
  let g:NERDCompactSexyComs = 1

  " Align line-wise comment delimiters flush left instead of following code indentation
  let g:NERDDefaultAlign = 'left'

  " Set a language to use its alternate delimiters by default
  " let g:NERDAltDelims_java = 1

  " Add your own custom formats or override the defaults
  " let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

  " Allow commenting and inverting empty lines (useful when commenting a region)
  let g:NERDCommentEmptyLines = 1

  " Enable trimming of trailing whitespace when uncommenting
  let g:NERDTrimTrailingWhitespace = 1

  " Enable NERDCommenterToggle to check all selected lines is commented or not
  " let g:NERDToggleCheckAllLines = 1
endif

" }}}

" n3 {{{

let $NNN_TRASH=1

" Disable default mappings
let g:nnn#set_default_mappings = 0

" Then set your own
" nnoremap <silent> <leader>nn :NnnPicker<CR>

" Or override
" Start nnn in the current file's directory
nnoremap <leader>n :NnnPicker '%:p:h'<CR>

let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }

" }}}

" {{{ markdown
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

" }}}

" closetag
" replaced by coc-xml
" let g:closetag_filetypes = 'html,xml,phtml'

" Git
let g:fugitive_gitlab_domains = ['https://gitlab.trobz.com']

" Kite
" let g:kite_supported_languages = ['python']

" ultisnips {{{

" let g:UltiSnipsExpandTrigger="<C-f>"
" let g:UltiSnipsJumpForwardTrigger="<C-f>"
" let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" let g:UltiSnipsEditSplit="vertical"

" }}}

" {{{ coc

if has_key(plugs, 'coc.nvim')

  " TextEdit might fail if hidden is not set.
  set hidden

  " Some servers have issues with backup files, see #649.
  set nobackup
  set nowritebackup

  " Give more space for displaying messages.
  set cmdheight=2

  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  " delays and poor user experience.
  " set updatetime=300

  " Don't pass messages to |ins-completion-menu|.
  set shortmess+=c

  " Always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved.
  set signcolumn=yes

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.

  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
  " position. Coc only does snippet and additional edit on confirm.
  " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
  if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
  else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  endif

  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  " xmap <leader>f  <Plug>(coc-format-selected)
  " nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current line.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  " Use CTRL-S for selections ranges.
  " Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format  :call     CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold    :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR      :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Mappings using CoCList:
  " Restart diagnostics.
  nnoremap <silent> <space>r  :<C-u>CocRestart<cr>
  " Show all diagnostics.
  nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions.
  nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  " Show commands.
  nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

  function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
  endfunction

  let g:lightline = {
        \ 'colorscheme': 'palenight',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'cocstatus': 'coc#status',
        \   'currentfunction': 'CocCurrentFunction'
        \ },
        \ }

  let g:lightline.tabline = {
        \   'left': [ ['tabs'] ],
        \   'right': [ ['close'] ]
        \ }

  set showtabline=2  " Show tabline
  set guioptions-=e  " Don't use GUI tabline

endif

" }}}

" coc-snippets {{{

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-l>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-h>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" }}}
