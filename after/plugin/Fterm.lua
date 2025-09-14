
require('FTerm').setup({
    border = 'double', -- single/none
    dimensions  = {
        height = 1.0,
        width = 0.5,
	x = 1.0, -- X axis of the terminal window
        y = 0.3, -- Y axis of the terminal window
    },
})

-- Example keybindings
vim.keymap.set('n', '<leader>t', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<leader>t', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

vim.api.nvim_create_user_command('FTermOpen', require('FTerm').open, { bang = true })
vim.api.nvim_create_user_command('FTermClose', require('FTerm').close, { bang = true })
