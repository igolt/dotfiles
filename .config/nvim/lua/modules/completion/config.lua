local config = {}

function config.nvim_cmp()
  local cmp = require'cmp'
  local lspkind = require('lspkind')

  cmp.setup {
    formatting = {
      format = lspkind.cmp_format(),
    },
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'buffer' },
    }
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

  require("nvim-autopairs.completion.cmp").setup({
    map_cr = true,
    map_complete = true,
    auto_select = true,
    insert = false,
    map_char = {
      all = '(',
      tex = '{'
    }
  })
end

return config
