math.randomseed(os.time())

-- ==========================================
-- TRANSPARENCY HELPER
-- ==========================================
local function clear_bg()
    local groups = {
        "Normal",          -- main text area
        "NormalNC",        -- non-current window
        "EndOfBuffer",     -- empty lines at end
        "VertSplit",       -- vertical split bar
        "SignColumn",      -- sign column (gutter)
        "FoldColumn",      -- fold column
        "StatusLine",      -- bottom bar
        "CursorLine",      -- current line highlight
        "LineNr",          -- line numbers
        "CursorLineNr",    -- current line number
        "WinSeparator",    -- separator line between splits
    }
    for _, group in ipairs(groups) do
        vim.api.nvim_set_hl(0, group, { bg = "NONE" })
    end
end

-- ==========================================
-- MINIMAL CP ENHANCEMENTS
-- ==========================================
local function setup_cp_keywords()
    -- Comment with subtle background (only modification to base theme)
    vim.api.nvim_set_hl(0, "Comment", { 
        fg = "#FFB86C",      -- Orange text
        bg = "#1A1410",      -- Very subtle dark background
        italic = true 
    })
    
    -- Special keywords - case insensitive
    -- Using \c in vim regex for case-insensitive matching
    vim.api.nvim_set_hl(0, "TodoKeyword", { fg = "#282A36", bg = "#F1FA8C", bold = true })
    vim.api.nvim_set_hl(0, "NoteKeyword", { fg = "#282A36", bg = "#8BE9FD", bold = true })
    vim.api.nvim_set_hl(0, "BugKeyword", { fg = "#FFFFFF", bg = "#FF5555", bold = true })
    vim.api.nvim_set_hl(0, "OptimizeKeyword", { fg = "#282A36", bg = "#50FA7B", bold = true })
    
    -- Complexity notation
    vim.api.nvim_set_hl(0, "ComplexityNotation", { fg = "#BD93F9", bold = true })
    
    -- Case-insensitive patterns (using \c flag)
    vim.fn.matchadd("TodoKeyword", "\\c\\<todo\\>")
    vim.fn.matchadd("TodoKeyword", "\\c\\<fixme\\>")
    vim.fn.matchadd("NoteKeyword", "\\c\\<note\\>")
    vim.fn.matchadd("NoteKeyword", "\\c\\<important\\>")
    vim.fn.matchadd("BugKeyword", "\\c\\<bug\\>")
    vim.fn.matchadd("BugKeyword", "\\c\\<warning\\>")
    vim.fn.matchadd("OptimizeKeyword", "\\c\\<optimize\\>")
    vim.fn.matchadd("OptimizeKeyword", "\\c\\<perf\\>")
    
    -- Complexity notation patterns
    vim.fn.matchadd("ComplexityNotation", "O(\\([^)]*\\))")
    vim.fn.matchadd("ComplexityNotation", "Θ(\\([^)]*\\))")
    vim.fn.matchadd("ComplexityNotation", "Ω(\\([^)]*\\))")
end

-- ==========================================
-- MAIN FUNCTION
-- ==========================================
local function set_col(col)
    -- 1. Set base colorscheme
    local ok, _ = pcall(vim.cmd.colorscheme, col)
    if not ok then
        vim.notify("Colorscheme '" .. col .. "' not found!", vim.log.levels.WARN)
        return
    end
    
    -- 2. Ensure background is dark
    vim.o.background = "dark"
    
    -- 3. Apply transparency
    clear_bg()
    
    -- 4. Apply minimal CP enhancements
    setup_cp_keywords()
end

-- ==========================================
-- AUTO-APPLY ON FILE OPEN
-- ==========================================
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.cpp", "*.cc", "*.c", "*.py", "*.java"},
    callback = function()
        setup_cp_keywords()
    end
})

-- Clear matches on colorscheme change
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.fn.clearmatches()
    end
})

-- ==========================================
-- USER COMMAND
-- ==========================================
vim.api.nvim_create_user_command("SetCol", function(opts)
    set_col(opts.args)
end, { nargs = 1 })

-- ==========================================
-- INITIALIZATION
-- ==========================================
set_col("retrobox")
