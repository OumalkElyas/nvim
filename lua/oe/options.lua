
local options = {
    number = true, --Enable line number
    shiftwidth = 4, --Set identation width to 4 spaces
    splitright = true, --Force all vertical splits to go right
    splitbelow = true, -- Force the horizontal split to below
    cursorline = true, --Highlight the current line
    termguicolors = true, --For more colors support
    guifont = "monospace:h17",
    relativenumber = true,
    cmdheight = 2,
    scrolloff = 999,
    mouse = "a",
    clipboard="unnamedplus",
    updatetime = 300, -- faster completion (4000ms defaultj)
    numberwidth = 2, -- set number column width (default 4)
    linebreak = true, -- companion to wrap, don't split words
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
