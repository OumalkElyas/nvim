return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",            -- <------ add this
    build = ":TSUpdate",
    opts = {
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
    },
}
