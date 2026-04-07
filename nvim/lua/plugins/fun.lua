-- ========================================
-- Fun Plugins
-- ========================================

return {
    -- Cellular automaton animation
    {
        "eandrju/cellular-automaton.nvim",
        cmd = "CellularAutomaton",
        keys = {
            { "<leader>fml", "<cmd>CellularAutomaton make_it_rain<cr>", desc = "Make it rain" },
            { "<leader>gol", "<cmd>CellularAutomaton game_of_life<cr>", desc = "Game of life" },
        },
    },

    -- Speed typing game
    {
        "NStefan002/speedtyper.nvim",
        cmd = "Speedtyper",
        keys = {
            { "<leader>st", "<cmd>Speedtyper<cr>", desc = "Start speedtyper" },
        },
        config = function()
            require("speedtyper").setup({
                window = {
                    height = 5,
                    width = 0.55,
                    border = "rounded",
                },
            })
        end,
    },
}
