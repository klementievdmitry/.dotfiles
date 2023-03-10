
return {
  -- Speed up loading Lua modules in Neovim to improve startup time
  'lewis6991/impatient.nvim',

  {
    -- 'folke/tokyonight.nvim',
    'Mofiqul/vscode.nvim',
    lazy = false,
    prioriry = 1000,
    config = function()
      vim.cmd('colorscheme vscode')
    end
  },

  {
    'ojroques/nvim-bufdel',
    cmd = 'BufDel',
    opts = {},
  },

  {
    'folke/which-key.nvim',
    opts = {},
    event = 'BufReadPost',
  },
  { 'chaoren/vim-wordmotion', event = 'VeryLazy' },
  {
    'ggandor/leap.nvim',
    event = 'VeryLazy',
    dependencies = 'tpope/vim-repeat',
    config = function()
      local map = vim.api.nvim_set_keymap
      -- 2-character Sneak (default)
      local opts = { noremap = false }
      map('n', 'z', '<Plug>(leap-forward-x)', opts)
      map('n', 'Z', '<Plug>(leap-backward-x)', opts)

      -- visual-mode
      map('x', 'z', '<Plug>(leap-forward-x)', opts)
      map('x', 'Z', '<Plug>(leap-backward-x)', opts)

      -- operator-pending-mode
      map('o', 'z', '<Plug>(leap-forward-x)', opts)
      map('o', 'Z', '<Plug>(leap-backward-x)', opts)
    end,
  },

  {
    'TimUntersberger/neogit',
    cmd = 'Neogit',
    config = function ()
      require 'config.neogit'
    end
  },

  {
    'windwp/nvim-autopairs',
    event = 'VeryLazy',
    config = function()
      require('nvim-autopairs').setup {
        disable_filetypes = { 'TelescopePrompt', 'vim' },
      }
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'RRethy/nvim-treesitter-textsubjects',
      'RRethy/nvim-treesitter-endwise',
    },
    build = ':TSUpdate',
    event = 'VeryLazy',
  },

  {
    'LhKipp/nvim-nu',
    config = function()
      vim.cmd('TSInstall nu')
      require('nu').setup {}
    end,
    ft = { 'nu' },
  },
  
  {
    'ziglang/zig.vim',
    ft = { 'zig', 'zir' },
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'VeryLazy',
    dependencies = 'nvim-treesitter',
    config = function()
      require('indent_blankline').setup {
        char = '???',
        space_char_blankline = ' ',
        use_treesitter = true,
        show_first_indent_level = false,
        show_trailing_blankline_indent = false,
        show_current_context = true,
        use_treesitter_scope = false,
        filetype_exclude = { 'startify' },
        context_patterns = {
          '^for',
          '^func',
          '^if',
          '^object',
          '^table',
          '^while',
          'argument_list',
          'arguments',
          'block',
          'catch_clause',
          'class',
          'dictionary',
          'do_block',
          'element',
          'else_clause',
          'except',
          'for',
          'function',
          'if_statement',
          'import_statement',
          'method',
          'object',
          'operation_type',
          'return',
          'table',
          'try',
          'try_statement',
          'tuple',
          'while',
          'with',
        },
      }
    end,
  },

  {
    'folke/lsp-colors.nvim',
    opts = {
      Error = "#db4b4b",
      Warning = "#e0af68",
      Information = "#0db9d7",
      Hint = "#10B981",
    },
  },

  {
    'nathom/filetype.nvim',
    lazy = 'VeryLazy',
    opts = {
      overrides = {
        complex = {
            ['SCons*'] = 'python',
        },
      },
    }
  },

  {
    'folke/noice.nvim',
    opts = {
      views = { mini = { lang = 'markdown' } },
      routes = {
        {
          filter = {
            event = 'msg_show',
            kind = '',
            find = 'written',
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = 'lsp',
            kind = 'progress',
            find = 'null-l',
          },
          opts = { skip = true, stop = true },
        },
        {
          view = 'notify',
          filter = { event = 'msg_showmode' },
        },
      },
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true,
      },
    },
    dependencies = { 'MunifTanjim/nui.nvim' },
    event = 'VeryLazy',
  },

  {
    'ggandor/flit.nvim',
    opts = { labeled_modes = 'nv' },
    event = 'VeryLazy',
  },
  { 'Olical/vim-enmasse', cmd = 'EnMasse' },

  {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
  },

  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    opts = {},
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'telescope-fzf-native.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
    },
    init = function()
      require 'config.telescope_setup'
    end,
    config = function()
      require 'config.telescope'
    end,
    cmd = 'Telescope',
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  'crispgm/telescope-heading.nvim',
  'nvim-telescope/telescope-file-browser.nvim',

  { 'gpanders/nvim-parinfer', ft = { 'lisp', 'fennel', 'clojure', 'racket', 'pddl' } },
  'L3MON4D3/LuaSnip',
  { 'rafamadriz/friendly-snippets', lazy = false },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'onsails/lspkind.nvim',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'saadparwaiz1/cmp_luasnip',
      'lukas-reineke/cmp-under-comparator',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      'doxnit/cmp-luasnip-choice',
    },
    config = function()
      require 'config.cmp'
    end,
    event = 'InsertEnter',
  },
  
  'p00f/clangd_extensions.nvim',
  {
    'simrat39/rust-tools.nvim',
    ft = 'rust',
    opts = {},
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    init = function()
      vim.g.neo_tree_remove_legacy_commands = true
      vim.keymap.set('n', '<c-n>', ':Neotree toggle<CR>', { silent = true })
    end,
    cmd = 'Neotree',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
  },

  {
    'lewis6991/gitsigns.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require 'config.gitsigns'
    end,
    event = 'VeryLazy',
  },

  'kyazdani42/nvim-web-devicons',

  'jose-elias-alvarez/null-ls.nvim',
  'folke/neodev.nvim',
  'neovim/nvim-lspconfig',

  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = { open_mapping = [[<c-\>]] },
    keys = [[<c-\>/]],
  },

  {
    'lewis6991/hover.nvim',
    event = 'BufReadPost',
    config = function()
      require('hover').setup {
        init = function()
          require 'hover.providers.lsp'
        end,
      }

      vim.keymap.set('n', 'K', require('hover').hover, { desc = 'hover.nvim' })
      vim.keymap.set('n', 'gK', require('hover').hover_select, { desc = 'hover.nvim (select)' })
    end,
  },

  {
    'DNLHC/glance.nvim',
    cmd = 'Glance',
    config = function()
      require('glance').setup {
        border = { enable = true, top_char = '???', bottom_char = '???' },
        theme = { mode = 'brighten' },
        indent_lines = { icon = '???' },
        winbar = { enable = true },
      }
    end,
  },

  {
    'smjonas/inc-rename.nvim',
    opts = {},
    event = 'BufReadPost',
  },

  {
    'folke/trouble.nvim',
    cmd = 'Trouble',
    opts = {},
  },

  {
    'danymat/neogen',
    dependencies = 'nvim-treesitter',
    config = function()
      require 'config.neogen'
    end,
    keys = { '<localleader>d', '<localleader>df', '<localleader>dc' },
  },

  {
    'mfussenegger/nvim-dap',
    init = function()
      require 'config.dap_setup'
    end,
    config = function()
      require 'config.dap'
    end,
    dependencies = 'jbyuki/one-small-step-for-vimkind',
    cmd = { 'BreakpointToggle', 'Debug', 'DapREPL' },
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = 'nvim-dap',
    opts = {},
  },

  {
    'lervag/vimtex',
    init = function()
      local g = vim.g
      g.vimtex_complete_recursive_bib = 1
      g.vimtex_complete_enabled = 1
      g.vimtex_quickfix_method = 'pplatex'
      g.tex_conceal = ''
      g.vimtex_quickfix_mode = 0
      g.vimtex_view_forward_search_on_start = 0
      g.vimtex_view_method = 'sioyek'
      -- g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
      -- g.vimtex_compiler_latexrun = { options = { '-verbose-cmds', '--latex-args="-synctex=1"', '--bibtex-cmd=biber' } }
      -- This must be a dictionary, and {} gets converted to a list
      g.vimtex_syntax_conceal_disable = 1
    end,
    -- ft = 'tex',
    lazy = false,
  },

  'barreiroleo/ltex_extra.nvim',
  'igankevich/mesonic',
  {
    'Shatur/neovim-cmake',
    dependencies = { 'nvim-lua/plenary.nvim', 'mfussenegger/nvim-dap' },
    cmd = 'CMake',
  },

  {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime',
    init = function()
      vim.g.startuptime_tries = 15
    end,
  },

  {
    'NvChad/nvim-colorizer.lua',
    ft = { 'css', 'javascript', 'vim', 'html', 'lua' },
    opts = {},
  },

  {
    'b0o/incline.nvim',
    config = function()
      require 'config.incline'
    end,
    event = 'VeryLazy',
  },

  'teal-language/vim-teal',

  {
    'stevearc/aerial.nvim',
    opts = {
      backends = { 'lsp', 'treesitter', 'markdown', 'man' },
      on_attach = function(bufnr)
        vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
        vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
      end,
    },
    event = 'VeryLazy',
  },
  {
    'folke/todo-comments.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    event = 'BufReadPost',
    opts = {},
  },
  {
    'ethanholz/nvim-lastplace',
    config = function()
      require('nvim-lastplace').setup {}
      vim.api.nvim_exec_autocmds('BufWinEnter', { group = 'NvimLastplace' })
    end,
    event = 'User ActuallyEditing',
  },

  {
    'beauwilliams/focus.nvim',
    opts = { excluded_filetypes = { 'toggleterm', 'TelescopePrompt' }, signcolumn = false },
    event = 'VeryLazy',
  },
  {
    'hkupty/iron.nvim',
    cmd = { 'IronRepl', 'IronFocus' },
    init = function()
      vim.keymap.set('n', '<leader>rs', '<cmd>IronRepl<cr>')
      vim.keymap.set('n', '<leader>rr', '<cmd>IronRestart<cr>')
      vim.keymap.set('n', '<leader>rf', '<cmd>IronFocus<cr>')
      vim.keymap.set('n', '<leader>rh', '<cmd>IronHide<cr>')
    end,
    dependencies = 'which-key.nvim',
    config = function()
      require('iron.core').setup {
        config = {
          repl_open_cmd = require('iron.view').right '40%',
          repl_definition = {
            python = require('iron.fts.python').ptipython,
            ocaml = require('iron.fts.ocaml').utop,
            lua = { command = 'croissant' },
          },
          highlight = { italic = true },
        },
        keymaps = {
          send_motion = '<c-c>',
          visual_send = '<c-cr>',
          send_file = '<leader>rsf',
          send_line = '<c-cr>',
          send_mark = '<leader>rsm',
          mark_motion = '<leader>rmc',
          mark_visual = '<leader>rmc',
          remove_mark = '<leader>rmd',
          cr = '<leader>r<cr>',
          interrupt = '<leader>ri<leader>',
          exit = '<leader>rq',
          clear = '<leader>rc',
        },
      }
    end,
  },

  {
    "nvim-neorg/neorg",
    ft = "norg",
    opts = {},
  },
}

