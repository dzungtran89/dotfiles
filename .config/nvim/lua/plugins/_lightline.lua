vim.g.lightline = {
  colorscheme = 'Tomorrow_Night',
  separator= { left = '▒░', right = '░▒' },
  -- subseparator= { left = '▒', right = '░' },
  active = {
    left = {
      { 'mode' },
      { 'filename', 'lineinfo', 'percent', 'tagbar' }
    },
    right = {
      { 'gitbranch' },
      { 'lsp', 'fileformat', 'fileencoding', 'filetype'},
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
