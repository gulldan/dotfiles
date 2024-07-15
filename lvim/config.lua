lvim.builtin.which_key.mappings["lb"] = {
  "<cmd>LspRestart<CR>", "Restart"
}

vim.opt.conceallevel=2
vim.opt.relativenumber = true
lvim.builtin.which_key.mappings["to"] = {
  "<cmd>:sp|te<CR>:resize 11<CR>", "Terminal open"
}

lvim.builtin.which_key.mappings["dt"] = {
  "<cmd>:GoBreakToggle<CR>", "Toggle breakpoint"
}

lvim.builtin.which_key.mappings["gm"] = {
  "<cmd>:GitConflictListQf<CR>", "Get all conflict to quickfix"
}

lvim.builtin.which_key.mappings["gt"] = {
  "<cmd>:GitBlameToggle<CR>", "Toggle Git Blame"
}

lvim.builtin.which_key.mappings["ga"] = {
  "<cmd>:silent !git add %<CR>", "Git add current file"
}

lvim.builtin.which_key.mappings["o"] = {
  "Obsidian"
}

lvim.builtin.which_key.mappings["os"] = {
  "<cmd>:ObsidianSearch<CR>", "search note"
}

lvim.builtin.which_key.mappings["on"] = {
  "New note"
}

lvim.builtin.which_key.mappings["oc"] = {
  "<cmd>:ObsidianOpen<CR>", "Open current file in obsidian"
}

lvim.builtin.which_key.mappings["ond"] = {
  "<cmd>:silent :ObsidianToday<CR>", "Add new daily note"
}

lvim.builtin.which_key.mappings["ot"] = {
  "<cmd>:ObsidianToggleCheck<CR>", "Toggle checkbox"
}

lvim.builtin.which_key.mappings["bc"] = {
  "<cmd>:write|%bdelete|edit #|normal`<CR>", "Close and write all unactive buffers"
}
--
------------------------
-- Treesitter
------------------------
lvim.builtin.treesitter.ensure_installed = {
  "go",
  "gomod",
}

lvim.builtin.nvimtree.setup.view.preserve_window_proportions = true
lvim.builtin.nvimtree.setup.diagnostics.show_on_dirs = true

------------------------
-- Plugins
------------------------
lvim.plugins = {
  'nvim-treesitter/nvim-treesitter',
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   tag = "0.1.5",
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'jonarrien/telescope-cmdline.nvim',
  --   },
  --   keys = {
  --     { ':', '<cmd>Telescope cmdline<cr>', desc = 'Cmdline' }
  --   },
  --   opts = {
  --     extensions = {
  --       cmdline = {
  --       },
  --     }
  --   },
  -- },
  'mfussenegger/nvim-dap',
  'rcarriga/nvim-dap-ui',
  "neovim/nvim-lspconfig",
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  'https://codeberg.org/esensar/nvim-dev-container',
  {
    "sindrets/diffview.nvim",
    config = function ()
      require('diffview').setup({
        highlights = false,
      })
    end,
  },
  "ray-x/lsp_signature.nvim",
  "terryma/vim-multiple-cursors",
  {
    "akinsho/git-conflict.nvim",
    config = function()
      require('git-conflict').setup({
      default_mappings = true, -- disable buffer local mapping created by this plugin
      default_commands = true, -- disable commands created by this plugin
      disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
      list_opener = 'copen', -- command or function to open the conflicts list
      highlights = { -- They must have background color, otherwise the default color will be used
        incoming = 'DiffAdd',
        current = 'DiffText',
      }
      })
    end,
  },
  "nvim-telescope/telescope-project.nvim",
  "jubnzv/virtual-types.nvim",
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
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "kylechui/nvim-surround",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
  {
  "epwalsh/obsidian.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "all",
          path = "~/conserva",
        },
      },
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "Daily",
        -- Optional, if you want to change the date format for the ID of daily notes.
        date_format = "%Y-%m-%d",
        -- Optional, default tags to add to each new daily note created.
        default_tags = { "daily" },
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = "Daily.md"
      },
      templates = {
        folder = "~/conserva/Templates",
        date_format = "%Y-%m-%d",
      },
      attachments = {
        img_folder = "images"
      },
      -- see below for full list of options 👇
    })
  end,
  },
}


lvim.builtin.project.active = true


local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require('go').setup({
  -- other setups ....
  disable_defaults = false,
  fillstruct = 'gopls',
  lsp_inlay_hints = {
    enable = true,
    style = 'inlay',
    show_parameter_hints = true,
    show_variable_name = true,
    only_current_line = true,
    parameter_hints_prefix = " ",
    highlights = "Comment",
  },
  icons = {breakpoint = ' ', currentpos = '󱞩'},
  lsp_cfg = {
    capabilities = capabilities,
    settings = {
      gopls = {
        analyses = {
          fieldalignment = false,
        }
      }
    }
  },
})

local lsp_manager = require "lvim.lsp.manager"
lsp_manager.setup("golangci_lint_ls", {
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
})
lsp_manager.setup("bufls", {
  on_init = require("lvim.lsp").common_on_init(),
  capabilities = require("lvim.lsp").common_capabilities(),
})
------------------------
-- Formatting
------------------------
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "goimports", filetypes = { "go" } },
  { command = "gofumpt", filetypes = { "go" } },
  { command = "buf", filetypes = { "proto" } },
  { command = "rustfmt", filetypes = { "rs" } },
}

lvim.format_on_save = {
  pattern = { "*.go", "*.proto", "*.rs", "*.sql" },
  enabled = true,
}

lvim.autocommands = {
  {
    "BufWritePost", -- see `:h autocmd-events`
    { -- this table is passed verbatim as `opts` to `nvim_create_autocmd`
      pattern = { "*.go" }, -- see `:h autocmd-events`
      command = ":silent !gci write --skip-generated -s standard -s \"prefix(git.mobiledep.ru)\" -s default -s blank -s dot -s alias --custom-order --skip-vendor <afile>",
    },
    { -- this table is passed verbatim as `opts` to `nvim_create_autocmd`
      pattern = { "*.go" }, -- see `:h autocmd-events`
      command = "GoImport",
    },
  },
  {
    {
        "ColorScheme"
    },
    {
        pattern = "*",
        callback = function()
            vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#1c444a", underline = false, bold = false })
            vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#801919", underline = false, bold = false })
            vim.api.nvim_set_hl(0, "DiffChange", { bg = "#1d2739", underline = false, bold = false })
            vim.api.nvim_set_hl(0, "DiffText", { bg = "#3c4e77", underline = false, bold = false })
        end,
    },
  },
}

-- lvim.keys.normal_mode["h"] = "<Nop>"
-- lvim.keys.normal_mode["k"] = "<Nop>"
-- lvim.keys.normal_mode["j"] = "<Nop>"
-- lvim.keys.normal_mode["l"] = "<Nop>"
