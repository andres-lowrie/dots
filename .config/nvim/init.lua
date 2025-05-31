-- [[ Base/Essentials ]]
--
vim.g.mapleader = " "
vim.g.maplocalleader = ' '
vim.go.ignorecase = true
vim.go.incsearch = true
vim.go.smartcase = true
vim.go.spelllang = 'en_us'
vim.o.autoindent = true
vim.o.breakindent = true
vim.o.completeopt = 'menuone,noselect'
vim.o.hlsearch = false
vim.o.mouse = 'a'
vim.o.number = true
vim.o.relativenumber = true
vim.o.shell = "/bin/bash"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabpagemax = 100
vim.o.termguicolors = true
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.undofile = true
vim.o.updatetime = 250
vim.wo.number = true
vim.wo.signcolumn = 'yes'

-- [[ Indentation ]]
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.wrap = true
vim.o.formatoptions = "croql"

-- [[ Diffing ]]
vim.opt.diffopt:append { "vertical" }

-- [[ Clipboard ]]
vim.o.clipboard = 'unnamedplus'
vim.keymap.set({ 'n' }, '<Leader>y', '"*y', { silent = true })
vim.keymap.set({ 'n' }, '<Leader>p', '"*p', { silent = true })
vim.keymap.set({ 'n' }, '<Leader>Y', '"*Y', { silent = true })
vim.keymap.set({ 'n' }, '<Leader>P', '"*P', { silent = true })

-- [[ Toggles ]]
vim.keymap.set({ 'n' }, '<Leader>tp', ':set paste! paste?<CR>', { silent = true })
vim.keymap.set({ 'n' }, '<Leader>tw', ':set wrap! wrap?<CR>', { silent = true })
vim.keymap.set({ 'n' }, '<Leader>tsb', ':set scrollbind!<CR>', { silent = true })
vim.keymap.set({ 'n' }, '<Leader>tss', ':set spell! spell?<CR>', { silent = true })
vim.keymap.set({ 'n' }, '<Leader>tci', ':set ic! ic?<CR>', { silent = true })

-- [[ Tabs ]]
vim.keymap.set({ 'n' }, 'T', ':tabnew %<CR>', { silent = true })

-- [[ Keymaps ]]
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- map arrows to something useful
vim.keymap.set('n', '<Up>', ":cp<CR>", { silent = true })
vim.keymap.set('n', '<Down>', ":cn<CR>", { silent = true })
vim.keymap.set('n', '<Left>', ":cp<CR>", { silent = true })
vim.keymap.set('n', '<Right>', ":cn<CR>", { silent = true })


-- [[ Setting Plugins ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- [[ Theme ]]
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    config = function()
      local commentcolor = '#33aaaa' -- cyan
      local options = {}
      local palettes = {
        nightfox = {
          comment = commentcolor,
        },
        nordfox = {
          comment = commentcolor,
        },
        dawnfox = {
          comment = commentcolor,
        },
        dayfox = {
          comment = commentcolor,
        },
      }

      require('nightfox').setup({
        palettes = palettes,
        options = options,
      })
      vim.cmd.colorscheme 'nordfox'

      -- hacks for octo plugin
      --- vim.cmd('hi OctoEditable guibg=None')
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  -- [[ Git related plugins ]]
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<Leader>gs', ':Git<CR>', { desc = "[G]it [S]tatus" })
      vim.keymap.set('n', '<Leader>gd', ':Gdiffsplit!<CR>', { desc = "[G]it [D]iff" })
      vim.keymap.set('n', '<Leader>gb', ':Git blame<CR>', { desc = "[G]it [B]lame" })
      vim.keymap.set('n', '<Leader>ge', ':Gedit<CR>', { desc = "[G]it [E]dit. Or return to regular edit" })
      vim.keymap.set('n', '<Leader>gh', ':0Gclog<CR>', { desc = "[G]it [H]istory current file" })
      vim.keymap.set('n', '<Leader>gp', ':Git -c push.default=current push<CR>', { desc = "[G]it [P]ush" })
      vim.keymap.set('n', '<Leader>gpf', ':Git -c push.default=current push --force-with-least<CR>',
        { desc = "[G]it [P]ush [F]orce" })
      vim.keymap.set('n', '<Leader>gr', ':Git rebase -i HEAD~2', { desc = "[G]it [R]ebase" })
      vim.keymap.set('n', '<Leader>gc', ':Git rebase --continue<CR>', { desc = "[R]ebase [C]ontinue" })
      vim.keymap.set('n', '<Leader>gn', ':Git checkout -branch APTEAM-', { desc = "[G]it [N]ew apteam banch" })
    end,
  },
  {
    'tpope/vim-rhubarb',
    dependencies = { 'tpope/vim-fugitive' },
    config = function()
      vim.keymap.set('n', '<Leader>go', ':GBrowse<CR>', { desc = "[G]it [O]pen browser" })
    end,
  },
  {
    'junegunn/gv.vim',
    dependencies = { 'tpope/vim-fugitive' },
    config = function()
      vim.keymap.set('n', '<Leader>gl', ':GV!<CR>', { desc = "[G]it [L]og current file" })
      vim.keymap.set('n', '<Leader>gll', ':GV<CR>', { desc = "[G]it [L]og [L]ong or all files" })
      vim.keymap.set('n', '<Leader>glr', ':GV?<CR>', { desc = "[G]it [L]og [R]evisions for current file" })
    end,
  },
  'kshenoy/vim-signature',
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>hp', require('gitsigns').prev_hunk,
          { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        vim.keymap.set('n', '<leader>hn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
        vim.keymap.set('n', '<leader>hhp', require('gitsigns').preview_hunk,
          { buffer = bufnr, desc = '[P]review [H]unk' })
      end,
    },
  },

  -- [[ Navigation / UI / Focus ]]
  'tpope/vim-vinegar',
  { 'folke/which-key.nvim', opts = {} },
  {
    'junegunn/goyo.vim',
    config = function()
      vim.api.nvim_create_autocmd("User", {
        callback = function()
          require('lualine').hide({})
        end,
        pattern = "GoyoEnter"
      })
      vim.api.nvim_create_autocmd("User", {
        callback = function()
          require('lualine').hide({ unhide = true })
        end,
        pattern = "GoyoLeave"
      })
      vim.api.nvim_exec2([[
        let g:goyo_width = 120
      ]], {})

      vim.keymap.set('n', '<Leader>tz', ':Goyo<CR>', { desc = '[T]oggle [G]oyo' })
    end
  },
  {
    'phaazon/hop.nvim',
    config = function()
      require('hop').setup()
      vim.keymap.set({ 'n' }, '<Leader>jw',
        "<cmd>lua require'hop'.hint_char1({ direction = nil, current_line_only = false })<CR>")
    end
  },
  {
    'andres-lowrie/vim-maximizer',
    config = function()
      vim.keymap.set({ 'n' }, '<Leader>wm', ':MaximizerToggle<CR>')
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
    },
    config = function()
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>bb', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })
      vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
      vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Search [G]it [F]iles' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    end
  },
  {
    'andres-lowrie/nvim-search-internet',
    config = function()
      vim.keymap.set({ 'n' }, '<Leader>si', require('search-internet').selection, { desc = "[S]earch [I]nternet" })
      vim.keymap.set({ 'n' }, '<Leader>sw', require('search-internet').word_under_cursor,
        { desc = "[S]earch Internet for [W]ord under cursor" })
    end
  },

  -- [[ Languages ]]
  'NMAC427/guess-indent.nvim',
  'tpope/vim-surround',
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      local opts = {
        toggler = {
          line = 'cll'
        },
        opleader = {
          line = 'cl'
        },
      }
      require("Comment").setup(opts)

      local ft = require("Comment.ft")
      ft.lua = "---%s"
    end
  },

  -- Lua
  {
    "folke/lazydev.nvim",
    ft = "lua",
  },

  -- Coffee Script
  {
    'kchmck/vim-coffee-script'
  },

  -- [[ Treesitter]]
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'cpp',
        'diff',
        'fennel',
        'go',
        'html',
        'janet_simple',
        'javascript',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'python',
        'query',
        'rust',
        'scala',
        'sql',
        'typescript',
        'vim',
        'vimdoc',
      },
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental = '<M-space>',
        },
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>A'] = '@parameter.inner',
        },
      },
    },
  },

  -- [[ Completion]]

  -- These should go first so that later it's easier to see what blink-cmp is pointing
  -- LLM/AI
  {
    "zbirenbaum/copilot.lua",
    opts = {
      panel = { enabled = false },
      suggestion = {
        enabled = true,
        auto_trigger = false,
        keymap = {
          accept = '<C-]>',
          accept_word = '<C-F>',
          dismiss = '<C-Esc>',
        },
      },
    },
  },
  'giuxtaposition/blink-cmp-copilot',
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {},
  },
  {
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
        opts = {},
      },
      'folke/lazydev.nvim',
      'giuxtaposition/blink-cmp-copilot',
    },
    opts = {
      keymap = {
        preset = 'enter',
      },
      appearance = {
        nerd_font_variant = 'mono',
      },
      completion = {
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
      },
      sources = {
        default = {'buffer', 'lsp', 'path', 'snippets', 'lazydev', 'copilot' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
          copilot = {
            name = 'copilot',
            module = 'blink-cmp-copilot',
            score_offset = 100,
            enabled = true,
            async = true,
          },
        },
      },
      snippets = { preset = 'luasnip' },
      fuzzy = { implementation = 'lua' },
      signature = { enabled = true },
    },
    opts_extend = { "sources.default" }
  },
}, {
  -- Hot trash garbage that's local and not published
  dev = {
    path = "~/LocalNeovimPlugs"
  },
})

-- global functions for deving
require 'for_deving'

-- [[ Generic-ish things that apply to everything ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Windows and Project ]]
-- Spliting
vim.keymap.set('n', '<Leader>w-', "<C-w>s", { silent = true })
vim.keymap.set('n', '<Leader>w/', "<C-w>v", { silent = true })
vim.keymap.set('n', '<Leader>wh', "<C-w>h", { silent = true })
vim.keymap.set('n', '<Leader>wj', "<C-w>j", { silent = true })
vim.keymap.set('n', '<Leader>wk', "<C-w>k", { silent = true })
vim.keymap.set('n', '<Leader>wl', "<C-w>l", { silent = true })
vim.keymap.set('n', '<Leader>w=', "<C-w>=", { silent = true })
-- Moving
vim.keymap.set('n', '<Leader>wL', "<C-w>L", { silent = true })
vim.keymap.set('n', '<Leader>wH', "<C-w>H", { silent = true })
vim.keymap.set('n', '<Leader>wJ', "<C-w>J", { silent = true })
vim.keymap.set('n', '<Leader>wK', "<C-w>K", { silent = true })
-- Writing/Reading
vim.keymap.set('n', '<Leader>wd', ":close<CR>", { silent = true })
vim.keymap.set('n', '<Leader>wo', "<C-w>o", { silent = true })
vim.keymap.set('n', '<Leader>fs', ":w<CR>", { silent = true })
vim.keymap.set('n', '<Leader>fa', ":wa<CR>", { silent = true })

-- [[ Buffers ]]
-- Last Buffer
vim.keymap.set('n', '<Leader><Tab>', ":e#<CR>", { silent = true })
-- Delete Buffer
vim.keymap.set('n', '<Leader>bd', ":bdelete<CR>", { silent = true })

-- [[ Insert Mode ]]
vim.keymap.set('i', '<C-a>', "<C-o>^", { silent = true })
vim.keymap.set('i', '<C-e>', "<C-o>$", { silent = true })
vim.keymap.set('i', '<C-h>', "<BS>", { silent = true })

-- [[ Command Mode ]]
vim.keymap.set('c', '<C-a>', "<Home>", { silent = true })
vim.keymap.set('c', '<C-e>', "<End>", { silent = true })
vim.keymap.set('c', '<C-p>', "<Up>", { silent = true })
vim.keymap.set('c', '<C-n>', "<Down>", { silent = true })
vim.keymap.set('c', '<M-b>', "<Left>", { silent = true })
vim.keymap.set('c', '<M-e>', "<Right>", { silent = true })

-- [[ File Info ]]
vim.keymap.set('n', '<Leader>sc', ":noh<CR>", { silent = true })
vim.keymap.set('n', '<BS>', ':echo expand("%:p")<CR>', { silent = true })
vim.keymap.set('n', '<Leader><BS>', ':let @+=expand("%:p")<CR>', { silent = true })

-- [[ NETWR ]]
vim.keymap.set('n', '<Leader>cd', ":lcd %:p:h<CR>", { silent = true })

-- [[ Language ]]
vim.api.nvim_create_augroup("mine", { clear = false })

-- [[ Diagnostic ]]
vim.diagnostic.config({ virtual_text = false, underline = false })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Configure Copilot ]]
-- copilot-chat-bindings
vim.keymap.set('n', '<Leader>?', function()
  require("CopilotChat").toggle()
end, { desc = '[C]opilot [C]hat open' })

vim.keymap.set('n', '<Leader>??', function()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input, {
      selection = require("CopilotChat.select").buffer
    })
  end
end, { desc = '[C]opilot [C]hat with context' })


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
