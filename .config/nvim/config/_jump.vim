if PlugLoaded('vim-easymotion')

  let g:EasyMotion_do_mapping = 0 " Disable default mappings

  " Turn on case-insensitive feature
  let g:EasyMotion_smartcase = 1

  " JK motions: Line motions
  nmap <localleader>j <Plug>(easymotion-j)
  nmap <localleader>k <Plug>(easymotion-k)
  
  " s{char}{char} to move to {char}{char}
  nmap s <Plug>(easymotion-s2)
  nmap S <Plug>(easymotion-overwin-f2)
  omap t <Plug>(easymotion-tl)

endif

if PlugLoaded('any-jump.vim')

  " -------------------------------------------------
  "
  " /~~||/~\\  /---   ||   ||/~\ /~\ |~~\
  " \__||   |\/       | \_/||   |   ||__/
  "         _/     \__|              |
  "
  " -------------------------------------------------

  " Normal mode: Jump to definition under cursore
  nnoremap <leader>js :AnyJump<CR>

  " Visual mode: jump to selected text in visual mode
  xnoremap <leader>js :AnyJumpVisual<CR>

  " Normal mode: open previous opened file (after jump)
  nnoremap <leader>jb :AnyJumpBack<CR>

  " Normal mode: open last closed search window again
  nnoremap <leader>jl :AnyJumpLastResults<CR>

  " Show line numbers in search rusults
  let g:any_jump_list_numbers = 0

  " Auto search references
  let g:any_jump_references_enabled = 1

  " Auto group results by filename
  let g:any_jump_grouping_enabled = 0

  " Amount of preview lines for each search result
  let g:any_jump_preview_lines_count = 5

  " Max search results, other results can be opened via [a]
  let g:any_jump_max_search_results = 10

  " Prefered search engine: rg or ag
  let g:any_jump_search_prefered_engine = 'rg'

  " Search results list styles:
  " - 'filename_first'
  " - 'filename_last'
  let g:any_jump_results_ui_style = 'filename_first'

  " Any-jump window size & position options
  let g:any_jump_window_width_ratio  = 0.6
  let g:any_jump_window_height_ratio = 0.6
  let g:any_jump_window_top_offset   = 4

  " Or override all default colors
  let g:any_jump_colors = {
        \"plain_text":         "Comment",
        \"preview":            "Comment",
        \"preview_keyword":    "Operator",
        \"heading_text":       "Function",
        \"heading_keyword":    "Identifier",
        \"group_text":         "Comment",
        \"group_name":         "Function",
        \"more_button":        "Operator",
        \"more_explain":       "Comment",
        \"result_line_number": "Comment",
        \"result_text":        "Statement",
        \"result_path":        "String",
        \"help":               "Comment"
        \}

  " top left corner, top right corner, bottom left corner, bottom right corner, top/bottom, left/right
  let g:any_jump_neovim_border = ['╭', '╮','╰', '╯', '─', '│']

  " Disable default any-jump keybindings (default: 0)
  let g:any_jump_disable_default_keybindings = 1

  " Remove comments line from search results (default: 1)
  let g:any_jump_remove_comments_from_results = 1

  " Custom ignore files
  " default is: ['*.tmp', '*.temp']
  let g:any_jump_ignored_files = [
        \'*.tmp', '*.temp', '.git', '*.gz', '*.log', 'var', '*.po', '*.js',
        \'*.patch', '*.diff', 'log', 'plugsin', 'node_modules', 'tags',
        \'*build*'
        \]

  " Search references only for current file type
  " (default: false, so will find keyword in all filetypes)
  let g:any_jump_references_only_for_current_filetype = 0

  " Disable search engine ignore vcs untracked files
  " (default: false, search engine will ignore vcs untracked files)
  let g:any_jump_disable_vcs_ignore = 0

endif
