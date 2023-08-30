local present, github_theme = pcall(require, "github-theme")
if not present then
  return
end

local c = require("github-theme.palette").load('github_dark_high_contrast')

-- ╭──────────────────────────────────────────────────────────╮
-- │ Setup Colorscheme                                        │
-- ╰──────────────────────────────────────────────────────────╯
github_theme.setup({
  options = {
    transparent = true,    -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
      -- Style to be applied to different syntax groups
      -- Value is any valid attr-list value `:help attr-list`
      comments = "NONE",
      keywords = "italic",
      functions = "NONE",
      variables = "NONE",
    },
    darken = {
      floats = true,
      sidebars = {
        enabled = true,
        list = {'qf', 'help'}
      }
    },
    hide_nc_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    dim_inactive = false,             -- dims inactive windows
  }
})

-- Set Colorscheme
vim.cmd("colorscheme " .. EcoVim.colorscheme)

-- Ecovim Colors
vim.api.nvim_set_hl(0, "EcovimPrimary", { fg = c.blue.base })
vim.api.nvim_set_hl(0, "EcovimSecondary", { fg = c.orange })

vim.api.nvim_set_hl(0, "EcovimPrimaryBold", { bold = true, fg = c.blue.base })
vim.api.nvim_set_hl(0, "EcovimSecondaryBold", { bold = true, fg = c.orange })

vim.api.nvim_set_hl(0, "EcovimHeader", { bold = true, fg = c.blue.base })
vim.api.nvim_set_hl(0, "EcovimHeaderInfo", { bold = true, fg = c.orange })
vim.api.nvim_set_hl(0, "EcovimFooter", { bold = true, fg = c.orange })

-- github_dark Colorscheme Specific Config
if EcoVim.colorscheme == "github_dark_high_contrast" then
  -- Lines
  vim.api.nvim_set_hl(0, "CursorLineNR", { link = "EcovimSecondary" })
  vim.api.nvim_set_hl(0, "LineNr", { link = "Comment" })

  -- Floats/Windows
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None", fg = "None" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "None", fg = c.blue.base })
  vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "None", fg = c.blue.base })
  vim.api.nvim_set_hl(0, "BufferTabpageFill", { fg = "None" })
  vim.api.nvim_set_hl(0, "VertSplit", { bg = c.bg1, fg = c.bg1})
  vim.api.nvim_set_hl(0, "BqfPreviewBorder", { link = "FloatBorder" })
  vim.api.nvim_set_hl(0, "BufferInactiveIndex", { link = "BufferInactive" })
  vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "FloatBorder" })

  -- Misc
  vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { link = "Comment" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "None" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "None" })
  vim.api.nvim_set_hl(0, "rainbowcol1", { fg = c.blue.base, ctermfg = 9 })
  vim.api.nvim_set_hl(0, "TSRainbowRed", { fg = c.blue.base, ctermfg = 9 })
  vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = c.blue.base, ctermfg = 9 })
  vim.api.nvim_set_hl(0, "Boolean", { fg = c.red.base })
  vim.api.nvim_set_hl(0, "BufferOffset", { link = "EcovimSecondary" })
  vim.api.nvim_set_hl(0, "LspInlayHint", { link = "LspCodeLens" })

  -- Bufferline
  vim.api.nvim_set_hl(0, "BufferCurrentSign", { fg = c.cyan.base })
  vim.api.nvim_set_hl(0, "BufferInactiveSign", { bg = c.bg4, fg = c.bg1 })
  vim.api.nvim_set_hl(0, "BufferInactiveMod", { bg = "NONE", fg = c.yellow.base })

  vim.api.nvim_set_hl(0, "BufferLineSeparator", { fg = c.blue.base })
  vim.api.nvim_set_hl(0, "BufferLineBackground", { fg = c.fg0 })
  vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { fg = c.fg3, bold = true })

  -- Completion Menu Colors
  local highlights = {
    CmpItemAbbr = { fg = c.comment, bg = "NONE" },
    CmpItemKindClass = { fg = c.orange },
    CmpItemKindConstructor = { fg = c.magenta.base },
    CmpItemKindFolder = { fg = c.blue.bright.base },
    CmpItemKindFunction = { fg = c.blue.base },
    CmpItemKindInterface = { fg = c.cyan.bright, bg = "NONE" },
    CmpItemKindKeyword = { fg = c.magenta.bright },
    CmpItemKindMethod = { fg = c.red.base },
    CmpItemKindReference = { fg = c.red.bright },
    CmpItemKindSnippet = { fg = c.orange },
    CmpItemKindVariable = { fg = c.cyan.base, bg = "NONE" },
    CmpItemKindText = { fg = "LightGrey" },
    CmpItemMenu = { fg = c.pink.bright, bg = "NONE" },
    CmpItemAbbrMatch = { fg = c.cyan.base, bg = "NONE" },
    CmpItemAbbrMatchFuzzy = { fg = c.cyan.base, bg = "NONE" },
  }

  vim.api.nvim_set_hl(0, "CmpBorderedWindow_FloatBorder", { fg = c.blue.base })

  for group, hl in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, hl)
  end
end
