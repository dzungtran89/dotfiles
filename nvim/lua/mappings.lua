local vimp = require("vimp")
local nnoremap = vimp.nnoremap
local vnoremap = vimp.vnoremap

nnoremap("gl"             ,  ":Rg<CR>")

-----------------------------------------------
-- Session
-----------------------------------------------

nnoremap('<leader>qo'  , ':OpenSession<Space>')
nnoremap('<leader>qw'  , ':SaveSession<Space>')
nnoremap('<leader>qd'  , ':DeleteSession<CR>')
nnoremap('<leader>qc'  , ':CloseSession<CR>')

-- nnoremap('<leader>qo'  , ':CocFzfList sessions<CR>')
-- nnoremap('<leader>qs'  , ':CocCommand session.save<space>')

-- Grep current word in current buffer
nnoremap('<localleader>f', ":exe 'CocFzfList -I --normal --input='.expand('<cword>').' words'<CR>")

-----------------------------------------------
-- FZF
-----------------------------------------------
-- nnoremap("<Leader>es"     ,  ":LocateFiles .<CR>")
nnoremap("<Leader>b"      ,  ":Buffers<CR>")
nnoremap("<Leader>ef"     ,  ":FZF -m<CR>")
nnoremap("<Leader>ew"     ,  ":Windows<CR>")
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
-- nnoremap("<Leader>,"      ,  ":SmartFiles<CR>")
nnoremap("<localleader>bl",  ":BLines<CR>")
nnoremap({"silent", "expr"}, "<localleader>o", ":BTags<CR>")


-----------------------------------------------
-- COC
-----------------------------------------------
-- Show all diagnostics.
nnoremap({"silent", "nowait"}, "<leader>l", ":<C-u>CocFzfList<CR>")

-- nnoremap <silent><nowait> <leader>ca  
nnoremap({"silent", "nowait"}, "<leader>cd", ":<C-u>CocFzfList diagnostics<cr>")
nnoremap({"silent", "nowait"}, "<leader>ce", ":<C-u>CocFzfList extensions<cr>")
nnoremap({"silent", "nowait"}, "<leader>cc", ":<C-u>CocFzfList commands<cr>")
nnoremap({"silent", "nowait"}, "<leader>co", ":<C-u>CocFzfList outline<cr>")

-- Search workspace symbols.
nnoremap({"silent", "nowait"}, "<leader>cs", ":<C-u>CocFzfList -I symbols<cr>")
nnoremap({"silent", "nowait"}, "<leader>cy", ":<C-u>CocFzfList -A --normal yank<CR>")

-- Do default action for next item.
nnoremap({"silent", "nowait"}, "<leader>cr", ":<C-u>CocFzfListResume<CR>")

-- Keymapping for grep word under cursor with interactive mode
nnoremap({"silent"}, "<leader>cf", ":exe 'CocList -I --input='.expand('<cword>').' grep'<CR>")

