require("noice").setup({
  lsp = {
    signature = { enabled = false }, -- 🚫 disable signature popup
    hover = { enabled = true },
  },
  cmdline = {
    format = {
      cmdline = { icon = ">" },
      search_down = { icon = "🔍⌄" },
      search_up = { icon = "🔍⌃" },
      filter = { icon = "$" },
      lua = { icon = "☾" },
      help = { icon = "?" },
    },
    view = "cmdline_popup", -- ✅ make cmdline appear in the center
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
  presets = {
    bottom_search = false,     -- ❌ disable bottom search
    command_palette = false,    -- keep cmdline centered
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = false,
  },
})
