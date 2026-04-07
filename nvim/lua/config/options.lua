-- ========================================
-- Neovim Options
-- ========================================

local options = {
    -- Line numbers
    number = true,
    relativenumber = true,
    numberwidth = 2,

    -- Indentation
    shiftwidth = 4,
    expandtab = true,

    -- Splits
    splitright = true,
    splitbelow = true,

    -- UI
    cursorline = true,
    termguicolors = true,
    guifont = "monospace:h17",
    cmdheight = 2,
    linebreak = true,
    signcolumn = "yes",

    -- Mouse & Clipboard
    mouse = "a",
    clipboard = "unnamedplus",

    -- Performance
    updatetime = 300,
    timeoutlen = 400,
    ttimeoutlen = 10,

    -- Search
    ignorecase = true,
    smartcase = true,

    -- Completion
    completeopt = { "menu", "menuone", "noselect" },
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Disable some builtin plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
