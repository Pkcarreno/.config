return {
    'akinsho/nvim-bufferline.lua',
    keys = {
        { '<Tab>',   '<Cmd>BufferLineCycleNext<CR>' },
        { '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>' },
    },
    event = 'ColorScheme',
    config = function()
      local status, bufferline = pcall(require, "bufferline")
      if (not status) then return end

      local highlights = require('rose-pine.plugins.bufferline')

      bufferline.setup({
          options = {
              mode = "tabs",
              -- separator_style = 'slant',
              always_show_bufferline = false,
              show_buffer_close_icons = false,
              show_close_icon = false,
              color_icons = true
          },
          highlights = highlights,
      })
    end
}
