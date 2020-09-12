" nnoremap <leader>. :call fzf#vim#tags('^' . expand('<cword>'), {'options': '--exact --select-1 --exit-0 +i'})<CR>

set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND='ag -w -f --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND='rg --files -w --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find
        \call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case -w --hidden --follow --glob "!.git/*" --color=always '.shellescape(<q-args>).'| tr -d "\017"',
        \1, <bang>0)
endif

" fzf cool stuff {{{

" let g:fzf_preview_window = 'up:60%'
let g:fzf_preview_window = ''

nmap <Leader>B :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>

nmap <Leader>C :Commands<CR>
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
let g:fzf_tags_command = 'ctags -R --languages=python'

" Border color
" let g:fzf_layout = {'up':'~80%', 'window': { 'width': 0.8,
"       \'height': 0.8, 'yoffset':0.5, 'xoffset': 0.5,
"       \'highlight': 'Todo', 'border': 'sharp'
"       \}}

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
  let command_fmt = 'rg --column --line-number --no-heading --smart-case %s || true'
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

if has_key(plugs, 'vim-agriculture')

  " Search symlinks recursively
  let g:agriculture#rg_options='--follow --smart-case'

  nmap <leader>/  <Plug>RgRawSearch
  nmap <leader>fp <Plug>RgRawSearch-tpy
  nmap <leader>fj <Plug>RgRawSearch-tjs
  nmap <leader>fv <Plug>RgRawSearch-tvim
  nmap <leader>fx <Plug>RgRawSearch-txml

  " vmap <leader>/ <Plug>RgRawVisualSelection
  nmap <leader>* <Plug>RgRawWordUnderCursor

endif

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>
nmap <leader>y :History:<CR>

if has_key(plugs, 'denite.nvim')

  " Define mappings
  autocmd FileType denite call s:denite_my_settings()
  function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
          \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d
          \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
          \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> <C-v>
          \ denite#do_map('do_action', 'vsplit')
    nnoremap <silent><buffer><expr> <C-x>
          \ denite#do_map('do_action', 'split')
    nnoremap <silent><buffer><expr> q
          \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
          \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
          \ denite#do_map('toggle_select').'j'
  endfunction

  call denite#custom#var('file/rec', 'command', ['rg', '-w', '--hidden', '--follow', '--column', '--line-number', '-g', ''])
  call denite#custom#option('default', 'prompt', 'λ')
  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])
  call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
        \ [ '.git/', '.ropeproject/', '__pycache__/*', '*.pyc', 'node_modules/',
        \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/', '*.png'])

  nnoremap <localleader>dp :Denite -start-filter file/rec<CR>
  nnoremap <localleader>db :Denite buffer<CR>
  nnoremap \ :Denite grep<CR>

endif

if has_key(plugs, 'FlyGrep.vim')
  nnoremap <localleader>s/ :FlyGrep<cr>
endif