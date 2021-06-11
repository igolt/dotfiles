local tools = {}

tools['iamcco/markdown-preview.nvim'] = {
  ft = 'markdown',
  run = 'cd app && npm install',
  config = function ()
    vim.g.mkdp_auto_start = 0
  end
}

tools['tpope/vim-fugitive'] = {
}

return tools
