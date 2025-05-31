-- the "mine" autogroup is defined in ~/.config/nvim/init.lua
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead", "BufReadPost" }, {
  group = "mine",
  pattern = "*.bats",
  command = "set syntax=sh"
})
