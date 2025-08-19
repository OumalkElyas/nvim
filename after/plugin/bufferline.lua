require("bufferline").setup {
  options = {
    mode = "buffers",               -- show buffers as tabs (VS Code style)
    numbers = "none",
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    indicator = { icon = "▎", style = "icon" },
    buffer_close_icon = "󰅖",
    show_buffer_close_icons = true,
    show_close_icon = true,
    separator_style = "thin",
    offsets = {
      { filetype = "NvimTree", text = "File Explorer", text_align = "left", separator = true }
    },
  }
}
