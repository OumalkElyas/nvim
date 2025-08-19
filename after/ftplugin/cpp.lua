

local function done()
    vim.cmd("echohl MoreMsg | echo \"done\" | echohl None")
end

vim.bo.makeprg='g++ -O2 -Wall -lSDL2 -std=c++23 -DOE -Wextra -o %:r %'
vim.bo.errorformat = '%f:%l:%c %m'

vim.keymap.set('n','<leader>c',':silent w | make | echo "done" <CR>', {buffer = true})

-- for running
vim.keymap.set('n', '<leader>r', ':Fterm ./%:r<CR>i', { buffer = true })
-- vim.keymap.set('n', '<leader>r', function()
--   vim.cmd("w") -- Save current file
--   local file = vim.fn.expand("%:r")
--   local cmd = string.format(
--     [[kitty bash -i -c './%s; echo; read -n 1 -s -r -p "Press any key to close..."']],
--     file
--   )
--   vim.fn.jobstart(cmd, { detach = true })
-- end, { buffer = true })
--
