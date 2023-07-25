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
  'neovim/nvim-lspconfig',
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
  {
    -- 'goolord/alpha-nvim',
    -- event = "VimEnter",
    -- dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- config = function ()
    --     require('alpha').setup(require'alpha.themes.startify'.config)
    -- end

    "SergioElez/startup.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    config = function()
      require"startup".setup()
    end
  },
  -- AUTOCOMPLETADO DE CODIGO
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'onsails/lspkind.nvim',
    },
    config = function() require('config/nvim-cmp') end,
  },
  {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    config = function ()
      require('fidget').setup()
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-telescope/telescope-dap.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function() require('config/telescope') end,
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
    'Weissle/persistent-breakpoints.nvim',
    config = function()
      require('persistent-breakpoints').setup{
        load_breakpoints_event = { "BufReadPost" }
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
  -- INTERFAZ UI
  {
    'nvim-tree/nvim-web-devicons',
    -- 'ryanoasis/vim-devicons',
  },
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
      },
      messages = {
        enabled = true, -- enables the Noice messages UI
        view = "notify", -- default view for messages
        -- view = "false", -- default view for messages
        view_error = "notify", -- view for errors
        view_warn = "notify", -- view for warnings
        view_history = "messages", -- view for :messages
        view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
      },

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
  -- Ctrl + Scroll
  {
    'tenxsoydev/size-matters.nvim',
    config = function() 
      require("size-matters").setup({
        default_mappings = true,
        -- font resize step size
        step_size = 1,
        notifications = {
          enable = true,
          timeout = 150,
          delay = 300,
        },
        -- the font loaded when using the reset cmd / shortcut
        reset_font = vim.api.nvim_get_option("guifont")
      })
    end
  },
  {'akinsho/toggleterm.nvim', version = "*", event = 'VeryLazy', -- terminal handling
  config = function() require('toggleterm').setup{
      open_mapping = [[\]], -- open with double backslash
      terminal_mappings = true, -- close by typing \\
      insert_mappings = false, -- i sometimes actually do have to type \\
      direction = 'float', -- open on right by default
      size = 80, -- by default he teeny!!
      auto_scroll = true,
      float_opts = {
        border='curved'
      }
  } end
  }, 
}

