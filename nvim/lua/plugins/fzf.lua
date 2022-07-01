-- Utils
local api = vim.api
local kbopts = { noremap = true }


--
api.nvim_exec([[
  function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --hidden --column --line-number --no-heading --color=always --smart-case --glob "!{.git}" -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
  endfunction

  command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
]], '')

-- Keybindings
api.nvim_set_keymap('n', '<leader>bb', ':Buffers<CR>', kbopts)
api.nvim_set_keymap('n', '<leader>ff', ':Files<CR>', kbopts)
api.nvim_set_keymap('n', '<leader>bh', ':History<CR>', kbopts)
api.nvim_set_keymap('n', '<C-p>', ':Files<CR>', kbopts)

-- ripgrep bindings
api.nvim_set_keymap('n', '<leader>s', '<ESC>:RG<Space>', { noremap = true, silent = false})
-- ::search for word under cursor
api.nvim_set_keymap('n', '<leader>ws', '<ESC>:RG <C-R><C-W>', { noremap = true, silent = false})
