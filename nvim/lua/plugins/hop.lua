local map = vim.api.nvim_set_keymap

require'hop'.setup()

map('n', '<leader>jw', "<cmd>lua require'hop'.hint_char1({ direction = nil, current_line_only = false })<cr>", {})
