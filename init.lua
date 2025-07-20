
require "oe.options"
require "oe.keymaps"


--[[
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })


-- Set up LuaSnip with friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- Configure nvim-cmp
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- Expand snippets
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(), -- Trigger completion
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
  }),
  sources = cmp.config.sources({
    { name = 'buffer' }, -- Buffer words
    { name = 'luasnip' }, -- Snippets
  })
})

-- Enable auto-pairs
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt", "text" }, -- Optional: disable for certain file types
})
]]--


