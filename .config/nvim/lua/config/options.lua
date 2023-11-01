local options = {
	hlsearch = false,                 -- Set highlight on search
	number = true,                    -- Make line numbers default
	mouse = 'a',                      -- Enable mouse mode
	clipboard = 'unnamedplus',        -- Sync clipboard between OS and Neovim.
	breakindent = true,               -- Enable break indent
	undofile = true,                  -- Save undo history
	ignorecase = true,                -- Case-insensitive searching UNLESS \C or capital in search
	smartcase = true,
	signcolumn = 'yes',               -- Keep signcolumn on by default
	updatetime = 250,                 -- Decrease update time
	timeoutlen = 300,
	completeopt = 'menuone,noselect', -- Set completeopt to have a better completion experience
	termguicolors = true,             -- set term gui colors (most terminals support this)
}

local globals = {
  mapleader                   = ' ',        --- Map leader key to SPC
  maplocalleader              = ',',        --- Map local leader key to comma
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

for k, v in pairs(globals) do
  vim.g[k] = v
end