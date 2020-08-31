" vim: set ft=vim fdm=marker

" Mappings {{{

imap jk <Esc>

noremap <leader>c :bd!<CR>
noremap <leader>w <C-w>
noremap <leader>Q :qa!<CR>

" Set working dir to the current file path
nnoremap <leader>dd :lcd %:p:h<CR>

nmap <leader>l :set invrelativenumber<CR>

nmap <C-N> :cn<CR>
nmap <C-P> :cp<CR>

nmap <leader>vc @:

" vmux (evolution of vim + tmux)
" Prompt for a command to run
map <leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <leader>vl :VimuxRunLastCommand<CR>

" }}}

" Editor {{{

" Disable Bclose mappings
let g:no_plugin_maps = 1

set redrawtime=10000
set cursorline
set history=500

command! CopyBuffer let @+ = expand('%:p')

" important!!
if has('termguicolors')
  set termguicolors
endif

" set background=light
colorscheme photon

" git

" function! StatuslineGitBranch()
"   let b:gitbranch=""
"   if &modifiable
"     lcd %:p:h
"     let l:gitrevparse=system("git rev-parse --abbrev-ref HEAD")
"     lcd -
"     if l:gitrevparse!~"fatal: not a git repository"
"       let b:gitbranch="(".substitute(l:gitrevparse, '\n', '', 'g').")"
"     endif
"   endif
" endfunction

" augroup GetGitBranch
"   autocmd!
"   autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
" augroup END

" nnoremap <silent> <localleader>s :w<CR>

" if has_key(plugs, 'tagbar')
"   nmap <localleader>t :TagbarCurrentTag<CR>
" endif

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

set foldmethod=manual
set nonu
" set relativenumber

" search
set ignorecase

" fold
" nmap <leader>fo zO
" nmap <leader>fc zC
" nmap <leader>fa za
" nmap <leader>fm zm

" quick preview {{{

let g:quickr_preview_on_cursor = 1

" }}}

" closetag
" replaced by coc-xml
" let g:closetag_filetypes = 'html,xml,phtml'

" ultisnips {{{

if has_key(plugs, 'ultisnips')
  let g:UltiSnipsExpandTrigger="<C-l>"
  let g:UltiSnipsJumpForwardTrigger="<C-f>"
  let g:UltiSnipsJumpBackwardTrigger="<C-b>"
  let g:UltiSnipsEditSplit="vertical"
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

if has_key(plugs, 'ack.vim')

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

endif

if has_key(plugs, 'you-are-here.vim')

  " Add a map of your choice.  I prefer to  use
  " <leader>here.  My leader key is set to the
  " backslash (\), so by typing \here in normal
  " mode, I activate you-are-here.vim. Pressing
  " <ESC> will close the popups.

  " top, right, bottom, left border in popups
  let g:youarehere_border = [1, 1, 1, 1]

  " top, right, bottom, left padding in popups
  let g:youarehere_padding = [1, 1, 1, 1]

  " g:content is passed to expand to render the filename.
  " see :help expand for more options
  let g:content = "%"

  nnoremap <silent> <leader>here :call you_are_here#YouAreHere()<CR>

endif

if has_key(plugs, 'incsearch.vim')

  set hlsearch
  let g:incsearch#auto_nohlsearch = 1

  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)

  map n  <Plug>(incsearch-nohl-n)
  map N  <Plug>(incsearch-nohl-N)
  map *  <Plug>(incsearch-nohl-*)
  map #  <Plug>(incsearch-nohl-#)
  map g* <Plug>(incsearch-nohl-g*)
  map g# <Plug>(incsearch-nohl-g#)

endif

" Personal plugins

source $HOME/.config/nvim/plugin/explorer.vim
source $HOME/.config/nvim/plugin/search.vim
source $HOME/.config/nvim/plugin/coc.vim
source $HOME/.config/nvim/plugin/git.vim
source $HOME/.config/nvim/plugin/gutentags.vim
source $HOME/.config/nvim/plugin/snips.vim
source $HOME/.config/nvim/plugin/md.vim
source $HOME/.config/nvim/plugin/jump.vim
source $HOME/.config/nvim/plugin/wiki.vim

source $HOME/.config/nvim/plugin/statusline.vim
source $HOME/.config/nvim/plugin/floaterm.vim
source $HOME/.config/nvim/plugin/whichkey.vim
source $HOME/.config/nvim/plugin/keys.vim
