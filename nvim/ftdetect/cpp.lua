local group = vim.api.nvim_create_augroup("CppCPHeader", { clear = true })

-- Helper: calculate duration
local function format_duration(seconds)
    local hours = math.floor(seconds / 3600)
    seconds = seconds % 3600
    local minutes = math.floor(seconds / 60)
    seconds = seconds % 60

    local parts = {}

    if hours > 0 then
        table.insert(parts, hours .. "h")
    end

    if minutes > 0 then
        table.insert(parts, minutes .. "m")
    end

    if seconds > 0 or #parts == 0 then
        table.insert(parts, seconds .. "s")
    end

    return table.concat(parts, " ")
end

-- On new file: insert header
vim.api.nvim_create_autocmd("BufNewFile", {
    group = group,
    pattern = "*.cpp",
    callback = function()
        local now = os.time()

        vim.api.nvim_buf_set_lines(0, 0, 0, false, {
            "//\toelyas",
            os.date("//\t%d-%m-%Y  %H:%M:%S", now),
        })

        -- Store creation time in buffer variable
        vim.b.cpp_creation_time = now
    end,
})

-- On save: update duration line
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     group = group,
--     pattern = "*.cpp",
--     callback = function()
--         local creation = vim.b.cpp_creation_time
--
--         -- Recover creation time if buffer variable missing
--         if not creation then
--             local line = vim.api.nvim_buf_get_lines(0, 1, 2, false)[1]
--             if line then
--                 local d, m, y, H, M, S =
--                     line:match("(%d+)%-(%d+)%-(%d+)%s+(%d+):(%d+):(%d+)")
--                 if d then
--                     creation = os.time({
--                         day = tonumber(d),
--                         month = tonumber(m),
--                         year = tonumber(y),
--                         hour = tonumber(H),
--                         min = tonumber(M),
--                         sec = tonumber(S)
--                     })
--                     vim.b.cpp_creation_time = creation
--                 end
--             end
--         end
--
--         if creation then
--             local now = os.time()
--             local duration = format_duration(now - creation)
--             local new_line = "//\t" .. duration
--
--             local lines = vim.api.nvim_buf_get_lines(0, 0, 4, false)
--
--             -- If line 3 exists and starts with "//", replace it
--             if lines[3] and lines[3]:match("^%s*//") then
--                 vim.api.nvim_buf_set_lines(0, 2, 3, false, { new_line })
--             else
--                 -- Otherwise insert safely at line 3
--                 vim.api.nvim_buf_set_lines(0, 2, 2, false, { new_line })
--             end
--         end
--     end,
-- })
