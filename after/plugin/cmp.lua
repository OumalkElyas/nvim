
-- Basic nvim-cmp setup
local cmp = require'cmp'
local luasnip = require('luasnip')

function Scmp()
    cmp.setup({
	snippet = {
	    expand = function(args)
		luasnip.lsp_expand(args.body)
		-- You need a snippet engine here if you're going to use snippets
		-- For now, leave this empty or use something like luasnip later
	    end,
	},
	mapping = cmp.mapping.preset.insert({
	    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
	    ['<C-f>'] = cmp.mapping.scroll_docs(4),
	    ['<C-Space>'] = cmp.mapping.complete(),
	    ['<C-e>'] = cmp.mapping.abort(),
	    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
	}),
	sources = cmp.config.sources({
	    { name = 'buffer' },
	    { name = 'nvim_lsp' },
	    { name = 'luasnip' },
	    { name = 'path' },
	})
    })
end
Scmp()
