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

M.nvimtree = {
  plugin = true,
  n = {
    ["<leader>ee"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
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
