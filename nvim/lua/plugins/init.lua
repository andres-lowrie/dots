return require'packer'.startup(function()
  use 'wbthomason/packer.nvim'

  use 'EdenEast/nightfox.nvim'

  use 'justinmk/vim-dirvish'
  use 'roginfarrer/vim-dirvish-dovish'

  use '/usr/local/opt/fzf'
  use 'junegunn/fzf.vim'
  require('plugins.fzf')

  use 'itchyny/lightline.vim'
  require('plugins.lightline')

  use 'gelguy/wilder.nvim'
  require('plugins.wilder')

  use 'junegunn/goyo.vim'
  use 'junegunn/limelight.vim'
  require('plugins.goyo-limelight')

  use {
    'phaazon/hop.nvim',
    branch = 'v1'
  }
  require('plugins.hop')

  -- Forks and my garbage
  use 'andres-lowrie/vim-maximizer'
  require('plugins.vim-maximizer')
end)
