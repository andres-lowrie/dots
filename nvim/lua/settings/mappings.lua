-- Utils
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true}

-- Clipboard
map('v', '<leader>y', '"*y', opts)
map('n', '<leader>p', '"*p', opts)

-- Windows
-- ::spliting
map('n', '<leader>w-', '<C-w>s', opts)
map('n', '<leader>w/', '<C-w>v', opts)
map('n', '<leader>ww', '<C-w>w', opts)
map('n', '<leader>wh', '<C-w>h', opts)
map('n', '<leader>wj', '<C-w>j', opts)
map('n', '<leader>wk', '<C-w>k', opts)
map('n', '<leader>wl', '<C-w>l', opts)
map('n', '<leader>w=', '<C-w>=', opts)
-- ::moving
map('n', '<leader>wL', '<C-w>L', opts)
map('n', '<leader>wH', '<C-w>H', opts)
map('n', '<leader>wJ', '<C-w>J', opts)
map('n', '<leader>wK', '<C-w>K', opts)
-- ::closing
map('n', '<leader>wd', ':close<CR>', opts)
map('n', '<leader>wo', '<C-w>o', opts)

-- Files/Buffers
map('n', '<leader>fs', ':w<CR>', opts)
map('n', '<leader>fa', ':wa<CR>', opts)
map('n', '<leader><Tab>', ':e#<CR>', opts)
map('n', '<leader>bd', ':hide<CR>', opts)
map('n', '<leader>bk', ':bdelete<CR>', opts)

-- Files/Buffers
map('n', 't', ':tabnew', opts)

-- Insert Mode
-- ::quick move start and end of line
map('i', '<C-a>', '<C-o>^', opts)
map('i', '<C-e>', '<C-o>$', opts)

-- Command Mode
map('c', '<C-a>', '<Home>', { noremap = true})
map('c', '<C-e>', '<End>', { noremap = true})
map('c', '<C-p>', '<Up>', { noremap = true})
map('c', '<C-n>', '<Down>', { noremap = true})
map('c', '<C-b>', '<S-Left>', { noremap = true})
map('c', '<C-l>', '<S-Right>', { noremap = true})

-- Toggles
map('n', '<leader>tp', ':set paste! paste?<CR>', { noremap = true })
map('n', '<leader>tw', ':set wrap! wrap?<CR>', { noremap = true })
map('n', '<leader>tsb', ':set scrollbind! scrollbind?<CR>', { noremap = true })
map('n', '<leader>tss', ':set spell! spell?<CR>', { noremap = true })
