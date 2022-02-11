local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

parser_configs.org = {
  install_info = {
    url = 'https://github.com/gagbo/tree-sitter-org',
    files = {'src/parser.c'},
    branch = 'develop',
  },
  filetype = 'org',
}

parser_configs.xml = {
  install_info = {
    url = "https://github.com/unhammer/tree-sitter-xml",
    files = { "src/parser.c" },
    branch = "master"
  },
}

require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "python", "dockerfile", "bash",
    "xml", "javascript", "html", "css",
    "yaml", "rst", "org",
    "lua", "vim"
  },
  -- Respect the indent of polyglot
  indent = {
    enable = false,
  },
  yati = {
    enable = true,
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  matchup = {
    enable = true
  },
  autotag = {
    enable = true,
    filetypes = { "html" , "xml" },
  }
}
