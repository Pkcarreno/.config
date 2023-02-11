return {
    'rose-pine/neovim', -- Rose Pine Theme
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
        require("rose-pine").setup({
            disable_background = true,
            disable_float_background = true,
            comment_italics = true,
        })
        vim.cmd('colorscheme rose-pine')
    end
}
