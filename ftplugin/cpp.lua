

local function done()
    vim.cmd("echohl MoreMsg | echo \"done\" | echohl None")
end

vim.bo.errorformat = '%f:%l:%c %m'

-- for compiling 
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

-- for running
vim.keymap.set('n', '<leader>r',
    function()
	exe = vim.fn.expand("%:p:r")
	vim.fn.system(string.format('kitty -e bash -c "%s; echo Press ENTER to exit; read"', exe))
    end, {buffer = true})
