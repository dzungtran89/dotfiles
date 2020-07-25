" vim:fileencoding=utf-8

" Editor {{{

if has_key(plugs, 'vim-wordmotion')
  " example
  " foo_bar-baz.qux
  "
  " CamelCaseACRONYMWords_underscore1234
  " w--------------------------------->w
  " e--------------------------------->e
  " b<---------------------------------b
  "
  " With this plugin, this becomes six words:
  "
  " CamelCaseACRONYMWords_underscore1234
  " w--->w-->w----->w---->w-------->w->w
  " e-->e-->e----->e--->e--------->e-->e
  " b<---b<--b<-----b<----b<--------b<-b

  let g:wordmotion_spaces = '_-.'
  let g:wordmotion_mappings = {
        \ 'w' : '<M-w>',
        \ 'b' : '<M-b>',
        \ 'e' : '<M-e>',
        \ 'ge' : 'g<M-e>',
        \ 'aw' : 'a<M-w>',
        \ 'iw' : 'i<M-w>',
        \ '<C-R><C-W>' : '<C-R><M-w>'
        \ }
endif

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
nnoremap <leader>dd :lcd %:p:h<CR>

set foldmethod=syntax
set nonu
" set relativenumber
nmap <leader>l :set invrelativenumber<CR>

" vimwiki
" let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" search
set noic
nmap <C-N> :cn<CR>
nmap <C-P> :cp<CR>

nmap <leader>vc @:

" fold
" nmap <leader>fo zO
" nmap <leader>fc zC
" nmap <leader>fa za
" nmap <leader>fm zm

" vmux (evolution of vim + tmux)
" Prompt for a command to run
map <leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <leader>vl :VimuxRunLastCommand<CR>
" " Zoom the tmux runner pane
" map <leader>vz :VimuxZoomRunner<CR>
" " Inspect runner pane
" map <leader>vi :VimuxInspectRunner<CR>

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

" explorer {{{

" nnn

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
"
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

" ultisnips {{{

" let g:UltiSnipsExpandTrigger="<C-f>"
" let g:UltiSnipsJumpForwardTrigger="<C-f>"
" let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" let g:UltiSnipsEditSplit="vertical"

" }}}

" vista {{{
"
if has_key(plugs, 'vista.vim')

  " How each level is indented and what to prepend.
  " This could make the display more compact or more spacious.
  " e.g., more compact: ["▸ ", ""]
  " Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
  let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

  " Executive used when opening vista sidebar without specifying it.
  " See all the avaliable executives via `:echo g:vista#executives`.
  let g:vista_default_executive = 'ctags'

  " To enable fzf's preview window set g:vista_fzf_preview.
  " The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
  " For example:
  let g:vista_fzf_preview = ['right:50%']

  " Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
  let g:vista#renderer#enable_icon = 1

  " The default icons can't be suitable for all the filetypes, you can extend it as you wish.
  let g:vista#renderer#icons = {
        \   "function": "\uf794",
        \   "variable": "\uf71b",
        \  }

endif

" }}}

if has_key(plugs, 'editorconfig-vim')
  let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
endif

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
  " autocmd CursorHold * silent call CocActionAsync('highlight')

  " Auto refresh git gutter
  autocmd CursorHold * CocCommand git.refresh

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

  " function! LightlineFilename()
  "   let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  "   let modified = &modified ? ' +' : ''
  "   return filename . modified
  " endfunction

  if has_key(plugs, 'vista.vim')

    function! NearestMethodOrFunction() abort
      return get(b:, 'vista_nearest_method_or_function', '')
    endfunction

    " By default vista.vim never run if you don't call it explicitly.
    "
    " If you want to show the nearest function in your statusline automatically,
    " you can add the following line to your vimrc
    " autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

  endif

  if has_key(plugs, 'vista.vim')
    function! NearestMethodOrFunction() abort
      return get(b:, 'vista_nearest_method_or_function', '')
    endfunction

    set statusline+=%{NearestMethodOrFunction()}

    " By default vista.vim never run if you don't call it explicitly.
    "
    " If you want to show the nearest function in your statusline automatically,
    " you can add the following line to your vimrc
    autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
  endif

  "
  let g:lightline = {
        \ 'colorscheme': 'one',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'cocstatus', 'currentfunction', 'readonly', 'modified' ],
        \             [ 'tagbar' ],
        \ ]},
        \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
        \ 'component': {
        \   'lineinfo': '%3l:%-2v%<',
        \   'tagbar': '%{tagbar#currenttag("%s", "", "f")}',
        \ },
        \ 'component_function': {
        \   'cocstatus': 'coc#status',
        \   'currentfunction': 'CocCurrentFunction',
        \ },
        \ }

  let g:lightline.tabline = {
        \   'left': [ ['tabs'] ],
        \   'right': [ ['close'] ]
        \ }

  " let g:tagbar_status_func = 'TagbarStatusFunc'
  " function! TagbarStatusFunc(current, sort, fname, ...) abort
  "   let g:lightline.fname = a:fname
  "   return lightline#statusline(0)
  " endfunction

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

if has_key(plugs, 'fzy.nvim')
  nnoremap <leader>fu :Fzy<CR>
endif

if has_key(plugs, 'vim-picker')

  nmap <unique> <leader>pe <Plug>(PickerEdit)
  nmap <unique> <leader>ps <Plug>(PickerSplit)
  nmap <unique> <leader>pt <Plug>(PickerTabedit)
  nmap <unique> <leader>pv <Plug>(PickerVsplit)
  nmap <unique> <leader>pb <Plug>(PickerBuffer)
  nmap <unique> <leader>p] <Plug>(PickerTag)
  nmap <unique> <leader>pw <Plug>(PickerStag)
  nmap <unique> <leader>po <Plug>(PickerBufferTag)
  nmap <unique> <leader>ph <Plug>(PickerHelp)

  "" This is the default g:fzy_command_command
  " let g:fzy_default_command = {
  "       \ 'path': 'rg',
  "       \ 'ignores': ['*.git'],
  "       \ 'options': [
  "       \ '--files', '--hidden', '--smart-case',
  "       \ '--color=never', '--fixed-strings'
  "       \ ] }

  "" Default options can be ovirride by new ones just doing this:
  " let g:fzy_default_command = {
  "       \ 'options': '--files --hidden'
  "       \ }

  "" Or define the source to ignores nothing:
  " let g:fzy_default_command = { 'ignores': [] }

  "" Or you can override the entiry source to uses ag:
  " let g:fzy_default_command = {
  "       \ 'path': 'ag',
  "       \ 'ignores': ['.git', 'node_modules'],
  "       \ 'options': '--hidden --smart-case'
  "       \ }

  "" Default fzy layout
  "" - Just above / below
  let g:fzy_layout = { 'below': '~40%' }

endif

if has_key(plugs, 'vim-gutentags')

  set tags+=./.git/tags
  let g:gutentags_add_default_project_roots = 0
  let g:gutentags_project_root = ['.root', 'package.json', '.git']
  let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')

  command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')

  let g:gutentags_generate_on_new = 1
  let g:gutentags_generate_on_missing = 1
  let g:gutentags_generate_on_write = 1
  let g:gutentags_generate_on_empty_buffer = 0

  let g:gutentags_ctags_extra_args = [
      \ '--tag-relative=yes',
      \ '--fields=+ailmnS',
      \ ]

  let g:gutentags_ctags_exclude = [
        \ '*.git', '*.svg', '*.hg',
        \ '*/tests/*',
        \ 'build',
        \ 'dist',
        \ '*sites/*/files/*',
        \ 'bin',
        \ 'node_modules',
        \ 'bower_components',
        \ 'cache',
        \ 'compiled',
        \ 'docs',
        \ 'example',
        \ 'bundle',
        \ 'vendor',
        \ '*.md',
        \ '*-lock.json',
        \ '*.lock',
        \ '*bundle*.js',
        \ '*build*.js',
        \ '.*rc*',
        \ '*.json',
        \ '*.min.*',
        \ '*.map',
        \ '*.bak',
        \ '*.zip',
        \ '*.pyc',
        \ '*.class',
        \ '*.sln',
        \ '*.Master',
        \ '*.csproj',
        \ '*.tmp',
        \ '*.csproj.user',
        \ '*.cache',
        \ '*.pdb',
        \ 'tags*',
        \ 'cscope.*',
        \ '*.css',
        \ '*.less',
        \ '*.scss',
        \ '*.exe', '*.dll',
        \ '*.mp3', '*.ogg', '*.flac',
        \ '*.swp', '*.swo',
        \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
        \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
        \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
        \ 'log',
        \ ]

  if has_key(plugs, 'gutentags_plus')
    " change focus to quickfix window after search (optional).
    let g:gutentags_plus_switch = 1
  endif

endif

if has_key(plugs, 'spaceline.vim')
  let g:spaceline_seperate_style= 'slant-cons'
  let g:spaceline_line_symbol = 0
endif

