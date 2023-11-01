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
    dim_inactive = false,             -- dims inactive windows
  }
})

-- Set Colorscheme
vim.cmd('colorscheme ' .. 'github_dark_dimmed')
