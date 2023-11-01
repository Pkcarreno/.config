-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      mappings = {
        -- your custom insert mode mappings
	["i"] = {
          ["<C-w>"] = function()
            vim.cmd('normal vbd')
          end

        },
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
-- Enable file-browser, if installed
pcall(require('telescope').load_extension 'file_browser')
