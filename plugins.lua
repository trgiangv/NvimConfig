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
        "js-debug-adapter",
        -- python
        "black",
        "debugpy",
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
        "html",
        "css",
      }
      return opts
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
      require("core.utils").load_mappings("dap")
    end
  },

  -- nodejs
  {
    "windwp/nvim-ts-autotag",
    ft = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  --python
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local localAppData = os.getenv("LOCALAPPDATA")
      local path = localAppData .. "/nvim-data/mason/packages/debugpy/venv/Scripts/python.exe"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
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
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    opts = function ()
      return require "custom.configs.symbol-layout"
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
