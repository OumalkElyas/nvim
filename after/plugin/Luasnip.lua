
require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/after/snippets" })

-- Setup key for Enter to expand/jump
vim.keymap.set({"i", "s"}, "<CR>", function()
  local ls = require("luasnip")
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, false, true), "n", false)
  end
end, {silent = true})
