local plugins = {
  -- core plugin
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- nodejs
        "eslint-lsp",
        "prettierd",
        "tailwindcss-language-server",
        "typescript-language-server",
        "lua-language-server",
        -- python
        "black",
        "pyright",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local opts = require "plugins.configs.treesitter"
      opts.ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "python",
      }
      return opts
    end,
  },

  -- nodejs
  {
    "windwp/nvim-ts-autotag",
    ft = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- utilities
  {
  "https://git.sr.ht/~nedia/auto-save.nvim",
  event = "BufWinEnter",
  config = function()
    require("auto-save").setup()
  end
  },
  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    opts = function ()
      return require "custom.configs.copilot"
    end,
    config = function(_, opts)
      require("copilot").setup(opts)
    end
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").set_icon({
        dyn = {
          icon = "󰟡",
          color = "#006400",
          cterm_color = "199",
          name = "dynamo",
        },
        ipynb = {
          icon = "󱓩",
          color = "#FF8C00",
          cterm_color = "199",
          name = "jupyter",
        },
        toml = {
          icon = "",
          color = "#61afef",
          cterm_color = "199",
          name = "toml",
        },
      })
    end,
  },
}
return plugins
