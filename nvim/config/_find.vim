if PlugLoaded('ctrlsf.vim')

  let g:ctrlsf_backend = 'rg'
  let g:ctrlsf_mapping = {
        \ "next"    : "<C-n>",
        \ "prev"    : "<C-p>"
        \ }

  " g:ctrlsf_regex_pattern defines CtrlSF using literal pattern or regular
  " expression pattern as default. Default value is 0, which means literal pattern.
  let g:ctrlsf_regex_pattern = 1

  " let g:ctrlsf_default_view_mode = 'compact'
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

  vmap     <leader>sF <Plug>CtrlSFVwordExec
  nmap     <leader>sn <Plug>CtrlSFCwordPath
  nmap     <leader>sp <Plug>CtrlSFPwordPath
  nmap     <leader>sf <Plug>CtrlSFPrompt-G *

  " Get searching history, use :History: by <leader>sh

  nnoremap <leader>so :CtrlSFToggle<CR>

  " vmap     <leader>ff <Plug>CtrlSFVwordPath
  " nnoremap <leader>fo :CtrlSFOpen<CR>
  " inoremap <leader>ft <Esc>:CtrlSFToggle<CR>

else

  " grep.vim
  " command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Rgrep<SPACE>
  let Grep_Default_Options = '-IR'
  let Grep_Skip_Files = '*.log *.db'
  let Grep_Skip_Dirs = '.git node_modules'

endif
