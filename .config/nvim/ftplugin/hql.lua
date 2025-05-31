vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead", "BufReadPost" }, {
  group = "mine",
  pattern = "*.hql",
  command = "set syntax=sql"
})
