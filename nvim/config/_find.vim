" Get the first assign of the var undercursor"
nn <localleader>1 zy[i<CR>

" search engine: vimgrep + ripgrep
nmap <leader>1  :grep -Sw -tpy -e ""<left>
nmap <leader>2  :grep -Sw -txml -e ""<left>
nmap <leader>3  :grep -Sw -tjs -e ""<left>
nmap <leader>st :grep -Sw -e "\#.*(TODO\\|TOCHECK\\|FIXME)"<space>

" qf results
nnoremap <leader>p      :copen<CR>
nnoremap <silent> <c-n> :cnext<CR>
nnoremap <silent> <c-p> :cprevious<CR>

if PlugLoaded('ctrlsf.vim')

  let g:ctrlsf_backend = 'rg'
  let g:ctrlsf_mapping = {
        \ "next"    : "<C-n>",
        \ "prev"    : "<C-p>"
        \ }

  " g:ctrlsf_regex_pattern defines CtrlSF using literal pattern or regular
  " expression pattern as default. Default value is 0, which means literal pattern.
  let g:ctrlsf_regex_pattern = 1
  let g:ctrlsf_ignore_dir = ['setup', 'node_modules']

  let g:ctrlsf_default_view_mode = 'compact'
  let g:ctrlsf_winsize = '30%'

  " let g:ctrlsf_extra_backend_args = {
  "   \ 'rg': '--files -w --hidden --follow --glob "!.git/*"'
  "   \ }

  let g:ctrlsf_auto_close = {
        \ "normal" : 0,
        \ "compact": 0
        \}

  let g:ctrlsf_auto_focus = {
        \ "at": "start"
        \ }

  nmap <leader>sf <Plug>CtrlSFPrompt -G *py<space>
  vmap <leader>sp <Plug>CtrlSFVwordPath
  nmap <leader>sn <Plug>CtrlSFCwordPath
  " nmap <leader>p  :CtrlSFToggle<CR>
  " nmap <leader>1  <Plug>CtrlSFPrompt -G *py<space>
  " vmap <leader>1  <Plug>CtrlSFPrompt -G *py<space>
  " nmap <leader>2  <Plug>CtrlSFPrompt -G *xml<space>
  " nmap <leader>3  <Plug>CtrlSFPrompt -G *js<space>
  " nmap <leader>st <Plug>CtrlSFPrompt "#.*(TODO\|TOCHECK\|FIXME)" -G *

endif

if PlugLoaded('far.vim')
  " shortcut for far.vim find
  nnoremap <silent> <leader>sg  :Farf<cr>
  vnoremap <silent> <leader>sg  :Farf<cr>


  " shortcut for far.vim replace
  nnoremap <silent> <leader>sr  :Farr<cr>
  vnoremap <silent> <leader>sr  :Farr<cr>
endif
