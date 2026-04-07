-- Custom Snippets System (Extension-based folders)
-- Place this file at: ~/.config/nvim/lua/local/snippets.lua
-- Then require it in init.lua: require("local.snippets")

local M = {}

-- ========================================
-- Configuration
-- ========================================
vim.g.snippets_dir = vim.fn.expand("~/.snippets")

-- Map file extensions to snippet folders
local extension_map = {
    cpp = "cpp",
    hpp = "cpp",
    h = "cpp",
    c = "cpp",
    cc = "cpp",
    cxx = "cpp",
    py = "py",
    java = "java",
    js = "js",
    ts = "ts",
    lua = "lua",
    sh = "sh",
    bash = "sh",
}

-- ========================================
-- Core Functions
-- ========================================

-- Get current file extension and corresponding snippet folder
local function get_snippet_folder()
    local filename = vim.fn.expand("%:t")
    local ext = filename:match("%.([^%.]+)$")
    
    if not ext then
        return nil
    end
    
    local folder = extension_map[ext]
    if not folder then
        return nil
    end
    
    local path = vim.g.snippets_dir .. "/" .. folder
    
    if vim.fn.isdirectory(path) == 0 then
        return nil
    end
    
    return path
end

-- Get all snippet files from current extension's folder
local function get_snippets()
    local snippets = {}
    local dir = get_snippet_folder()
    
    if not dir then
        return snippets
    end

    local handle = vim.loop.fs_scandir(dir)
    if not handle then return snippets end

    while true do
        local name, type = vim.loop.fs_scandir_next(handle)
        if not name then break end

        if type == "file" then
            -- Remove extension (MP.hpp → MP)
            local display = name:match("(.+)%..+$") or name
            table.insert(snippets, {
                name = display,
                file = name,
                path = dir .. "/" .. name,
            })
        end
    end

    return snippets
end

-- Insert snippet file contents at cursor
local function insert_snippet(path)
    local cursor = vim.api.nvim_win_get_cursor(0)
    local lines = {}

    for line in io.lines(path) do
        table.insert(lines, line)
    end

    vim.api.nvim_buf_set_lines(0, cursor[1], cursor[1], false, lines)
end

-- ========================================
-- Telescope Picker
-- ========================================

function M.picker()
    local ok, telescope = pcall(require, "telescope")
    if not ok then
        vim.notify("Telescope not available", vim.log.levels.WARN)
        return
    end

    local folder = get_snippet_folder()
    if not folder then
        local ext = vim.fn.expand("%:e")
        if ext == "" then
            vim.notify("No file extension detected", vim.log.levels.WARN)
        else
            vim.notify("No snippet folder for ." .. ext .. " files", vim.log.levels.WARN)
        end
        return
    end

    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    local snippets = get_snippets()

    if #snippets == 0 then
        vim.notify("No snippets in " .. folder, vim.log.levels.WARN)
        return
    end

    pickers.new({}, {
        prompt_title = "📝 Snippets (" .. vim.fn.fnamemodify(folder, ":t") .. ")",
        finder = finders.new_table({
            results = snippets,
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = entry.name,
                    ordinal = entry.name,
                }
            end,
        }),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if selection then
                    insert_snippet(selection.value.path)
                end
            end)
            return true
        end,
    }):find()
end

-- ========================================
-- nvim-cmp Source
-- ========================================

local source = {}

function source.new()
    return setmetatable({}, { __index = source })
end

function source:get_keyword_pattern()
    return [[\w\+]]
end

function source:complete(_, callback)
    local snippets = get_snippets()
    local items = {}

    for _, snippet in ipairs(snippets) do
        table.insert(items, {
            label = snippet.name,
            kind = 15, -- Snippet
            data = snippet,
        })
    end

    callback(items)
end

function source:execute(completion_item, callback)
    local snippet = completion_item.data
    if not snippet then
        callback()
        return
    end

    -- Delete typed text
    local cursor = vim.api.nvim_win_get_cursor(0)
    local line = vim.api.nvim_get_current_line()
    local col = cursor[2]

    local start = col
    while start > 0 and line:sub(start, start):match("[%w_]") do
        start = start - 1
    end

    vim.api.nvim_buf_set_text(0, cursor[1] - 1, start, cursor[1] - 1, col, {})
    vim.api.nvim_win_set_cursor(0, { cursor[1], start })

    insert_snippet(snippet.path)
    callback()
end

-- ========================================
-- Setup
-- ========================================

function M.setup()
    -- Register cmp source
    local ok_cmp, cmp = pcall(require, "cmp")
    if ok_cmp then
        cmp.register_source("snippets", source.new())

        local config = cmp.get_config()
        table.insert(config.sources, 1, {
            name = "snippets",
            keyword_length = 2,
        })
        cmp.setup(config)
    end

    -- Keybinding
    vim.keymap.set("n", "<leader>sn", M.picker, { desc = "Insert snippet" })

    -- Create base directory if missing
    if vim.fn.isdirectory(vim.g.snippets_dir) == 0 then
        vim.fn.mkdir(vim.g.snippets_dir, "p")
    end
end

-- Auto-setup
M.setup()

return M
