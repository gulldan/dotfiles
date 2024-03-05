lvim.builtin.which_key.mappings["lb"] = {
  "<cmd>LspRestart<CR>", "Restart"
}

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

lvim.builtin.which_key.mappings["e"] = {
  "<cmd>:NvimTreeToggle<CR>", "Explorererere"
}

lvim.builtin.which_key.mappings["a"] = {
  "<cmd>:NvimTreeToggle<CR>", "Explorererere"
}

lvim.builtin.which_key.mappings["gt"] = {
  "<cmd>:GitBlameToggle<CR>", "Toggle Git Blame"
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
  'mfussenegger/nvim-dap',
  'rcarriga/nvim-dap-ui',
  "neovim/nvim-lspconfig",
  "ray-x/go.nvim",
  'ray-x/guihua.lua',
  "jeniasaigak/goplay.nvim",
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
  'kwkarlwang/bufresize.nvim',
  "folke/tokyonight.nvim",
  {
    'f-person/git-blame.nvim',
    config = function ()
      require('gitblame').setup({
        enabled = false,
      })
    end
  },
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     -- add any options here
  --   },
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --   },
  -- },
  "artemave/workspace-diagnostics.nvim",
}

lvim.builtin.project.active = true

lvim.builtin.which_key.mappings["lb"] = {
  "<cmd>LspRestart<CR>", "Restart"
}

lvim.builtin.which_key.mappings["to"] = {
  "<cmd>:sp|te<CR>:resize 11<CR>", "Terminal open"
}

lvim.builtin.which_key.mappings["gm"] = {
  "<cmd>:GitConflictListQf<CR>", "Get all conflict to quickfix"
}


lvim.builtin.which_key.mappings["e"] = {
  "<cmd>:NvimTreeToggle<CR>", "Explorererere"
}

lvim.builtin.which_key.mappings["a"] = {
  "<cmd>:NvimTreeToggle<CR>", "Explorererere"
}

require("devcontainer").setup{}
require('goplay').setup{}

require("bufresize").setup({
    register = {
        trigger_events = { "BufWinEnter", "WinEnter" },
    },
    resize = {
        keys = {},
        trigger_events = { "VimResized" },
        increment = false,
    },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require('go').setup({
  -- other setups ....
  lsp_inlay_hints = {
    enable = true,
    style = 'inlay',
    show_parameter_hints = true,
    show_variable_name = false,
    only_current_line = false,
    parameter_hints_prefix = " ",
  },
  icons = {breakpoint = ' ', currentpos = '󱞩'},
  lsp_cfg = {
    capabilities = capabilities,
  },
})

local lsp_manager = require "lvim.lsp.manager"
lsp_manager.setup("golangci_lint_ls", {
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
  config = "~/Documents/ukazka/bff/.golangci.yml"
})
lsp_manager.setup("bufls", {
  on_init = require("lvim.lsp").common_on_init(),
  capabilities = require("lvim.lsp").common_capabilities(),
})

lsp_manager.setup("workspace-diagnostics", {

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
      command = "silent !gci write --skip-generated -s standard -s \"prefix(git.mobiledep.ru)\" -s default -s blank -s dot -s alias --custom-order --skip-vendor <afile>",
    }
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




-----
-- Linters
-- ---
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup { { command = "sqlfluff", filetypes = { "sql" }, extra_args = {"--dialect", "clickhouse"} } }

------------------------
-- LSP
------------------------


-- lvim.builtin.which_key.mappings["a"] = {
--   "AI"
-- }

-- lvim.builtin.which_key.mappings["aa"] = {
--   vim.fn['codeium#Accept'](), "Accept prompt"
-- }

-- lvim.keys.normal_mode["h"] = "<Nop>"
-- lvim.keys.normal_mode["k"] = "<Nop>"
-- lvim.keys.normal_mode["j"] = "<Nop>"
-- lvim.keys.normal_mode["l"] = "<Nop>"
