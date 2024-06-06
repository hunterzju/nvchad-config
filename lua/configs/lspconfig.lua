-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "clangd", "pylsp" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- local lspconfig = require('lspconfig')

-- pylsp
lspconfig.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          -- ignore = {'W391'},
          ignore = {"E221", "E501", "W504", "E302", "E305", "E402", "W391"},
          maxLineLength = 100
        }
      }
    }
  }
}

-- clangd
lspconfig.clangd.setup {
  cmd = {"clangd"}
}

