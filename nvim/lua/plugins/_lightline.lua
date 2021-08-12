vim.g.lightline = {
  colorscheme = 'Tomorrow_Night',
  separator= { left = '▒░', right = '░▒' },
  subseparator= { left = '▒', right = '░' },
  active = {
    left = {
      -- { 'coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok' },
      { 'gitbranch', },
      { 'filename', 'readonly', 'tagbar' }
    },
    right = {
      { 'lineinfo', 'percent' },
      { 'paste', 'fileformat', 'fileencoding', 'filetype', 'lsp' },
    }
  },

  component_function = {
    gitbranch  = 'WizGit',
    cocstatus  = 'coc#status',
    fileformat = 'WizFormat',
    fileencoding = 'WizEncoding',
    readonly = 'WizRO',
    filetype = 'WizType',
    filename = 'WizName'
  },

  component = {
    lineinfo = '%3l:%-2v%<',
    tagbar = '%{tagbar#currenttag("%s", "", "f")}',
    lsp = '%{StatusDiagnostic()}',
  },

  mode_map = {
    n = 'N',
    r = 'Prompt',
    i = 'I',
    R = 'R',
    v = 'V',
    V = 'VL',
    c = 'C',
    s = 'S',
    S = 'SL',
    t = 'Terminal',
    ['^s'] = 'SB',
    ['^v'] = 'VB',
  },
}
