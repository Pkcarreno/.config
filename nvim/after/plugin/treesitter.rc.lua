local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

ts.setup {
 	highlight = {
		enable = true,
		disabled = {},
	},
	indent = {
		enable = true,
		disabled = {},
	},
	ensure_installed = {
		'tsx',
		'lua',
		'json',
		'css'
	},
	autotag = {
		enable = true,
	}
}
