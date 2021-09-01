" -----------------------------------------------
" FZF
" -----------------------------------------------

nnoremap <Leader>ef :FZF -m<CR>
nnoremap <Leader>bb :Buffers<CR>
nnoremap <leader>bo :BTags<CR>
nnoremap <Leader>ew :Windows<CR>
nnoremap <Leader>eg :GFiles --cached --others --exclude-standard<CR>
nnoremap <Leader>el :Lines<CR>
nnoremap <Leader>ea :Ag!<space>
nnoremap <Leader>er :Rg<space>
nnoremap <Leader>em :Marks<CR>
nnoremap <Leader>et :Tags<CR>
nnoremap <Leader>ec :History<CR>
nnoremap <Leader>es :Filetypes<CR>
nnoremap <Leader>C  :Commands<CR>
nnoremap <Leader>ch :History:<CR> 

" Swipper
nnoremap <leader>ss :BLines<CR> 

set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

let $FZF_DEFAULT_COMMAND = "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
let $FZF_DEFAULT_OPTS="--preview-window 'right:50%:hidden' --preview 'bat --style=numbers --line-range :300 {}'
      \ --bind ctrl-y:preview-up,ctrl-e:preview-down,ctrl-/:toggle-preview,
      \ctrl-b:preview-page-up,ctrl-f:preview-page-down,
      \ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,
      \shift-up:preview-top,shift-down:preview-bottom,
      \alt-up:half-page-up,alt-down:half-page-down"

" The Silver Searcher
" ripgrep, override the above `ag`
if executable('rg')
  let $FZF_DEFAULT_COMMAND='rg --files -w --hidden --follow --glob "!.git/*"'

  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find
        \call fzf#vim#grep('--column --line-number --no-heading --fixed-strings --ignore-case -w --hidden --follow --glob "!.git/*" --color=always '.shellescape(<q-args>).'| tr -d "\017"',
        \1, <bang>0)

elseif executable('ag')
  let $FZF_DEFAULT_COMMAND='ag -w -f --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_tags_command = 'ctags -R --languages=python'

lua << eof
local g = vim.g

-- Border color
-- up = '~60%',
g.fzf_layout = {
  window = {
    width=0.6, height=0.6, 
    yoffset=0.5, xoffset= 0.5, 
    highlight= 'Todo', border= 'sharp' 
    }
  }
eof

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

" Get Files
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, &columns > 120 ?
      \ fzf#vim#with_preview(): {},
      \ <bang>0)

command! -bang -nargs=? -complete=dir Buffers
      \ call fzf#vim#buffers(<q-args>, &columns > 120 ?
      \ fzf#vim#with_preview(): {}, <bang>0)

" GFiles
command! -bang -nargs=? -complete=dir GFiles
    \ call fzf#vim#gitfiles('--modified')

" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   '--column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" Reducer
