local config = {}

function config.nvim_compe()
  require'compe'.setup {
    enabled = true,
    debug = false,
    min_length = 1,
    preselect = 'disable',
    throttle_time = 80,
    source_timeout = 200,
    resolve_timeout = 800,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,

    source = {
      calc = true,
      path = true,
      vsnip = true,
      buffer = true,
      nvim_lsp = true,
      nvim_lua = true,
      tags = false,
      spell = false,
      snippets_nvim = false,
    },
  }
end

function config.nvim_lsp()
  require('modules.completion.lspconfig')
end

function config.vim_vsnip()
  vim.cmd [[imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]
  vim.cmd [[smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]
end

function config.telescope()
  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd [[packadd plenary.nvim]]
    vim.cmd [[packadd popup.nvim]]
    vim.cmd [[packadd telescope-fzy-native.nvim]]
  end

  require('telescope').setup {
    defaults = {
      prompt_prefix = '🔭 ',
      selection_caret = "  ",
      sorting_strategy = 'ascending',
      layout_config = {
        prompt_position = 'bottom',
      },
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      }
    }
  }

  require('telescope').load_extension('fzy_native')
  require('telescope').load_extension('vimdots')
  require('telescope').load_extension('project_files')
end

function config.autopairs()
  local autopairs = require('nvim-autopairs')
  local Rule = require('nvim-autopairs.rule')

  autopairs.setup()

  autopairs.add_rules {
    Rule(' ', ' ')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
    Rule('( ', ' )')
    :with_pair(function() return false end)
    :with_move(function(opts)
      return opts.prev_char:match('.%)') ~= nil
    end)
    :use_key(')'),
    Rule('{ ', ' }')
    :with_pair(function() return false end)
    :with_move(function(opts)
      return opts.prev_char:match('.%}') ~= nil
    end)
    :use_key('}'),
    Rule('[ ', ' ]')
    :with_pair(function() return false end)
    :with_move(function(opts)
      return opts.prev_char:match('.%]') ~= nil
    end)
    :use_key(']')
  }

  require('nvim-autopairs.completion.compe').setup {
    map_cr = true,
    map_complete = true
  }
end

return config
