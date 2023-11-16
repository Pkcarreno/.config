return {
  {
    "projekt0n/github-nvim-theme",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
    config = function()
      require("github-theme").setup({})
      vim.cmd("colorscheme github_dark")
    end,
  },
}
