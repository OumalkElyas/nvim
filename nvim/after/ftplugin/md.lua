
local kmap = vim.keymap.set

-- ctex is a costumed command
--vim.bo.makeprg = 'cd %:h && bash -i "ctex"'
vim.g.vimtex_view_method = "okular"


vim.api.nvim_buf_set_keymap(0, 'n', '<leader>l', ':w<CR>:make<CR>', {noremap = true, silent = true})

kmap('n', '<F5>', ':MarkdownPreview<CR>',{noremap = true, silent = true})
kmap('n', '<F6>', ':MarkdownPreviewStop<CR>',{noremap = true, silent = true})

