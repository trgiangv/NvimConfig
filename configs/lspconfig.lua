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
          "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/2019",
          "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/common",
          "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/DSCore",
          "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/pyrevit",
          "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/pyrevitlib",
          "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/site-packages",
          "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/Revit",
          "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/RevitServices",
          "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/Rhinoceros",
          "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/autocad_api",
          "F:/DIG_GiangVu/GTV_Tools/pyGTVRevit.extension/lib"
        },
        stubPath = {
          -- Add your extra paths here
          "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/2019",
          "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/common",
          "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/DSCore",
          "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/pyrevit",
          "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/pyrevitlib",
          "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/site-packages",
          "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/Revit",
          "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/RevitServices",
          "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/Rhinoceros",
          "F:/OneDrive/1_Giang Vu/Revit_API_Python/Set up Autocomplete/autocad_api",
          "F:/DIG_GiangVu/GTV_Tools/pyGTVRevit.extension/lib"
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

-- c++
lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

end
