local editor = {}

editor['jiangmiao/auto-pairs'] = {
  event = 'BufRead',
  config = function ()
    _G.autopairs = {
      markdown_pairs = function ()
        vim.cmd [[let b:AutoPairs = AutoPairsDefine({'**' : '**'}, ['{'])]]
        vim.cmd [[let b:AutoPairs = AutoPairsDefine({'_' : '_'})]]
        vim.cmd [[let b:AutoPairs = AutoPairsDefine({'<ins>' : '</ins>'})]]
      end,
    }
    vim.cmd [[augroup AutoPairsUserSetup]]
    vim.cmd [[au FileType markdown lua autopairs.markdown_pairs()]]
    vim.cmd [[augroup END]]
  end
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
