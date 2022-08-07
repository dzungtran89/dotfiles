if vim.fn.PlugLoaded('vimwiki') ~=1 then
  return
end

-- Built-in completion status
-- [ ] 0%
-- [.] 1-33%
-- [o] 34-66%
-- [O] 67-99%
-- [x] 100%

-- [!] HIGH
-- [~] WAIT
-- [-] STOP

vim.g.vimwiki_listsyms = ' .oOx'
vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_folding = 'expr'
vim.g.vimwiki_list = {
  {
    path = '~/Nextcloud/vimwiki/diary',
    diary_rel_path = '',
    syntax = 'markdown',
    auto_toc = 1,
    ext = '.md',
  },
}

local map = vim.api.nvim_set_keymap
local opts = {noremap = true}

-- fuzzy notes
map('n', "<leader>we", ":exe 'Files ' . expand(g:vimwiki_list[0].path)<CR>", opts)

-- searching notes
map('n', "<leader>wf", ":Ack -tmd<space>", opts)
map('n', "<leader>w<leader>T", ":exe 'VimwikiRebuildTags!' | VimwikiGenerateTagLinks<CR>", opts)

vim.cmd[[
  " Function to set header of current file to match filename.
  "
  " This helps interoparability with Nextcloud Notes, which assumes that
  " the first line of the file matches the filename.
  function SetWikiHeader()
    let first_line = getline(1)
    let filename = expand("%:t:r")

    if "# " . filename == first_line
      " First line is already correct.
      :
    elseif first_line =~ '^#*\s*\V' . escape(filename, '\') . '\m\s*$'
      " First line matches filename but has wrong header format.
      " Reformat to have proper format.
      call setline(1, "# " . filename)
    else
      " First line not matching filename at all. Prepend lines with
      " filename as a header.
      if first_line != ""
        call append(0, "")
      endif
      call append(0, "# " . filename)
    endif
  endfunction
]]
