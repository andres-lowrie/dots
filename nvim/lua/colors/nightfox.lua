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
}


require('nightfox').setup({
  palettes = palettes,
  options = options,
})
vim.cmd('colorscheme nordfox')
