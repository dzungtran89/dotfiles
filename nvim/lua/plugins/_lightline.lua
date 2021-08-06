vim.g.lightline = {
  colorscheme = 'Tomorrow_Night',
  separator= { left = '▓▒░', right = '░▒▓' },
  subseparator= { left = '▒', right = '░' },
  active = {
    left = {
      -- { 'coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok' },
      { 'gitbranch', },
      { 'filename', 'readonly', 'modified', 'tagbar' }
    },
    right = {
      { 'lineinfo', 'percent' },
      { 'paste', 'fileformat', 'fileencoding', 'filetype' },
    }
  },

  component_function = {
    gitbranch  = 'WizGit',
    cocstatus  = 'coc#status',
    fileformat = 'WizFormat',
    fileencoding = 'WizEncoding',
    modified = 'WizMod',
    readonly = 'WizRO',
    filetype = 'WizType',
    filename = 'WizName'
  },

  component = {
    lineinfo = '%3l:%-2v%<',
    tagbar = '%{tagbar#currenttag("%s", "", "f")}',
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
    cv = 'VB',
    cs = 'SB',
    -- C-s = 'SB',
    -- C-v = 'VB',
  },

}
