-- mapping Python
local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    }
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "update crates"
    }
  }
}

M.nvimtree = {
  plugin = true,
  n = {

  },
}


M.general = {
  n = {
    ["<A-y>"] = {
      function()
        vim.cmd([[let @+ = expand('%:p')]])
      end,
      "Copy current file path"
    },
  },
  i = {
    ["jj"] = { "<esc>", "Escape insert mode" },
  },
}
return M
