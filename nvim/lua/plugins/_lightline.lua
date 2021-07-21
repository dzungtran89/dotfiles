vim.g.lightline = {
  colorscheme = 'nord',
  -- separator = { left = "", right = "" },
  active = {
    left = {
      { 'coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok' },
      { 'gitbranch', 'mode' },
      { 'filename', 'readonly', 'modified', 'tagbar' }
    },
    right = {
      { 'lineinfo', 'percent' },
      { 'paste', 'fileformat', 'fileencoding', 'filetype' },
    }
  },
  component_function = {
    gitbranch = 'FugitiveHead',
    cocstatus = 'coc#status',
    fileformat = 'LightlineFileformat',
    filetype = 'LightlineFiletype',
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
    -- C-s = 'SB',
    -- C-v = 'VB',
  },
}
