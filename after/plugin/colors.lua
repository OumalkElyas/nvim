color = 'selenized' or 'tokyonight-night' or 'rose-pine' or 'blue'
vim.cmd.colorscheme(color)

vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

vim.api.nvim_set_hl(0, 'LineNr', { bg = 'NONE' })
