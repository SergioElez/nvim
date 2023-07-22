return {
  {
    -- Colorscheme
    'SergioElez/molokai.nvim',
      priority = 1000,
      config = function()
        vim.cmd.colorscheme 'molokai'
      end,
  },
  -- Rainbow Bracket
  {'HiPhish/nvim-ts-rainbow2'},
  -- {
    -- "nvim-treesitter/nvim-treesitter",
    -- opts = function(_, opts)
      -- if type(opts.ensure_installed) == "table" then
        -- vim.list_extend(opts.ensure_installed, { "json", "json5", "jsonc", "java" })
      -- end
    -- end,
  -- },
  -- TODO
  {
    "AmeerTaweel/todo.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
        require("todo").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    end
  },
  
  -- {
    -- 'mfussenegger/nvim-dap',
    -- config = function() require('config/nvim-dap') end,
  -- },
  {
    'mfussenegger/nvim-dap',
    pin = true,
    dependencies = {
        {'nvim-telescope/telescope-dap.nvim', pin = true},
        {'theHamsta/nvim-dap-virtual-text', pin = true},
        {'rcarriga/nvim-dap-ui', pin = true},
        {'mxsdev/nvim-dap-vscode-js', pin = true},
    },
    config = function()
        require('config/nvim-dap')
    end,
  },
  -- { "rcarriga/nvim-dap-ui"},
  -- OTROS PLUGINS
  'aklt/plantuml-syntax',
  'bronson/vim-visual-star-search',
  {
    'chentoast/marks.nvim',
    config = function ()
      require("marks").setup()
    end
  },
  'godlygeek/tabular',
  'itspriddle/vim-marked',
  'ludovicchabant/vim-gutentags',
  'mfussenegger/nvim-jdtls',
  -- 'neovim/nvim-lspconfig',
  'nvim-lua/plenary.nvim',
  'tpope/vim-commentary',
  'tpope/vim-fugitive',
  'tpope/vim-repeat',
  'tpope/vim-rhubarb',
  'tpope/vim-surround',
  'tpope/vim-unimpaired',
  'tyru/open-browser.vim',
  'andymass/vim-matchup',
  'vim-test/vim-test',
  'weirongxu/plantuml-previewer.vim',
  {
    'folke/trouble.nvim',
    config = function()
      require("trouble").setup({
        mode = "document_diagnostics"
      })
    end
  },
  {
    'folke/which-key.nvim',
    config = function()
      require("which-key").setup()
    end
  },
  -- {
    -- 'gelguy/wilder.nvim',
    -- config = function() require('config/wilder') end,
  -- },
  {
    -- 'goolord/alpha-nvim',
    -- event = "VimEnter",
    -- dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- config = function ()
    --     require('alpha').setup(require'alpha.themes.startify'.config)
    -- end

    "SergioElez/startup.nvim",
    requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    config = function()
      require"startup".setup()
    end
  },
  -- AUTOCOMPLETADO DE CODIGO
  -- {
    -- 'hrsh7th/nvim-cmp',
    -- dependencies = {
      -- 'hrsh7th/cmp-nvim-lsp',
      -- 'hrsh7th/cmp-nvim-lsp-signature-help',
      -- 'hrsh7th/cmp-vsnip',
      -- 'hrsh7th/vim-vsnip',
      -- 'onsails/lspkind.nvim',
    -- },
    -- config = function() require('config/nvim-cmp') end,
  -- },
  
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      -- local defaults = require("cmp.config.default")()
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          -- format = function(_, item)
            -- local icons = require("lazyvim.config").icons.kinds
            -- if icons[item.kind] then
              -- item.kind = icons[item.kind] .. item.kind
            -- end
            -- return item
          -- end,
        },
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
        -- sorting = defaults.sorting,
      }
    end,
  },
  {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    config = function ()
      require('fidget').setup()
    end
  },
 
  -- {
    -- 'navarasu/onedark.nvim',
    -- config = function()
      -- require('onedark').load()
    -- end
  -- },

  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-telescope/telescope-dap.nvim',
      -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function() require('config/telescope') end,
  },
  {
    'nvim-tree/nvim-web-devicons',
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = function() require('config/nvim-treesitter') end,
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "json", "json5", "jsonc"})
      end
    end,
  },
  {
    'preservim/vim-pencil',
    dependencies = {
      'preservim/vim-litecorrect',
      'kana/vim-textobj-user',
      'preservim/vim-textobj-quote',
      'preservim/vim-textobj-sentence',
    },
    config = function()
      local augroup = vim.api.nvim_create_augroup
      local autocmd = vim.api.nvim_create_autocmd
      augroup('pencil', { clear = true })
      autocmd('FileType', {
        group = 'pencil',
        pattern = { "markdown" ,"text" },
        callback = function()
          vim.cmd("call pencil#init({'wrap': 'hard'})")
          vim.cmd("call litecorrect#init()")
          vim.cmd("call textobj#quote#init()")
          vim.cmd("call textobj#sentence#init()")
        end
      })
    end
  },
  {
    'simrat39/symbols-outline.nvim',
    config = function()
      require("symbols-outline").setup {
        auto_close = true,
      }
    end
  },
  {
    'SergioElez/nvim-wildcat',
    lazy = true,
    cmd = { "WildcatRun", "WildcatUp", "WildcatInfo" },
    dependencies = { 'caosystema/nvim-popcorn' },
    config = function()
      require'wildcat'.setup{
        tomcat = {
            home = "CATALINA_HOME",
            default = true
        }
    }
    end
  },
  -- {
  --   'stevearc/oil.nvim',
  --   config = function()
  --     require("oil").setup({})
  --   end
  -- },
  {'rcarriga/cmp-dap'},
  {'preservim/nerdtree'},
  {
    'neovim/nvim-lspconfig',
    dependencies = {
        {'williamboman/mason.nvim', pin = true},
        {'williamboman/mason-lspconfig.nvim', pin = true},
        {'jose-elias-alvarez/null-ls.nvim', pin = true},
        -- TypeScript development
        -- TODO: jose-elias-alvarez/typescript.nvim
        {'jose-elias-alvarez/nvim-lsp-ts-utils', pin = true},
        {'simrat39/rust-tools.nvim', pin = true},
    },
    config = function()
        -- Install and set up language servers.
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'cssls',
        'eslint',
        'gradle_ls',
        'html',
        'jdtls',
        'jsonls',
        'rust_analyzer',
        'lua_ls',
        'tsserver',
    },
    automatic_installation = true,
    })
    end,
  },
  -- {'theHamsta/nvim-dap-virtual-text',
  --   config = function()
  --     require("nvim-dap-virtual-text").setup {
  --       enabled = true,                        -- enable this plugin (the default)
  --       enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
  --       highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
  --       highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
  --       show_stop_reason = true,               -- show stop reason when stopped for exceptions
  --       commented = false,                     -- prefix virtual text with comment string
  --       only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
  --       all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
  --       clear_on_continue = false,             -- clear virtual text on "continue" (might cause flickering when stepping)
  --       --- A callback that determines how a variable is displayed or whether it should be omitted
  --       --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
  --       --- @param buf number
  --       --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
  --       --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
  --       --- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
  --       --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
  --       display_callback = function(variable, buf, stackframe, node, options)
  --         if options.virt_text_pos == 'inline' then
  --           return ' = ' .. variable.value
  --         else
  --           return variable.name .. ' = ' .. variable.value
  --         end
  --       end,
  --       -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
  --       virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',
    
  --       -- experimental features:
  --       all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
  --       virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
  --       virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
  --                                              -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
  --   }
  -- }
  -- INTERFAZ UI
  {
    'stevearc/dressing.nvim',
    config = function()
        require('dressing').setup({
            input = {
                insert_only = true,
            },
            select = {
                backend = { 'telescope', 'fzf', 'nui', 'builtin' },
                telescope = nil
            },
        })
    end,
  },
  {
    'RRethy/vim-illuminate',
    config = function()
      require('illuminate').configure({
        providers = {
            'lsp',
            'treesitter',
            'regex',
        },
        delay = 100,
        filetypes_denylist = {
            'dirvish',
            'fugitive',
        },
        under_cursor = true,
        large_file_cutoff = nil,
        large_file_overrides = nil,
        min_count_to_highlight = 1,
      })
    end,
  }, 
  {
    'gelguy/wilder.nvim',
    config = function() require('config/wilder') end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      cmdline = {
        enabled = false
      }
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      }
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function() require('config/lualine') end,
  },
}

