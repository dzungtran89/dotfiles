-- qf
vim.api.nvim_create_autocmd(
  "FileType", {
    pattern = {
      "git", "qf"
    },
    command = [[setl nornu nu]]
  }
)
