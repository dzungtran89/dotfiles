" Editor {{{

set redrawtime=10000
command! CopyBuffer let @+ = expand('%:p')

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

let g:python3_host_prog = '$VIRTUAL_ENV/bin/python'

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

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

map <C-f> :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>

let g:fzf_tags_command = 'ctags -R --languages=python'

" Border color
let g:fzf_layout = {'up':'~80%', 'window': { 'width': 0.8,
      \'height': 0.8, 'yoffset':0.5, 'xoffset': 0.5,
      \'highlight': 'Todo', 'border': 'sharp'
      \}}

" let $FZF_DEFAULT_OPTS = '--layout=reverse'
" let $FZF_DEFAULT_COMMAND='rg --files -w --hidden --follow --glob "!.git/*"'

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>1)

" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" }}}

noremap <leader>c :bd!<CR>
noremap <leader>w <C-w>
noremap <leader>Z :e!<CR>
noremap <leader>E :e<CR>
noremap <leader>Q :qa!<CR>


" Set working dir to the current file path
nnoremap <leader>dd :lcd %:p:h<CR>

set foldmethod=indent
set nonu
set relativenumber
nmap <leader>l :set invrelativenumber<CR>

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

" vim-agriculture
if has_key(plugs, 'vim-agriculture')

  let g:agriculture#rg_options='--follow'

  nmap <leader>/ <plug>RgRawSearch
  vmap <leader>/ <plug>RgRawVisualSelection
  nmap <leader>* <plug>RgRawWordUnderCursor

endif

" quick preview {{{

let g:quickr_preview_on_cursor = 1

" }}}

" Git
noremap <leader>gw :Gbrowse<CR>

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

if has_key(plugs, 'ultisnips')
  let g:UltiSnipsExpandTrigger="<C-l>"
  let g:UltiSnipsJumpForwardTrigger="<C-f>"
  let g:UltiSnipsJumpBackwardTrigger="<C-b>"
  let g:UltiSnipsEditSplit="vertical"
endif

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

if has_key(plugs, 'LanguageClient-neovim')

  " \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
  " \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
  " \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
  " \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],

  let g:LanguageClient_serverCommands = {
    \ 'python': ['/usr/local/bin/pyls'],
    \ }

  " note that if you are using Plug mapping you should not use `noremap` mappings.
  nmap <F5> <Plug>(lcn-menu)
  " Or map each action separately
  nmap <silent>K <Plug>(lcn-hover)
  nmap <silent>gd <Plug>(lcn-definition)
  nmap <leader>rn <Plug>(lcn-rename)

endif

if has_key(plugs, 'lightline.vim')

  let g:lightline = {
        \ 'colorscheme': 'one',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'readonly', 'modified' ],
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
        \ }

  let g:lightline.tabline = {
        \   'left': [ ['tabs'] ],
        \   'right': []
        \ }

endif

" {{{ coc

if has_key(plugs, 'coc.nvim')

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
  " nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
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
        \   'right': []
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

if has_key(plugs, 'vim-gutentags')

  " set tags+=./.git/tags
  let g:gutentags_add_default_project_roots = 0
  let g:gutentags_project_root = ['.root', 'package.json', '.git']
  " let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')

  command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')

  let g:gutentags_generate_on_new = 0
  let g:gutentags_generate_on_missing = 0
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

  " autocmd BufWritePost *.py,*.js silent! !ctags . &
  nnoremap <silent> <space>e  :Tags<cr>
  nnoremap <silent> <space>o  :BTags<cr>
  nnoremap <silent> <space>t  g<C-]>

  if has_key(plugs, 'gutentags_plus')
    " change focus to quickfix window after search (optional).
    let g:gutentags_plus_switch = 1
  endif

endif

if has_key(plugs, 'spaceline.vim')
  let g:spaceline_seperate_style= 'slant-cons'
  let g:spaceline_line_symbol = 0
endif

" ack.vim --- {{{

" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
" let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>a :Ack!<Space>
" }}}
"
set ignorecase

if has_key(plugs, 'markdown-preview.nvim')

  " set to 1, nvim will open the preview window after entering the markdown buffer
  " default: 0
  let g:mkdp_auto_start = 0

  " set to 1, the nvim will auto close current preview window when change
  " from markdown buffer to another buffer
  " default: 1
  let g:mkdp_auto_close = 1

  " set to 1, the vim will refresh markdown when save the buffer or
  " leave from insert mode, default 0 is auto refresh markdown as you edit or
  " move the cursor
  " default: 0
  let g:mkdp_refresh_slow = 1

  " set to 1, the MarkdownPreview command can be use for all files,
  " by default it can be use in markdown file
  " default: 0
  let g:mkdp_command_for_global = 0

  " set to 1, preview server available to others in your network
  " by default, the server listens on localhost (127.0.0.1)
  " default: 0
  let g:mkdp_open_to_the_world = 0

  " use custom IP to open preview page
  " useful when you work in remote vim and preview on local browser
  " more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
  " default empty
  let g:mkdp_open_ip = ''

  " specify browser to open preview page
  " default: ''
  let g:mkdp_browser = ''

  " set to 1, echo preview page url in command line when open preview page
  " default is 0
  let g:mkdp_echo_preview_url = 0

  " a custom vim function name to open preview page
  " this function will receive url as param
  " default is empty
  let g:mkdp_browserfunc = ''

  " options for markdown render
  " mkit: markdown-it options for render
  " katex: katex options for math
  " uml: markdown-it-plantuml options
  " maid: mermaid options
  " disable_sync_scroll: if disable sync scroll, default 0
  " sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
  "   middle: mean the cursor position alway show at the middle of the preview page
  "   top: mean the vim top viewport alway show at the top of the preview page
  "   relative: mean the cursor position alway show at the relative positon of the preview page
  " hide_yaml_meta: if hide yaml metadata, default is 1
  " sequence_diagrams: js-sequence-diagrams options
  " content_editable: if enable content editable for preview page, default: v:false
  let g:mkdp_preview_options = {
        \ 'mkit': {},
        \ 'katex': {},
        \ 'uml': {},
        \ 'maid': {},
        \ 'disable_sync_scroll': 1,
        \ 'sync_scroll_type': 'middle',
        \ 'hide_yaml_meta': 1,
        \ 'sequence_diagrams': {},
        \ 'flowchart_diagrams': {},
        \ 'content_editable': v:false
        \ }

  " use a custom markdown style must be absolute path
  " like '/Users/username/markdown.css' or expand('~/markdown.css')
  let g:mkdp_markdown_css = ''

  " use a custom highlight style must absolute path
  " like '/Users/username/highlight.css' or expand('~/highlight.css')
  let g:mkdp_highlight_css = ''

  " use a custom port to start server or random for empty
  let g:mkdp_port = ''

  " preview page title
  " ${name} will be replace with the file name
  let g:mkdp_page_title = '「${name}」'

endif

if has_key(plugs, 'vim-vsnip')

  if has_key(plugs, 'deoplete.nvim')
    let g:deoplete#enable_at_startup = 1
  endif

  " Expand
  imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
  smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

  " Expand or jump
  imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
  smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

  " Jump forward or backward
  imap <expr> <C-n>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
  smap <expr> <C-n>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
  imap <expr> <C-p>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
  smap <expr> <C-p>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

  " Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
  " See https://github.com/hrsh7th/vim-vsnip/pull/50
  nmap        <C-l>   <Plug>(vsnip-select-text)
  xmap        <C-l>   <Plug>(vsnip-select-text)
  smap        <C-l>   <Plug>(vsnip-select-text)
  nmap        <C-j>   <Plug>(vsnip-cut-text)
  xmap        <C-j>   <Plug>(vsnip-cut-text)
  smap        <C-j>   <Plug>(vsnip-cut-text)

" elseif has_key(plugs, 'deoplete.nvim')

"   let g:deoplete#enable_at_startup = 1

  " " deoplete tab-complete
  " inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

  " imap <C-l>     <Plug>(neosnippet_expand_or_jump)
  " smap <C-l>     <Plug>(neosnippet_expand_or_jump)
  " xmap <C-l>     <Plug>(neosnippet_expand_target)

  "function! s:check_back_space() abort "{{{
  "  let col = col('.') - 1
  "  return !col || getline('.')[col - 1]  =~ '\s'
  "endfunction
  ""}}}

  " inoremap <silent><expr> <TAB>
  "       \ pumvisible() ? "\<C-n>" :
  "       \ <SID>check_back_space() ? "\<TAB>" :
  "       \ deoplete#manual_complete()

  "  " SuperTab like snippets behavior.
  "  " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
  "  imap <expr><TAB>
  "   \ pumvisible() ? "\<C-n>" :
  "   \ neosnippet#expandable_or_jumpable() ?
  "   \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  "  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  "        \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  " " For conceal markers.
  " if has('conceal')
  "   set conceallevel=2 concealcursor=niv
  " endif

else

  " coc-snippets {{{

  " Use <C-l> for trigger snippet expand.
  imap <C-l> <Plug>(coc-snippets-expand)

  " Use <C-j> for select text for visual placeholder of snippet.
  vmap <C-j> <Plug>(coc-snippets-select)

  " Use <C-j> for jump to next placeholder, it's default of coc.nvim
  let g:coc_snippet_next = '<c-j>'

  " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
  let g:coc_snippet_prev = '<c-k>'

  " Use <C-j> for both expand and jump (make expand higher priority.)
  imap <C-l> <Plug>(coc-snippets-expand-jump)

  " }}}

endif

if has_key(plugs, 'you-are-here.vim')
  " Add a map of your choice.  I prefer to  use
  " <leader>here.  My leader key is set to the
  " backslash (\), so by typing \here in normal
  " mode, I activate you-are-here.vim. Pressing
  " <ESC> will close the popups.

  nnoremap <silent> <leader>here :call you_are_here#YouAreHere()<CR>

  " top, right, bottom, left border in popups
  let g:youarehere_border = [1, 1, 1, 1]

  " top, right, bottom, left padding in popups
  let g:youarehere_padding = [1, 1, 1, 1]

  " g:content is passed to expand to render the filename.
  " see :help expand for more options
  let g:content = "%"
endif
