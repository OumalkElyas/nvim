

local function done()
    vim.cmd("echohl MoreMsg | echo \"done\" | echohl None")
end

vim.bo.makeprg='g++ -O2 -Wall -Wextra -o %:r %'
vim.bo.errorformat = '%f:%l:%c %m'

-- for compiling 
--[[
vim.keymap.set('n', '<leader>c',
    function()
	vim.cmd("silent w")
	vim.bo.makeprg='g++ -O2 -Wall -Wextra -o %:r %'
	vim.cmd("silent! make")
	vim.cmd("redraw!")
	done()
	vim.cmd("cwindow")
	--vim.cmd("")
    end, {buffer = true}) 
    ]]--
vim.keymap.set('n','<leader>c',':silent w | make | echo "done" <CR>', {buffer = true})

-- for running
vim.keymap.set('n', '<leader>r', ':terminal ./%:r<CR>i', { buffer = true })
