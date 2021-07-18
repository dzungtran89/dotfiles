local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
  install_info = {
    url = "https://github.com/vhyrro/tree-sitter-norg",
    files = { "src/parser.c" },
    branch = "main"
  },
}

parser_configs.xml = {
  install_info = {
    url = "https://github.com/unhammer/tree-sitter-xml",
    files = { "src/parser.c" },
    branch = "master"
  },
}

require('nvim-treesitter.configs').setup {
  ensure_installed ={"norg", "xml", "python", "html", "javascript"},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    -- disable = { "c", "rust" },
  },
  indent = {
    enable = true, 
    disable_filetype = {"python"}
  }, 
  matchup = {
    enable = true
  }
}
