
local options = {
    number = true, --Enable line number
    shiftwidth = 4, --Set identation width to 4 spaces
    splitright = true, --Force all vertical splits to go right
    cursorline = true, --Highlight the current line
    termguicolors = true, --For more colors support
    guifont = "monospace:h17",
    relativenumber = true,
    cmdheight = 2,
    mouse = a,
    clipboard="unnamedplus",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
