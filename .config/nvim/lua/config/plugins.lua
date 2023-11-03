return {
  -- Themes
  {
    'projekt0n/github-nvim-theme',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme github_dark_dimmed]])
      require('config.colorscheme')
    end,
  },
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup({ default = true })
    end,
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'hiphish/rainbow-delimiters.nvim',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'RRethy/nvim-treesitter-textsubjects',
    },
    build = ':TSUpdate',
    config = function ()
      require('plugins.treesitter')
    end
  },

  -- Navigating (Telescope/Tree/Refactor)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { "cljoly/telescope-repo.nvim" },

    },
    config = function()
      require('plugins.telescope')
    end
  },
  {
    "gbprod/stay-in-place.nvim",
    lazy = false,
    config = true, -- run require("stay-in-place").setup()
  },

  -- LSP Base
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
      'mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
      { 'folke/neodev.nvim', opts = {} },
    },
    servers = nil,
  },
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    keys = {
      { '<leader>cm', '<cmd>Mason<cr>', desc = 'Mason' },
    },
  },

  -- LSP Cmp
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    config = function()
      require('plugins.cmp')
    end,
    dependencies = {
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-calc',
      'saadparwaiz1/cmp_luasnip',
      { 'L3MON4D3/LuaSnip', dependencies = 'rafamadriz/friendly-snippets' },
      {
        'David-Kunz/cmp-npm',
        config = function()
          require('plugins.cmp-npm')
        end,
      },
    },
  },

  -- LSP Addons
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    dependencies = 'MunifTanjim/nui.nvim',
    config = function()
      require('plugins.dressing')
    end,
  },
  { 'onsails/lspkind-nvim' },
  {
    'folke/trouble.nvim',
    cmd = { 'TroubleToggle', 'Trouble' },
    config = function()
      require('plugins.trouble')
    end,
  },
  { 'nvim-lua/popup.nvim' },
  {
    'SmiteshP/nvim-navic',
    config = function()
      require('plugins.navic')
    end,
    dependencies = 'neovim/nvim-lspconfig',
  },
  {
    'pmizio/typescript-tools.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    ft = { 'typescript', 'typescriptreact' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig',
    },
    config = function()
      require('plugins.typescript-tools')
    end,
  },
  {
    'axelvc/template-string.nvim',
    event = 'InsertEnter',
    ft = {
      'javascript',
      'typescript',
      'javascriptreact',
      'typescriptreact',
    },
    config = true, -- run require('template-string').setup()
  },
  {
    'dmmulroy/tsc.nvim',
    cmd = { 'TSC' },
    config = true,
  },
  {
    'dnlhc/glance.nvim',
    config = function()
      require('plugins.glance')
    end,
    cmd = { 'Glance' },
    keys = {
      { 'gd', '<cmd>Glance definitions<CR>',      desc = 'LSP Definition' },
      { 'gr', '<cmd>Glance references<CR>',       desc = 'LSP References' },
      { 'gm', '<cmd>Glance implementations<CR>',  desc = 'LSP Implementations' },
      { 'gy', '<cmd>Glance type_definitions<CR>', desc = 'LSP Type Definitions' },
    },
  },
  {
    'antosha417/nvim-lsp-file-operations',
    event = 'LspAttach',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
    },
    config = function()
      require('lsp-file-operations').setup()
    end
  },

  -- General
  {
    "numToStr/Comment.nvim",
    lazy = false,
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("plugins.comment")
    end,
  },
  {
    'folke/which-key.nvim',
     opts = {},
     config = function ()
       require('plugins.which-key')
     end
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('plugins.lualine')
    end,
    event = 'VeryLazy',
  },
  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup({
        background_colour = '#000000',
      })
    end,
    init = function()
      local banned_messages = {
        'No information available',
        'LSP[tsserver] Inlay Hints request failed. Requires TypeScript 4.4+.',
        'LSP[tsserver] Inlay Hints request failed. File not opened in the editor.',
      }
      vim.notify = function(msg, ...)
        for _, banned in ipairs(banned_messages) do
          if msg == banned then
            return
          end
        end
        return require('notify')(msg, ...)
      end
    end,
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
      vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
    end,
  },
  {
    "echasnovski/mini.bufremove",
    version = "*",
    config = function()
      require("mini.bufremove").setup({
        silent = true,
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "echasnovski/mini.bufremove",
    },
    version = "*",
    config = function()
      require("plugins.bufferline")
    end,
    keys = {
      { "<Space>1",    "<cmd>BufferLineGoToBuffer 1<CR>" },
      { "<Space>2",    "<cmd>BufferLineGoToBuffer 2<CR>" },
      { "<Space>3",    "<cmd>BufferLineGoToBuffer 3<CR>" },
      { "<Space>4",    "<cmd>BufferLineGoToBuffer 4<CR>" },
      { "<Space>5",    "<cmd>BufferLineGoToBuffer 5<CR>" },
      { "<Space>6",    "<cmd>BufferLineGoToBuffer 6<CR>" },
      { "<Space>7",    "<cmd>BufferLineGoToBuffer 7<CR>" },
      { "<Space>8",    "<cmd>BufferLineGoToBuffer 8<CR>" },
      { "<Space>9",    "<cmd>BufferLineGoToBuffer 9<CR>" },
      { "<A-1>",       "<cmd>BufferLineGoToBuffer 1<CR>" },
      { "<A-2>",       "<cmd>BufferLineGoToBuffer 2<CR>" },
      { "<A-3>",       "<cmd>BufferLineGoToBuffer 3<CR>" },
      { "<A-4>",       "<cmd>BufferLineGoToBuffer 4<CR>" },
      { "<A-5>",       "<cmd>BufferLineGoToBuffer 5<CR>" },
      { "<A-6>",       "<cmd>BufferLineGoToBuffer 6<CR>" },
      { "<A-7>",       "<cmd>BufferLineGoToBuffer 7<CR>" },
      { "<A-8>",       "<cmd>BufferLineGoToBuffer 8<CR>" },
      { "<A-9>",       "<cmd>BufferLineGoToBuffer 9<CR>" },
      { "<Leader>bb",  "<cmd>BufferLineMovePrev<CR>",                desc = "Move back" },
      { "<Leader>bl",  "<cmd>BufferLineCloseLeft<CR>",               desc = "Close Left" },
      { "<Leader>br",  "<cmd>BufferLineCloseRight<CR>",              desc = "Close Right" },
      { "<Leader>bn",  "<cmd>BufferLineMoveNext<CR>",                desc = "Move next" },
      { "<Leader>bp",  "<cmd>BufferLinePick<CR>",                    desc = "Pick Buffer" },
      { "<Leader>bP",  "<cmd>BufferLineTogglePin<CR>",               desc = "Pin/Unpin Buffer" },
      { "<Leader>bsd", "<cmd>BufferLineSortByDirectory<CR>",         desc = "Sort by directory" },
      { "<Leader>bse", "<cmd>BufferLineSortByExtension<CR>",         desc = "Sort by extension" },
      { "<Leader>bsr", "<cmd>BufferLineSortByRelativeDirectory<CR>", desc = "Sort by relative dir" },
    }
  },
  {
    "folke/noice.nvim",
    cond = true,
    lazy = false,
    config = function()
      require("plugins.noice")
    end,
  },
  {
    "Wansmer/treesj",
    lazy = true,
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    keys = {
      { "gJ", "<cmd>TSJToggle<CR>", desc = "Toggle Split/Join" },
    },
    config = function()
      require("treesj").setup({
        use_default_keymaps = false,
      })
    end,
  },
  { "tpope/vim-speeddating", lazy = false },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      char = {
        keys = { "f", "F", "t", "T" },
      }
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
      },
    },
  },
  {
    "Shatur/neovim-session-manager",
    lazy = false,
    config = function()
      require("plugins.session-manager")
    end,
    keys = {
      { "<Leader>/sc", "<cmd>SessionManager load_session<CR>",             desc = "choose session" },
      { "<Leader>/sr", "<cmd>SessionManager delete_session<CR>",           desc = "remove session" },
      { "<Leader>/sd", "<cmd>SessionManager load_current_dir_session<CR>", desc = "load current dir session" },
      { "<Leader>/sl", "<cmd>SessionManager load_last_session<CR>",        desc = "load last session" },
      { "<Leader>/ss", "<cmd>SessionManager save_current_session<CR>",     desc = "save session" },
    }
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = true,
  },
  {
    "nacro90/numb.nvim",
    lazy = false,
    config = true,
  },
  {
    "echasnovski/mini.align",
    lazy = false,
    version = "*",
    config = true,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    main = "ibl",
    config = function()
      require("plugins.indent")
    end,
  },
  {
    "chrisgrieser/nvim-spider",
    cond = true,
    lazy = true,
    keys = { "w", "e", "b", "ge" },
    config = function()
      vim.keymap.set({ "n", "o", "x" }, "W", "w", { desc = "Normal w" })
      vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
      vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
      vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
      vim.keymap.set(
        { "n", "o", "x" },
        "ge",
        "<cmd>lua require('spider').motion('ge')<CR>",
        { desc = "Spider-ge" }
      )
    end,
  },

  -- Snippets & Language & Syntax
  'tpope/vim-sleuth',
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("plugins.autopairs")
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("plugins.colorizer")
    end,
  },
  {
    "js-everts/cmp-tailwind-colors",
    config = true,
  },
  {
    "razak17/tailwind-fold.nvim",
    opts = {
      min_chars = 50,
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "html", "svelte", "astro", "vue", "typescriptreact" },
  },
  {
    "MaximilianLloyd/tw-values.nvim",
    keys = {
      { "<Leader>cv", "<CMD>TWValues<CR>", desc = "Tailwind CSS values" },
    },
    opts = {
      border =  "rounded", -- Valid window border style,
      show_unknown_classes = true                   -- Shows the unknown classes popup
    }
  },
  {
    "laytan/tailwind-sorter.nvim",
    cmd = {
      "TailwindSort",
      "TailwindSortOnSaveToggle"
    },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
    build = "cd formatter && npm i && npm run build",
    config = true,
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.git.signs")
    end,
    keys = {
      { "<Leader>ghd", desc = "diff hunk" },
      { "<Leader>ghp", desc = "preview" },
      { "<Leader>ghR", desc = "reset buffer" },
      { "<Leader>ghr", desc = "reset hunk" },
      { "<Leader>ghs", desc = "stage hunk" },
      { "<Leader>ghS", desc = "stage buffer" },
      { "<Leader>ght", desc = "toggle deleted" },
      { "<Leader>ghu", desc = "undo stage" },
    }
  },
  {
    "sindrets/diffview.nvim",
    lazy = true,
    enabled = true,
    event = "BufRead",
    config = function()
      require("plugins.git.diffview")
    end,
    keys = {
      { "<Leader>gd", "<cmd>lua require('plugins.git.diffview').toggle_file_history()<CR>", desc = "diff file" },
      { "<Leader>gS", "<cmd>lua require('plugins.git.diffview').toggle_status()<CR>",       desc = "status" }
    },
  },
  {
    "akinsho/git-conflict.nvim",
    lazy = false,
    config = function()
      require("plugins.git.conflict")
    end,
    keys = {
      { "<Leader>gcb", '<cmd>GitConflictChooseBoth<CR>',   desc = 'choose both' },
      { "<Leader>gcn", '<cmd>GitConflictNextConflict<CR>', desc = 'move to next conflict' },
      { "<Leader>gcc", '<cmd>GitConflictChooseOurs<CR>',   desc = 'choose current' },
      { "<Leader>gcp", '<cmd>GitConflictPrevConflict<CR>', desc = 'move to prev conflict' },
      { "<Leader>gci", '<cmd>GitConflictChooseTheirs<CR>', desc = 'choose incoming' },
    }
  },
  {
    "ThePrimeagen/git-worktree.nvim",
    lazy = false,
    config = function()
      require("plugins.git.worktree")
    end,
    keys = {
      { "<Leader>gww", desc = "worktrees" },
      { "<Leader>gwc", desc = "create worktree" }
    }
  },

  -- AI
  {
    "jcdickinson/codeium.nvim",
    cond = true,
    event = "InsertEnter",
    cmd = "Codeium",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = true,
  },
}
