local fn = vim.fn

if fn.PlugLoaded('LuaSnip') ~= 1 then
  return
end

require("luasnip.loaders.from_snipmate").lazy_load({
  paths = { "~/.nvim/plugged/vim-odoo-snippets/UltiSnips" }
})

vim.cmd([[
  imap     <silent><expr> <Tab>   luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
  inoremap <silent>       <S-Tab> <cmd>lua                     require'luasnip'.jump(-1)<Cr>
  snoremap <silent>       <Tab>   <cmd>lua                     require('luasnip').jump(1)<Cr>
  snoremap <silent>       <S-Tab> <cmd>lua                     require('luasnip').jump(-1)<Cr>
  imap     <silent><expr> <C-E>   luasnip#choice_active()      ? '<Plug>luasnip-next-choice'    : '<C-E>'
  smap     <silent><expr> <C-E>   luasnip#choice_active()      ? '<Plug>luasnip-next-choice'    : '<C-E>'
]])
