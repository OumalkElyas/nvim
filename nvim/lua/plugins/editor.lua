-- ========================================
-- Editor Plugins
-- ========================================

return {
    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        keys = {
            { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
            { "<leader>o", "<cmd>NvimTreeFocus<cr>", desc = "Focus file explorer" },
        },
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                disable_netrw = true,
                hijack_netrw = true,
                view = {
                    width = 30,
                    side = "left",
                },
                renderer = {
                    group_empty = true,
                    icons = {
                        show = {
                            folder_arrow = true,
                        },
                    },
                },
                filters = {
                    dotfiles = false,
                    custom = { ".git", "node_modules", ".cache" },
                },
            })
        end,
    },

    -- Comment plugin
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require('Comment').setup({
                padding = true,
                sticky = true,
                toggler = {
                    line = 'gcc',
                    block = 'gbc',
                },
                opleader = {
                    line = 'gc',
                    block = 'gb',
                },
            })
        end,
    },
}
