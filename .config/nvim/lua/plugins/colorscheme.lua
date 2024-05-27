return {
  {
    "myypo/borrowed.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      transparent = true,
      overrides = {
        groups = {
          all = {
            DashboardShortCut = { link = "keyword" },
            DashboardHeader = { fg = "speak" },
            DashboardCenter = { link = "comment" },
            DashboardFooter = { fg = "extra", style = "italic" },
            InclineNormal = { bg = "speak", fg = "sheet" },
            LspReferenceText = { bg = "speak", fg = "sheet" },
            LspReferenceWrite = { bg = "speak", fg = "sheet" },
            LspReferenceRead = { bg = "speak", fg = "sheet" },
          },
        },
      },
    },
  },
}
