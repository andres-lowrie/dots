return require'packer'.startup(function()
  use 'wbthomason/packer.nvim'

  use 'EdenEast/nightfox.nvim'

  use 'justinmk/vim-dirvish'
  use 'roginfarrer/vim-dirvish-dovish'
  require('plugins.dirvish')

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

  use 'jiangmiao/auto-pairs'

  use 'tpope/vim-surround'

  use 'tpope/vim-unimpaired'

  use 'tpope/vim-surround'

  use 'tpope/vim-commentary'
  require('plugins.vim-commentary')

  use 'kshenoy/vim-signature'

  use 'dense-analysis/ale'
  require('plugins.ale')

  use 't9md/vim-choosewin'
  require('plugins.choosewin')

  -- Languages
  use 'tbastos/vim-lua'

  use 'kchmck/vim-coffee-script'

  use 'elzr/vim-json'

  use 'zah/nim.vim'

  -- Forks and my garbage
  use 'andres-lowrie/vim-maximizer'
  require('plugins.vim-maximizer')
end)
