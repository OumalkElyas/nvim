local bufferline = require('bufferline')
bufferline.setup {
  options = {
    mode = "buffers", -- tabs
    -- Allow colors to be changed dynamically by colorschemes
    themable = true,
    numbers = "none",
    close_command = "bdelete! %d",
    -- Right-click closes a buffer
    right_mouse_command = "bdelete! %d",
    -- Left-click switches to a buffer
    left_mouse_command = "buffer %d",

    -- Small vertical line shown before buffer name
    indicator = {
      icon = "▎",   -- the small bar
      style = "icon" -- or "underline" or "none"
    },

    -- Icons for various parts
    buffer_close_icon = "󰅖",   -- icon on each buffer to close it
    modified_icon = "● ",      -- icon for modified buffers
    close_icon = " ",         -- close icon on the right
    separator_style = "thin",  -- "slant", "thick", "thin", or custom chars

    -- Adjust spacing when certain side panels are open (e.g. NvimTree)
    offsets = {
      {
        filetype = "NvimTree",  -- name of the side plugin
        text = "File Explorer", -- text shown next to it
        text_align = "left",    -- "left" | "center" | "right"
        separator = true        -- add a visual separator
      }
    },

    -- Always show the bar, even if only one buffer is open
    always_show_bufferline = true,

    -- Automatically hide/show bufferline when only one buffer exists
    auto_toggle_bufferline = false,

    -- Enable colored icons (requires nvim-web-devicons)
    color_icons = true,

    -- Show buffer icons (filetype icons)
    show_buffer_icons = true,

    -- Show close icons on buffers
    show_buffer_close_icons = true,

    -- Show the close icon at the right end
    show_close_icon = true,

    -- Show small tab indicators
    show_tab_indicators = true,

    -- Enable diagnostics (can be "nvim_lsp", "coc", or false)
    diagnostics = false,

    -- Function to filter buffers shown in the line
    -- Example: hide certain filetypes
    custom_filter = function(bufnr)
      return true -- show all buffers by default
    end,

    -- Control max/min lengths of names/truncation (optional)
    max_name_length = 18,
    max_prefix_length = 15,
    truncate_names = true,

    -- Enforce sort order (can be "id", "extension", "relative_directory", etc.)
    sort_by = "id",
  }
}

-- KEYMAPS for Bufferline navigation
-- You can put this after the bufferline.setup block

-- Move to next / previous buffer
vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })

-- Close current buffer
vim.keymap.set('n', '<leader>q', '<Cmd>bdelete!<CR>', { desc = 'Close current buffer' })

-- Pick buffer visually (like buffer picker)
vim.keymap.set('n', '<Super-p>', '<Cmd>BufferLinePick<CR>', { desc = 'Pick buffer' })

-- Move buffers around (reorder)
vim.keymap.set('n', '<D-h>', '<Cmd>BufferLineMovePrev<CR>', { desc = 'Move buffer left' })
vim.keymap.set('n', '<D-l>', '<Cmd>BufferLineMoveNext<CR>', { desc = 'Move buffer right' })

-- Jump directly to buffer 1–9
for i = 1, 9 do
  vim.keymap.set('n', '<leader>' .. i, '<Cmd>BufferLineGoToBuffer ' .. i .. '<CR>', {
    desc = 'Go to buffer ' .. i
  })
end

-- Optional: jump to last buffer
vim.keymap.set('n', '<leader>0', '<Cmd>BufferLineGoToBuffer -1<CR>', { desc = 'Go to last buffer' })

-- Always show the tabline even with one tab
vim.opt.showtabline = 2
