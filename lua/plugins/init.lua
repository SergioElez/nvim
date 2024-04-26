-- prueba
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
        {'nvim-neotest/nvim-nio', pin = true},
        {'mxsdev/nvim-dap-vscode-js', pin = true},
    },
    config = function()
        require('config/nvim-dap')
    end,
  },
  {
    'niuiic/dap-utils.nvim',
    pin = true,
    dependencies = {
        {'niuiic/core.nvim', pin = true},
    },
    config = function()
      require("dap-utils").setup({
        javascript = function(run)
          local core = require("core")
          run({
            {
              name = "Launch project",
              type = "pwa-node",
              request = "launch",
              cwd = "${workspaceFolder}",
              runtimeExecutable = "pnpm",
              runtimeArgs = {
                "debug",
              },
            },
            {
              name = "Launch cmd",
              type = "pwa-node",
              request = "launch",
              cwd = core.file.root_path(),
              runtimeExecutable = "pnpm",
              runtimeArgs = {
                "debug:cmd",
              },
            },
            {
              name = "Launch file",
              type = "pwa-node",
              request = "launch",
              program = "${file}",
              cwd = "${workspaceFolder}",
            },
            {
              name = "Attach",
              type = "pwa-node",
              request = "attach",
              processId = require("dap.utils").pick_process,
              cwd = "${workspaceFolder}",
            },
          })
        end,
      })
      
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup {
        enabled = true,                        -- enable this plugin (the default)
        enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
        highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
        highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
        show_stop_reason = true,               -- show stop reason when stopped for exceptions
        commented = false,                     -- prefix virtual text with comment string
        only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
        all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
        clear_on_continue = false,             -- clear virtual text on "continue" (might cause flickering when stepping)
        --- A callback that determines how a variable is displayed or whether it should be omitted
        --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
        --- @param buf number
        --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
        --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
        --- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
        --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
        display_callback = function(variable, buf, stackframe, node, options)
          if options.virt_text_pos == 'inline' then
            return ' = ' .. variable.value
          else
            return variable.name .. ' = ' .. variable.value
          end
        end,
        -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
        virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',
    
        -- experimental features:
        all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
        virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
        virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
                                               -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
    }
    end
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"), -- directory where session files are saved
      options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
      pre_save = nil, -- a function to call before saving the session
      save_empty = false, -- don't save if there are no open file buffers
    }
  },
  -- {
  --   "niuiic/multiple-session.nvim",
  --   config = function()
  --     -- default config
  --     require("multiple-session").setup({
  --     	-- used to search root path of the project
  --     	-- if .git does not exist, current directory path would be used
  --     	root_pattern = ".git",
  --     	-- where to store session
  --     	session_dir = function(project_root)
  --     		return project_root .. "/.nvim/session"
  --     	end,
  --     	-- name of default session
  --     	default_session = "default",
  --     	-- whether to auto load session when neovim start
  --     	auto_load_session = function(_, cur_session_path)
  --     		if #vim.v.argv > 2 then
  --     			return false
  --     		end
      
  --     		-- detect whether in a nested instance
  --     		if vim.env.NVIM then
  --     			return false
  --     		end
      
  --     		local core = require("core")
  --     		if not core.file.file_or_dir_exists(cur_session_path) then
  --     			return false
  --     		end
      
  --     		return true
  --     	end,
  --     	-- whether to auto save session when neovim exits
  --     	auto_save_session = function(_, cur_session_path)
  --     		if #vim.v.argv > 2 then
  --     			return false
  --     		end
      
  --     		if vim.env.NVIM then
  --     			return false
  --     		end
      
  --     		local core = require("core")
  --     		if not core.file.file_or_dir_exists(cur_session_path) then
  --     			return false
  --     		end
      
  --     		return true
  --     	end,
  --     	---@type fun(session_dir: string)
  --     	on_session_to_save = function() end,
  --     	---@type fun(session_dir: string)
  --     	on_session_saved = function() end,
  --     	---@type fun(session_dir: string)
  --     	on_session_to_restore = function() end,
  --     	---@type fun(session_dir: string)
  --     	on_session_restored = function() end,
  --     })
  --   end
  -- },
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
      require("which-key").setup({
        icons = {
          group = "󰷏 ",
          separator = "➜ "
        }
      })
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
  {'rcarriga/cmp-dap'},
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require'colorizer'.setup({'*'})
    end
  },
  -- Scroll
  {
    'karb94/neoscroll.nvim',
    config = function()
      require'neoscroll'.setup({
        })
    end
  },
  {
    'petertriho/nvim-scrollbar',
    config = function()
      require'scrollbar'.setup({
        marks = {
          Cursor = {
              text = "",
          },
          Info = { color = "#ff0000"},
          Hint = { color = "#ff0000"},
        }
        })
    end
  },
  {
    'nvim-tree/nvim-web-devicons',
    config = function() require('config/nvim-web-devicons') end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "echasnovski/mini.base16",
      "antosha417/nvim-lsp-file-operations",
    },
    config = function() require('config/nvim-tree') end,
  },
  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        keymaps = {
          ["<space>"] = "actions.select",
          ["<CR>"] = "actions.select"
        },
        skip_confirm_for_simple_edits = true,
        float = {
          padding = 2,
          max_width = 100,
          max_height = 20,
          border = "rounded",
          win_options = {
            winblend = 10,
          },
          override = function(conf)
            return conf
          end,
        },
      })
    end
  },
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
    -- 'nvim-tree/nvim-web-devicons',
    'ryanoasis/vim-devicons',
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
            'NvimTree',
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
      routes = {
        {
        -- Quita el aviso de cuando guardas
          filter = {
            event = "msg_show",
            kind = "",
            find = "escritos",
          },
          -- Quita el aviso de cuando abres un archivo
          filter = {
            event = "msg_show",
            kind = "",
            find = "--",
          },
          opts = { skip = true },
        },
      },
      notify = {
        enabled = false,
        view = "notify",
      },
      lsp = {
        message = { enabled = false},
        progress = {
          enabled = false}
      },
      cmdline = {
        enabled = false
      },
      presets = {
        long_message_to_split = true
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
		'akinsho/bufferline.nvim',
		event = 'VeryLazy',
		opts = {
			options = {
				mode = 'buffers',
				separator_style = 'slant',
				show_close_icon = false,
				show_buffer_close_icons = false,
				diagnostics = 'nvim_lsp',
				showtabline = 2,
				show_tab_indicators = true,
				enforce_regular_tabs = true,
				always_show_bufferline = false,
				-- indicator = {
				-- 	style = 'underline',
				-- },
				
				-- ESTO PETA
				-- diagnostics_indicator = function(_, _, diag)
					-- local icons = require('lazyvim.config').icons.diagnostics
					-- local ret = (diag.error and icons.Error .. diag.error .. ' ' or '')
						-- .. (diag.warning and icons.Warn .. diag.warning or '')
					-- return vim.trim(ret)
				-- end,
				custom_areas = {
					right = function()
						local result = {}
						local root = LazyVim.root()
						table.insert(result, {
							text = '%#BufferLineTab# ' .. vim.fn.fnamemodify(root, ':t'),
						})

						-- Session indicator
						if vim.v.this_session ~= '' then
							table.insert(result, { text = '%#BufferLineTab#  ' })
						end
						return result
					end,
				},
				offsets = {
					{
						filetype = 'neo-tree',
						text = 'Neo-tree',
						highlight = 'Directory',
						text_align = 'center',
					},
				},
			},
		},
		config = function(_, opts)
			require('bufferline').setup(opts)
			-- Fix bufferline when restoring a session
			vim.api.nvim_create_autocmd('BufAdd', {
				callback = function()
					vim.schedule(function()
						---@diagnostic disable-next-line: undefined-global
						pcall(nvim_bufferline)
					end)
				end,
			})
		end,
	},
  {
    "nanozuki/tabby.nvim",
      config = function()
        local theme = {
          fill = 'TabLineFill',
          head = 'TabLine',
          current_tab = 'TabLineSel',
          tab = 'TabLine',
          win = 'TabLine',
          tail = 'TabLine',
        }
        require('tabby.tabline').set(function(line)
          return {
            {
              { ' 󰓩 ', hl = theme.head },
              line.sep('', theme.head, theme.fill),
            },
            line.tabs().foreach(function(tab)
              local hl = tab.is_current() and theme.current_tab or theme.tab
              return {
                line.sep('', hl, theme.fill),
                tab.is_current() and '' or '',
                tab.number(),
                tab.name(),
                tab.close_btn(''),
                line.sep(' ', hl, theme.fill),
                hl = hl,
                margin = ' ',
              }
            end),
            -- line.spacer(),
            -- line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
              -- return {
                -- line.sep('', theme.win, theme.fill),
                -- win.is_current() and '' or '',
                -- win.buf_name(),
                -- line.sep('', theme.win, theme.fill),
                -- hl = theme.win,
                -- margin = '   ',
              -- }
            -- end),
            -- {
              -- line.sep('', theme.tail, theme.fill),
              -- { '  ', hl = theme.tail },
            -- },
            -- hl = theme.fill,
          }
        end)

      end
  },
  {
    "TC72/telescope-tele-tabby.nvim",
      config = function()
        require('telescope').setup {
          extensions = {
              tele_tabby = {
                  use_highlighter = true,
              }
          }
        }
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
      keep_indentation = false,
      fill_char = ' ',
      sections = {
         left = {
            '', function() return string.rep('', vim.v.foldlevel) end, '', 'content', ' '
         },
         right = {
            ' ', 'number_of_folded_lines', ': ', 'percentage', '   ',
         }
      },
      process_comment_signs = 'spaces',
    })
   end
  },
  -- GIT
  {
    'sindrets/diffview.nvim',
    config = function ()
      local actions = require("diffview.actions")
      function gitCommit()

        local result = vim.fn.systemlist('git cherry -v')

        local cont_commits_to_push = 0;
        for _, line in ipairs(result) do
          cont_commits_to_push = cont_commits_to_push + 1;
        end

        vim.cmd('botright Git commit')
        total_commits = cont_commits_to_push + 1
      end
      require("diffview").setup({
        keymaps = {
          file_panel = {
            { "n", "<Space>",           actions.select_entry,                   { desc = "Open the diff for the selected entry" } },
            { "n", "F",                 actions.close_fold,                     { desc = "Collapse fold" } },
            { "n", "h",                 actions.open_fold,                      { desc = "Open fold" } },
            { "n", "C",                 gitCommit,                              { desc = "Git commit" } },
            { "n", "<CR>",              actions.toggle_stage_entry,             { desc = "Stage / unstage the selected entry" } },
          },
        }
      })
    end
  },
}

