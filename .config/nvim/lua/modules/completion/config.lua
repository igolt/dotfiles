local config = {}

function config.nvim_compe()
  require'compe'.setup {
    enabled = true,
    debug = false,
    min_length = 1,
    preselect = 'always',
    allow_prefix_unmatch = false,
    source = {
      path = true,
      buffer = true,
      calc = true,
      vsnip = true,
      nvim_lsp = true,
      nvim_lua = true,
      spell = true,
      tags = true,
      snippets_nvim = false,
    },
  }
end

function config.nvim_lsp()
  require('modules.completion.lspconfig')
end

function config.telescope()
  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd [[packadd plenary.nvim]]
    vim.cmd [[packadd popup.nvim]]
    vim.cmd [[packadd telescope-fzy-native.nvim]]
  end
  require('telescope').setup {
    require('telescope').setup {
      defaults = {
        prompt_prefix = '🔭 ',
        prompt_position = 'top',
        selection_caret = " ",
        sorting_strategy = 'ascending',
        results_width = 0.8,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
      },
      extensions = {
        fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
        }
      }
    }
  }
  require('telescope').load_extension('fzy_native')
  require('telescope').load_extension('vimdots')
end

return config
