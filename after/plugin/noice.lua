
config = {
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
}

conf = {
    cmdline = {
      format = {
        cmdline = { icon = ">" },
        search_down = { icon = "🔍⌄" },
        search_up = { icon = "🔍⌃" },
        filter = { icon = "$" },
        lua = { icon = "☾" },
        help = { icon = "?" },
      },
    },
    format = {
      level = {
        icons = {
          error = "✖",
          warn = "▼",
          info = "●",
        },
      },
    },
    popupmenu = {
      kind_icons = false,
    },
    inc_rename = {
      cmdline = {
        format = {
          IncRename = { icon = "⟳" },
        },
      },
    },
  }

-- require('notify').setup({
--     messages = {
-- 	enabled = true,  -- must be true
-- 	view = "notify", -- show messages using notify
--     },
--   render = function(buf, notification, highlights, config)
--     return {
--       --col = 5,      -- closer to left
--       --row = 3,      -- closer to top
--       height = math.min(10, #notification.message), -- auto height
--       width = 60,   -- wider
--     }
--   end,
-- })

require("noice").setup(conf)
