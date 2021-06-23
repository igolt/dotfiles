local editor = {}

editor['jiangmiao/auto-pairs'] = {
  event = 'BufRead'
}

editor['tpope/vim-commentary'] = {
  event = 'BufRead'
}

editor['tpope/vim-surround'] = {
  event = 'BufRead'
}

editor['akinsho/nvim-toggleterm.lua'] = {
  cmd = 'ToggleTerm'
}

editor['tpope/vim-repeat'] = {}

editor['folke/zen-mode.nvim'] = {
  cmd = 'ZenMode'
}

editor['alvan/vim-closetag'] = {
  ft = {'html', 'xhtml', 'phtml'}
}

return editor
