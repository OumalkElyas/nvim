
require('notify').setup({
  stages = "fade_in_slide_out", -- Animation style for notifications
  timeout = 3000,               -- Duration in milliseconds notifications are displayed
  max_height = nil,             -- Maximum height of the notification window (nil for auto)
  max_width = 70,              -- Maximum width of the notification window (nil for auto)
  render = "default",           -- Built-in renderer or a custom function for notification content
  top_of_buf = false,           -- Display notifications at the top of the buffer
  background_colour = "#000000",-- Background color of the notification window (hex code)
  minimum_width = 50,           -- Minimum width of the notification window
  fps = 60,                     -- Frames per second for animations
  icons = {                     -- Icons for different notification levels
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
  level = vim.log.levels.INFO,  -- Minimum log level to display
  on_open = nil,                -- Callback function when a notification window opens
  on_close = nil,               -- Callback function when a notification window closes
  keep = nil,                   -- Function to keep a notification window open after timeout
  silent = false,               -- Suppress notification that pending notifications were dismissed
  focusable = true,             -- Make notification windows focusable
  -- Custom highlights for notification levels
  highlights = {
    ERROR = "NotifyError",
    WARN = "NotifyWarn",
    INFO = "NotifyInfo",
    DEBUG = "NotifyDebug",
    TRACE = "NotifyTrace",
  },
})
