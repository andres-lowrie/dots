local set = vim.opt
local api = vim.api

set.laststatus = 2
set.showmode = true

api.nvim_exec([[
	function! LightlineFilename()
		let root = fnamemodify(get(b:, 'gitbranch_path'), ':h:h')
		let path = expand('%:p')
		if path[:len(root)-1]==# root
			return path[len(root)+1:]
		endif
		return expand('%')
	endfunction
]], '')

vim.g.lightline = {
  colorscheme = 'solarized',
  active = {
    left = {{'mode', 'paste'}, { 'gitbranch', 'readonly', 'filename', 'modified' }}
  },
  component_function = {
    filename = 'LightlineFilename'
  }
}
