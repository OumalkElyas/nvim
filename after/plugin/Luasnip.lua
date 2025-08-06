
require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/after/snippets" })

-- key for enter expand
vim.keymap.set({ "i", "s" }, "<CR>", function()
  local ls = require("luasnip")
  if ls.expandable() then
    ls.expand()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, false, true), "n", false)
  end
end, { silent = true })
