local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- tailwindcss, eslint, tsserver
local servers = {"tsserver", "tailwindcss", "eslint"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }

-- Python
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
  settings = {
    python = {
      analysis = {
        extraPaths = {
          -- Add your extra paths here
          "F:/DIG_GiangVu/workspace/pyRevitAutocomplete/2023",
          "F:/DIG_GiangVu/workspace/pyRevitAutocomplete/common",
          "F:/DIG_GiangVu/workspace/pyRevitAutocomplete/DSCore",
          "F:/DIG_GiangVu/workspace/pyRevitAutocomplete/pyrevit",
          "F:/DIG_GiangVu/workspace/pyRevitAutocomplete/pyrevitlib",
          "F:/DIG_GiangVu/workspace/pyRevitAutocomplete/site-packages",
          "F:/DIG_GiangVu/workspace/pyRevitAutocomplete/Revit",
          "F:/DIG_GiangVu/workspace/pyRevitAutocomplete/RevitServices",
          "F:/DIG_GiangVu/workspace/pyRevitAutocomplete/AutoCAD",
          "F:/DIG_GiangVu/workspace/pyDCMvn/pyDCMvn.extension/lib"
        },
        indexing = true,
        typeCheckingMode = "off",
        diagnosticMode = "workspace",
        autoImportCompletions = false,
        autoSearchPaths = true,
      }
    },
  }
})

-- lspconfig.pylsp.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = {"python"},
--   settings = {
--     pylsp = {
--       plugins = {
--         pycodestyle = {
--           ignore = {'W391'},
--           maxLineLength = 100
--         },
--         jedi = {
--           extra_paths = {
--             -- Add your extra paths here
--             "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/2019",
--             "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/common",
--             "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/DSCore",
--             "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/pyrevit",
--             "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/pyrevitlib",
--             "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/site-packages",
--             "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/Revit",
--             "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/RevitServices",
--             "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/Rhinoceros",
--             "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/autocad_api",
--             "F:/DIG_GiangVu/GTV_Tools/pyGTVRevit.extension/lib"
--           },
--         },
--       }
--     }
--   }
--   })


end
