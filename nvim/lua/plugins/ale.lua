local map = vim.api.nvim_set_keymap

vim.g.ale_sign_column_always = 1

map("n", "<Leader>m=", ":ALEFix<CR>", { noremap = true })
