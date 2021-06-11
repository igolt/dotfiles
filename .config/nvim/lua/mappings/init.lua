local opt_silent = {silent = true}

local function set_keymap_with_noremap(mode, lhs, rhs, opts)
  if not opts then opts = {noremap = true}
  else opts.noremap = true end

  if type(mode) == 'table' then
    for _, _mode in ipairs(mode) do
      vim.api.nvim_set_keymap(_mode, lhs, rhs, opts)
    end
  else
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
  end
end

local function nnoremap(lhs, rhs, opts)
  set_keymap_with_noremap('n', lhs, rhs, opts)
end

local function tnoremap(lhs, rhs, opts)
  set_keymap_with_noremap('t', lhs, rhs, opts)
end

-- Windows
nnoremap('<leader>h', ':wincmd h<cr>', opt_silent)
nnoremap('<leader>j', ':wincmd j<cr>', opt_silent)
nnoremap('<leader>k', ':wincmd k<cr>', opt_silent)
nnoremap('<leader>l', ':wincmd l<cr>', opt_silent)

nnoremap('<leader>w', '<cmd>w<cr>')
nnoremap('<leader>q', '<cmd>q<cr>')
nnoremap('FQ', '<cmd>qa<cr>')
nnoremap('du', '0D')
nnoremap('Y', 'y$')

nnoremap('<leader>e', ':e ')
nnoremap('<leader>v', ':vsplit ')

set_keymap_with_noremap({'n', 'v'}, '<leader>s', ':s/')
nnoremap('<leader>S', ':%s/')
nnoremap('=f', 'gg=G', opt_silent)

-- Terminal
nnoremap('<C-u>', '<cmd>ToggleTerm<cr>', opt_silent)
tnoremap('<C-u>', '<C-\\><C-n><cmd>ToggleTerm<cr>', opt_silent)

nnoremap('<C-p>', '<cmd>Telescope find_files<cr>')
nnoremap('<leader>td', '<cmd>Telescope vimdots<cr>')

-- Buffers
nnoremap('<leader>bn', '<cmd>BufferLineCycleNext<cr>')
nnoremap('<leader>bp', '<cmd>BufferLineCyclePrev<cr>')
nnoremap('<leader>x', '<cmd>bdelete<cr>')

nnoremap('<leader>nt', '<cmd>NvimTreeToggle<cr>')

-- set_keymap_with_noremap('i', '<CR>', [[compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })]], {expr = true, nowait = true})
