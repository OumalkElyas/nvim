local lsp_signature = require("lsp_signature")
local lspconfig = require("lspconfig")

local function start_lsp()
  local on_attach = function(client, bufnr)
    lsp_signature.on_attach({
      bind = true,
      hint_enable = true,
      floating_window = true,
      handler_opts = {
        border = "rounded"
      },
    }, bufnr)
  end

  lspconfig.clangd.setup({
    on_attach = on_attach
  })
end

-- Expose function globally so you can call it from anywhere
_G.start_lsp = start_lsp

-- Optionally, run it on startup automatically
-- start_lsp()
