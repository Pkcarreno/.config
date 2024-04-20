return {
  {
    "myypo/borrowed.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      transparent = true,
      overrides = {
        strategy = "merge",
      },
    },
    config = function(_, opts)
      require("borrowed").setup(opts)
    end,
  },
}
