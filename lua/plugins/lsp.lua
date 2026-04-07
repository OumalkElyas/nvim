-- ========================================
-- LSP Configuration
-- ========================================

return {
    -- LSP Configuration
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "ray-x/lsp_signature.nvim",
        },
        config = function()
            -- LSP servers configuration
            local servers = {
                clangd = {},
                pyright = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                        },
                    },
                },
                bashls = {},
                sqls = {},
                texlab = {},
                jdtls = {},
            }

            -- Setup each server
            for server, config in pairs(servers) do
                vim.lsp.config(server, config)
                vim.lsp.enable(server)
            end

            -- LSP signature configuration
            require("lsp_signature").setup({
                bind = true,
                handler_opts = {
                    border = "rounded"
                },
                hint_prefix = "🔍 ",
            })

            -- Diagnostics configuration
            vim.diagnostic.config({
                virtual_text = {
                    prefix = "●",
                    spacing = 2,
                },
                signs = false,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })

            -- LSP Keybindings
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Find references' })
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename' })
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })
        end,
    },

    -- Mason for LSP installation
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup({
                ui = {
                    border = "rounded",
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end,
    },
}
