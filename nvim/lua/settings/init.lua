-- Utils
local set = vim.opt

-- Base
set.backspace = 'indent,eol,start'
set.incsearch = true
set.fileencoding = 'utf-8'
set.ignorecase = true
set.hlsearch = true
set.number = true
set.shell = '/bin/zsh'
set.re = 1
set.relativenumber = true
set.scrolloff = 5
set.smartcase = true
set.smarttab = true
set.tabpagemax = 10
set.termguicolors = true

-- Indentation
set.autoindent = true
set.expandtab = true
set.formatoptions = 'croql'
set.wrap = false
set.shiftwidth = 2
set.tabstop = 2

-- Windows
set.splitbelow = true
set.splitright = true

-- Bindings
vim.g.mapleader = ' '

-- Other?
set.diffopt = { 'internal', 'filler', 'closeoff', 'vertical' }

require('settings.mappings')
require('settings.shortcuts')
require('settings.macros')
