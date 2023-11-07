local present, github = pcall(require, 'github-theme')
if not present then
  return
end

github.setup({
  options = {
    transparent = true,    -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
      -- Style to be applied to different syntax groups
      -- Value is any valid attr-list value `:help attr-list`
      comments = 'NONE',
      keywords = 'italic',
      functions = 'NONE',
      variables = 'NONE',
    },
    darken = {
      floats = true,
      sidebars = {
        enabled = true,
        list = {'qf', 'help'}
      }
    },
    hide_nc_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    hide_end_of_buffer = true,
  },
  groups = {
    all = {
      CursorLineNr = { fg = 'palette.orange'},
      LineNr = { link = 'Comment' },
      NormalFloat = { bg = 'None', fg = 'None' },
      FloatBorder = { bg = 'None', fg = 'palette.blue.bright' },
      WhichKeyFloat = { bg = 'None', fg = 'palette.blue.bright' },
      BqfPreviewBorder = { link = 'FloatBorder' },
      BufferInactiveIndex = { link = 'BufferInactive' },
      LspInfoBorder = { link = 'FloatBorder' },
      TelescopeBorder = { bg = 'None', fg = 'palette.blue.base' },
      TelescopeNormal = { bg = 'None', fg = 'None' },
      TelescopeTitle = { fg = 'palette.blue.bright' },
      TelescopeMatching = { fg = 'palette.blue.base' },
      MsgArea = { fg = 'bg3' },
      GitSignsCurrentLineBlame = { link = 'Comment' },
      StatusLine = { bg = 'None' },
      StatusLineNC = { bg = 'None' },
      BufferOffset = { fg = 'palette.orange' },
      LspInlayHint = { link = 'LspCodeLens' },
      CmpBorderedWindoes_FloatBorder = { fg = 'palette.blue.base' },
      CmpItemAbbr = { fg = 'fg2', bg = "None" },
      CmpItemKindClass = { fg = 'palette.orange' },
      CmpItemKindConstructor = { fg = 'palette.magenta.base' },
      CmpItemKindFolder = { fg = 'palette.blue.bright' },
      CmpItemKindFunction = { fg = 'palette.blue.base' },
      CmpItemKindInterface = { fg = 'palette.cyan.bright', bg = 'None' },
      CmpItemKindKeyword = { fg = 'palette.magenta.bright' },
      CmpItemKindMethod = { fg = 'palette.red.base' },
      CmpItemKindReference = { fg = 'palette.red.bright' },
      CmpItemKindSnippet = { fg = 'fg2' },
      CmpItemKindVariable = { fg = 'palette.cyan.base', bg = 'None' },
      CmpItemKindText = { fg = 'fg3' },
      CmpItemMenu = { fg = 'palette.pink.base', bg = 'None' },
      CmpItemAbbrMatch = { fg = 'palette.blue.base', bg = 'None' },
      CmpItemAbbrMatchFuzzy = { fg = 'palette.blue.base', bg = 'None' },
    }
  }
})

-- Set Colorscheme
vim.cmd('colorscheme ' .. 'github_dark_dimmed')
