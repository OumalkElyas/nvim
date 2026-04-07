-- ========================================
-- Markdown and LaTeX Support
-- ========================================

return {
    -- Markdown preview
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        config = function()
            vim.g.mkdp_auto_start = 0
            vim.g.mkdp_auto_close = 1
            vim.g.mkdp_refresh_slow = 0
            vim.g.mkdp_command_for_global = 0
            vim.g.mkdp_open_to_the_world = 0
            vim.g.mkdp_browser = ''
            vim.g.mkdp_echo_preview_url = 0
            vim.g.mkdp_preview_options = {
                mkit = {},
                katex = {},
                uml = {},
                maid = {},
                disable_sync_scroll = 0,
                sync_scroll_type = 'middle',
                hide_yaml_meta = 1,
            }

            -- Markdown keybindings
            vim.keymap.set('n', '<leader>mp', ':MarkdownPreview<CR>', 
                { silent = true, desc = "Markdown preview" })
            vim.keymap.set('n', '<leader>ms', ':MarkdownPreviewStop<CR>', 
                { silent = true, desc = "Stop markdown preview" })
        end,
    },

    -- Render markdown
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = "markdown",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "echasnovski/mini.nvim",
        },
        config = function()
            require('render-markdown').setup({
                heading = {
                    enabled = true,
                    sign = true,
                    icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
                },
                code = {
                    enabled = true,
                    sign = true,
                    style = 'full',
                },
                bullet = {
                    enabled = true,
                    icons = { '●', '○', '◆', '◇' },
                },
            })
        end,
    },

    -- KNAP for LaTeX preview
    {
        "frabjous/knap",
        ft = "tex",
        config = function()
            -- KNAP keybindings for LaTeX
            vim.keymap.set('n', '<leader>lp', ':lua require("knap").process_once()<CR>', 
                { silent = true, desc = "LaTeX: Process once" })
            vim.keymap.set('n', '<leader>lc', ':lua require("knap").close_viewer()<CR>', 
                { silent = true, desc = "LaTeX: Close viewer" })
            vim.keymap.set('n', '<leader>lt', ':lua require("knap").toggle_autopreviewing()<CR>', 
                { silent = true, desc = "LaTeX: Toggle auto-preview" })
            vim.keymap.set('n', '<leader>lj', ':lua require("knap").forward_jump()<CR>', 
                { silent = true, desc = "LaTeX: Forward jump" })
        end,
    },
}
