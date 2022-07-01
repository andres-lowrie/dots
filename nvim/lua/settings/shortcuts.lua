local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true}

-- Clear highlight
map('n', '<leader>sc', ':noh<CR>', opts)

-- Show full path to file and copy full path to clipboard
map('n', '<BS>', ':echo expand("%:p")<CR>', { silent = true })
map('n', '<leader><BS>', ':let @+=expand("%:p")<CR>', opts)

-- Change dir
map('n', '<leader>cd', ':lcd %:p:h<CR>', opts)
