-- mapping Python
local M = {}

M.debugger = {
  plugin = true,
  n = {
    ["<leader>dp"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    },
    ["<leader>dy"] = {
      function()
        require('dap-python').test_method()
      end,
      "Run pytest on current method"
    }
  },
}

M.nvimtree = {
  plugin = true,
  n = {
    ["<leader>ee"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}

--
-- M.general = {
--   n = {
--     ["<A-y>"] = {
--       function()
--         vim.cmd([[let @+ = expand('%:p')]])
--       end,
--       "Copy current file path"
--     },
--   },
--   i = {
--     ["jj"] = { "<esc>", "Escape insert mode" },
--   },
-- }
return M
