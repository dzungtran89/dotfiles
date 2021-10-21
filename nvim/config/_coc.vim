if PlugLoaded('coc.nvim')

lua << EOF
vim.g.coc_global_extensions = { 
  "coc-explorer",
  "coc-lists",
  "coc-tsserver",
  "coc-ultisnips",
  "coc-pyright",
  "coc-emoji",
  }

vim.g.python3_host_prog = 'python3'
vim.g.python2_host_prog = 'python2'
vim.g.ruby_host_prog = '$(which ruby)'
EOF

  let g:coc_disable_fts = ['coc-explorer', 'ctrlsf', 'terminal']

  function! s:disable_coc_for_type()
    if (index(g:coc_disable_fts, &filetype) == 0 || &buftype == "terminal")
      let b:coc_enabled = 0
    endif
  endfunction

  augroup CocGroup
    autocmd!
    autocmd BufNew,BufEnter * call s:disable_coc_for_type()
  augroup end

  autocmd FileType python let b:coc_root_patterns = ['.env', '.git']
  " autocmd FileType * let b:coc_suggest_disable = 1

  " Highlight the symbol and its references when holding the cursor.
  " autocmd CursorHold * silent     call CocActionAsync('highlight')
  " autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  " delays and poor user experience.
  set updatetime=300

  " Don't pass messages to |ins-completion-menu|.
  set shortmess+=c

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  " CheckBackspace
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  " Make <CR> auto-select the first completion item and notify coc.nvim to
  " format on enter, <cr> could be remapped by other vim plugin
  " inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
  "       \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  " nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction

	function! StatusDiagnostic() abort
	  let info = get(b:, 'coc_diagnostic_info', {})
	  if empty(info) | return '' | endif
	  let msgs = []
	  if get(info, 'error', 0)
	    call add(msgs, 'E' . info['error'])
	  endif
	  if get(info, 'warning', 0)
	    call add(msgs, 'W' . info['warning'])
	  endif
	  return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
	endfunction

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  " xmap <leader>f  <Plug>(coc-format-selected)
  " nmap <leader>f  <Plug>(coc-format-selected)

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

  " Remap <C-f> and <C-b> for scroll float windows/popups.
  if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  endif

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

  " Don't use GUI tabline
  " set guioptions-=e

  " grep word under cursor
  command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>

  function! s:GrepArgs(...)
    let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
          \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
    return join(list, "\n")
  endfunction

  vnoremap <leader>gs :<C-u>call <SID>GrepFromSelected(visualmode())<CR>
  nnoremap <leader>gs :<C-u>set operatorfunc=<SID>GrepFromSelected<CR>g@

  function! s:GrepFromSelected(type)
    let saved_unnamed_register = @@
    if a:type ==# 'v'
      normal! `<v`>y
    elseif a:type ==# 'char'
      normal! `[v`]y
    else
      return
    endif
    let word = substitute(@@, '\n$', '', 'g')
    let word = escape(word, '| ')
    let @@ = saved_unnamed_register
    execute 'CocList grep '.word
  endfunction

  nnoremap <silent> <leader>;        :<C-u>CocCommand explorer<CR>
  nnoremap <silent> <leader>rr       :<C-u>CocListResume<CR>
  nnoremap <leader>qw                :<C-u>CocCommand session.save<Space>

  nnoremap <silent> <localleader>f  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>
  " -- Keymapping for grep word under cursor with interactive mode
  nnoremap <silent> <Leader>cf :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>

endif

if PlugLoaded('coc-fzf')
  " let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.4, 'border': 'sharp' } }
  " let g:coc_fzf_preview = 'up:50%'
  " let g:coc_fzf_opts = ['--layout=reverse-list']
  " let g:coc_fzf_preview_toggle_key = '?'
  nnoremap <silent> <leader>ll :<C-u>CocFzfList<CR>
  nnoremap <silent> <leader>ld :<C-u>CocFzfList diagnostics<CR>
  nnoremap <silent> <leader>lb :<C-u>CocFzfList diagnostics --current-buf<CR>
  nnoremap <silent> <leader>lC :<C-u>CocFzfList commands<CR>
  nnoremap <silent> <leader>ls :<C-u>CocFzfList symbols<CR>
  nnoremap <silent> <leader>qo :<C-u>CocFzfList sessions<CR>

endif
