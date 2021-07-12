local editor = {}

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

editor['godlygeek/tabular'] = {}

return editor
