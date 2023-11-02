local bufferline = require("bufferline")

bufferline.setup({
  options = {
    show_close_icon = false,
    color_icons = true,
    show_buffer_close_icons = false,
    separator_style = { "|", "|" },
    always_show_bufferline = false,
    style_preset = bufferline.style_preset.no_italic,
    numbers = function(opts)
      return string.format("%s", opts.ordinal)
    end,
    custom_filter = function(buf_number)
      -- filter out filetypes you don't want to see
      if vim.bo[buf_number].filetype ~= "qf" then
        return true
      end
    end,
  },
})
