local vimp = require("vimp")
local nnoremap = vimp.nnoremap

-- nnoremap("<Leader>es"     ,  ":LocateFiles .<CR>")
nnoremap("<Leader>b"      ,  ":Buffers<CR>")
nnoremap("<Leader>ef"     ,  ":FZF -m<CR>")
nnoremap("<Leader>ee"     ,  ":FZFMru<CR>")
nnoremap("<Leader>eg"     ,  ":GFiles --cached --others --exclude-standard<CR>")
nnoremap("<Leader>eh"     ,  ":History<CR>")
nnoremap("<Leader>el"     ,  ":Lines<CR>")
nnoremap("<Leader>ea"     ,  ":Ag!<CR>")
nnoremap("<Leader>er"     ,  ":Rg!<CR>")
nnoremap("<Leader>em"     ,  ":Marks<CR>")
nnoremap("<Leader>et"     ,  ":Tags<CR>")
nnoremap("<Leader>ec"     ,  ":History:<CR>")
nnoremap("<Leader>es"     ,  ":Filetypes<CR>")
nnoremap("<Leader>,"      ,  ":SmartFiles<CR>")
nnoremap("<localleader>bl",  ":BLines<CR>")
nnoremap("gl"             ,  ":Rg<CR>")
