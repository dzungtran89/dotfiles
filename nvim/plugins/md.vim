if has_key(plugs, "tabular")

  " nmap <localleader>a= :Tabularize /=<CR>
  " vmap <localleader>a= :Tabularize /=<CR>
  " nmap <localleader>a: :Tabularize /:\zs<CR>
  " vmap <localleader>a: :Tabularize /:\zs<CR>

  inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

  function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
      let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
      let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
      Tabularize/|/l1
      normal! 0
      call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
  endfunction

  vmap <localleader>a :Tabularize /

endif

if has_key(plugs, 'vim-markdown')

  let g:vim_markdown_folding_disabled = 1
  let g:vim_markdown_no_default_key_mappings = 1

  let g:vim_markdown_conceal = 0
  let g:vim_markdown_conceal_code_blocks = 0

  " let g:vim_markdown_override_foldtext       = 0
  " let g:vim_markdown_emphasis_multiline      = 0
  " let g:vim_markdown_frontmatter             = 1

endif

" Add support for markdown files in tagbar.

" if has_key(plugs, 'tagbar')
"   let g:tagbar_type_markdown = {
"         \ 'ctagstype': 'markdown',
"         \ 'ctagsbin' : '/Users/tran/code/github/markdown2ctags/markdown2ctags.py',
"         \ 'ctagsargs' : '-f - --sort=yes --sro=»',
"         \ 'kinds' : [
"         \ 's:sections',
"         \ 'i:images'
"         \ ],
"         \ 'sro' : '»',
"         \ 'kind2scope' : {
"         \ 's' : 'section',
"         \ },
"         \ 'sort': 0,
"         \ }
" endif

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
