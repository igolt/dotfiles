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

return editor
