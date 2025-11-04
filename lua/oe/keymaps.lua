-- set shorter name for keymap function
local kmap = vim.keymap.set

vim.g.mapleader = " "
kmap("n", "<leader>pv", vim.cmd.Ex)

kmap('n', '<leader>c', ':make<CR>:copen<CR>', {silent = true})
kmap('n','<C-a>', 'ggVG', {noremap =true, silent = true})
kmap('n','<leader>s', ':w<CR>', {noremap =true, silent = true})
kmap('n','<leader>Q', ':wqa<CR>', {noremap =true, silent = true})
kmap('n','<leader>y', ':%y+<CR>', {noremap =true, silent = true})

-- Normal Mode
kmap("n","<C-h>","<C-w>h", opts)
kmap("n","<C-j>","<C-w>j", opts)
kmap("n","<C-k>","<C-w>k", opts)
kmap("n","<C-l>","<C-w>l", opts)
-- keymap("n","<C->","<C-w>", opts)

-- resize with arrows
kmap("n", "<C-Up>", ":resize -2<CR>", opts)
kmap("n", "<C-Down>", ":resize +2<CR>", opts)
kmap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
kmap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

--Insert Mode 
--Press jk or kj fast to quit insert mode
kmap("i","jk", "<ESC>", opts)
kmap("i","kj", "<ESC>", opts)


-- exit terminal mode using esc
kmap("t","<Esc>", [[<C-\><C-n>]])

