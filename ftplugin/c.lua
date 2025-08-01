

local function done()
    vim.cmd("echohl MoreMsg | echo \"done\" | echohl None")
end

vim.bo.makeprg='gcc -O2 -pipe -o %:r %'
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
--vim.keymap.set('n', '<leader>r', ':terminal ./%:r<CR>i', { buffer = true })


vim.keymap.set('n', '<leader>r', function()
  vim.cmd("w") -- Save current file
  local file = vim.fn.expand("%:r")
  local cmd = string.format(
    [[kitty bash -i -c './%s; echo; read -n 1 -s -r -p "Press any key to close..."']],
    file
  )
  vim.fn.jobstart(cmd, { detach = true })
end, { buffer = true })
