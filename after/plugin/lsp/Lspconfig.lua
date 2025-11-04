
-- Put this in your LSP config (e.g. after setting up lspconfig)
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",   -- or "", ">>", "" for no prefix
    spacing = 2,
  },
  signs = false,        -- hides the E/W letters in the gutter
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
