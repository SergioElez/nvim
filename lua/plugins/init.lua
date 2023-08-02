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
  -- TODO
  {
    "AmeerTaweel/todo.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
        require("todo").setup {
        }
    end
  },
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
  -- 'ludovicchabant/vim-gutentags',
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
    'm4xshen/autoclose.nvim',
    config = function ()
      require("autoclose").setup({
        keys = {
           ["$"] = { escape = true, close = true, pair = "$$", disabled_filetypes = {} },
        },
     })
    end
  },
  { 'anuvyklack/pretty-fold.nvim',
   config = function()
      require('pretty-fold').setup({
        config = {
          sections = {
             left = {
                'content',
             },
             right = {
                ' ', 'number_of_folded_lines', ': ', 'percentage', ' ',
                function(config) return config.fill_char:rep(3) end
             }
          },
          fill_char = '•',
       
          remove_fold_markers = true,
       
          -- Keep the indentation of the content of the fold string.
          keep_indentation = true,
       
          -- Possible values:
          -- "delete" : Delete all comment signs from the fold string.
          -- "spaces" : Replace all comment signs with equal number of spaces.
          -- false    : Do nothing with comment signs.
          process_comment_signs = 'spaces',
       
          -- Comment signs additional to the value of `&commentstring` option.
          comment_signs = {},
       
          -- List of patterns that will be removed from content foldtext section.
          stop_words = {
             '@brief%s*', -- (for C++) Remove '@brief' and all spaces after.
          },
       
          add_close_pattern = true, -- true, 'last_line' or false
       
          matchup_patterns = {
             {  '{', '}' },
             { '%(', ')' }, -- % to escape lua pattern char
             { '%[', ']' }, -- % to escape lua pattern char
             { 'import ', ';' }, -- % to escape lua pattern char
          },
       
          ft_ignore = { 'neorg' },
       }
      })
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
              'java-test',
              'java-debug-adaptor',
              'jsonls',
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
        delay = 800,
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
  -- TERMINAL
  {'SergioElez/toggleterm.nvim', version = "*", event = 'VeryLazy', -- terminal handling
  config = function() require('toggleterm').setup{
      open_mapping = [[\]],
      terminal_mappings = true, -- close by typing \
      insert_mappings = false,
      direction = 'float', 
      size = 80, 
      auto_scroll = true,
      close_on_exit = true,
      shade_terminals = false,
      float_opts = {
        border='curved'
      },
      highlights = {
        FloatBorder = {
          guifg = "#6694EF",
          -- guibg = "#2f3336"
        }
      },
    } end
  },
  {
    'chomosuke/term-edit.nvim',
    ft = 'toggleterm',
    version = '1.*',
  },
  'norcalli/nvim-colorizer.lua',
  {'Pocco81/HighStr.nvim',
     config = function()
      local high_str = require("high-str")

      high_str.setup({
      	verbosity = 0,
      	saving_path = "/tmp/highstr/",
      	highlight_colors = {
      		-- color_id = {"bg_hex_code",<"fg_hex_code"/"smart">}
      		color_0 = {"#6694EF", "smart"},	-- Cosmic charcoal
      	}
      })
    end
  },
  {'barklan/capslock.nvim',
  config = function()
    require("capslock").setup({
      -- MAPEAR EN AUTOHOTKEY EL CAPSLOCK A F12
      vim.keymap.set({ "i", "c", "n" }, "<F12>", "<Plug>CapsLockToggle")
    })
  end
  },
  {
    "jackMort/ChatGPT.nvim",
      event = "VeryLazy",
      config = function()
        require("chatgpt").setup()
      end,
      dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
      }
  }
}

