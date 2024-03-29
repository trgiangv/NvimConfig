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
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings("dap")
    end
  },
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
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua
        "lua-language-server",
        "stylua",
        -- nodejs
        "eslint-lsp",
        "prettierd",
        "tailwindcss-language-server",
        "typescript-language-server",
        "js-debug-adapter",
        -- python
        "black",
        "pyright",
        "debugpy",
        -- c++
        "clangd",
        "clang-format",
        "codelldb",
        -- ps1
        "powershell-editor-services",
        -- rust
        "rust-analyzer",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local opts = require "plugins.configs.treesitter"
      opts.ensure_installed = {
        "lua",
        "javascript", "typescript", "html", "css", "tsx",
        "python",
        "c",
        "cpp",
        "rust",
        "json", "yaml", "csv", "xml",
        "gitignore", "gitcommit", "git_config", "git_rebase", "gitattributes"
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
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      require "custom.configs.rustaceanvim"
    end
  },
  {
    'saecki/crates.nvim',
    ft = {"toml"},
    config = function(_, opts)
      local crates  = require('crates')
      crates.setup(opts)
      require('cmp').setup.buffer({
        sources = { { name = "crates" }}
      })
      crates.show()
      require("core.utils").load_mappings("crates")
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function(_, opts)
      require("nvim-dap-virtual-text").setup()
    end
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
    'kevinhwang91/nvim-ufo',
    config = function()
      require('ufo').setup()
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
