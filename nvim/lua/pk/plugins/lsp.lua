return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "jose-elias-alvarez/null-ls.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "hrsh7th/cmp-nvim-lsp",
    {
      'glepnir/lspsaga.nvim',
      opts = {
        ui = {
          winblend = 10,
          border = 'rounded',
          colors = {
            normal_bg = '#232136'
          }
        }
      }
    },
    {
      "j-hui/fidget.nvim",
      opts = {
        sources = {
          ["null-ls"] = {
            ignore = true
          }
        }
      },
    },
  },
  event = "VeryLazy",
  config = function()
    -- LSP configuration
    local nvim_lsp = require("lspconfig")

    local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
    local enable_format_on_save = function(_, bufnr)
      vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(_, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

      --Enable completion triggered by <c-x><c-o>
      --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
      --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      local opts = { noremap = true, silent = true }

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    end

    -- Set up completion using nvim_cmp with LSP source
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    nvim_lsp.flow.setup {
      on_attach = on_attach,
      capabilities = capabilities
    }

    nvim_lsp.tsserver.setup {
      on_attach = on_attach,
      filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
      cmd = { "typescript-language-server.cmd", "--stdio" },
      capabilities = capabilities
    }

    nvim_lsp.sourcekit.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    nvim_lsp.lua_ls.setup {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        enable_format_on_save(client, bufnr)
      end,
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
          },

          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false
          },
        },
      },
    }

    nvim_lsp.tailwindcss.setup {
      on_attach = on_attach,
      capabilities = capabilities
    }

    nvim_lsp.cssls.setup {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        enable_format_on_save(client, bufnr)
      end,
      capabilities = capabilities
    }

    nvim_lsp.html.setup {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        enable_format_on_save(client, bufnr)
      end,
      filetypes = { "html" },
      init_options = {
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = {
          css = true,
          javascript = true
        },
        provideFormatter = true
      },
      single_file_support = true,
      capabilities = capabilities
    }

    nvim_lsp.astro.setup {
      on_attach = on_attach,
      capabilities = capabilities
    }

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      }
    )

    -- Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.diagnostic.config({
      virtual_text = {
        prefix = '●'
      },
      update_in_insert = true,
      float = {
        source = "always",       -- Or "if_many"
      },
    })

    -- mason
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool = require("mason-tool-installer")

    mason.setup()

    mason_lspconfig.setup {
      automatic_installation = true
    }

    mason_tool.setup({
      ensure_installed = {
        "prettierd",
        "eslint_d",
        "html-lsp",
        "rust-analyzer",
        "typescript-language-server",
        "tailwindcss-language-server",
        "astro-language-server",
        "lua-language-server",
      }
    })

    -- null-ls
    local null_ls = require("null-ls")

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    local lsp_formatting = function(bufnr)
      vim.lsp.buf.format({
        filter = function(client)
          return client.name == "null-ls"
        end,
        bufnr = bufnr,
      })
    end

    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.diagnostics.eslint_d.with({
          diagnostics_format = '[eslint] #{m}\n(#{c})'
        }),
        null_ls.builtins.diagnostics.fish
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              lsp_formatting(bufnr)
            end,
          })
        end
      end,
    }

    vim.api.nvim_create_user_command(
      'DisableLspFormatting',
      function()
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
      end,
      { nargs = 0 }
    )

    -- lspsaga
    local diagnostic = require("lspsaga.diagnostic")
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
    vim.keymap.set('n', 'gl', '<Cmd>Lspsaga show_line_diagnostic<CR>', opts)
    vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
    vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
    -- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
    vim.keymap.set('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
    vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)

    -- code action
    local codeaction = require("lspsaga.codeaction")
    vim.keymap.set('n', '<leader>ca', function() codeaction:code_action() end, { silent = true })
    vim.keymap.set('v', '<leader>ca', function()
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
      codeaction:range_code_action()
    end, { silent = true })
  end
}
