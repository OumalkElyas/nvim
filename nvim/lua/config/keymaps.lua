-- ========================================
-- Global Keymaps
-- ========================================

local kmap = vim.keymap.set

-- Set leader key
vim.g.mapleader = " "
kmap("n", "<Space>", "<Nop>", { silent = true })

-- ========================================
-- File Operations
-- ========================================
kmap('n', '<leader>s', ':w<CR>', { noremap = true, silent = true, desc = "Save file" })
kmap('n', '<leader>Q', ':wqa<CR>', { noremap = true, silent = true, desc = "Save all and quit" })

-- ========================================
-- Quick Actions
-- ========================================
kmap('n', '<leader>c', ':make<CR>:copen<CR>', { silent = true, desc = "Make and open quickfix" })
kmap('n', '<C-a>', 'ggVG', { noremap = true, silent = true, desc = "Select all" })
kmap('n', '<leader>y', ':%y+<CR>', { noremap = true, silent = true, desc = "Yank entire file" })

-- ========================================
-- Window Navigation
-- ========================================
kmap("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
kmap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
kmap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
kmap("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- ========================================
-- Window Resizing
-- ========================================
kmap("n", "<C-Up>", ":resize -2<CR>", { desc = "Decrease window height" })
kmap("n", "<C-Down>", ":resize +2<CR>", { desc = "Increase window height" })
kmap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
kmap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- ========================================
-- Terminal
-- ========================================
kmap("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
