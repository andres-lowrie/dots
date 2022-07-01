local api = vim.api
local map = api.nvim_set_keymap

local augroup = api.nvim_create_augroup('mine_goyo_cmds', { clear = true })

api.nvim_create_autocmd('User', {
  pattern = 'GoyoEnter',
  group = augroup,
  desc = 'Enable limelight with Goyo',
  command = 'Limelight'
})

api.nvim_create_autocmd('User', {
  pattern = 'GoyoLeave',
  group = augroup,
  desc = 'Disable limelight with Goyo',
  command = 'Limelight!'
})


-- Mappings
local opts = { noremap = true, silent = true}
map('n', '<leader>tz', ':Goyo<CR>', opts)
