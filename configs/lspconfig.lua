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

-- cpp
lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

-- csharp
lspconfig.omnisharp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- rust
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

end
