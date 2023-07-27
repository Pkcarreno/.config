local keymap = vim.keymap.set
local silent = { silent = true }

table.unpack = table.unpack or unpack -- 5.1 compatibility

-- Better window movement
keymap("n", "sh", "<C-w>h", silent)
keymap("n", "sj", "<C-w>j", silent)
keymap("n", "sk", "<C-w>k", silent)
keymap("n", "sl", "<C-w>l", silent)
keymap("n", "<Space>", "<C-w>w")

-- H to move to the first non-blank character of the line
keymap("n", "H", "^", silent)

-- Move selected line / block of text in visual mode
keymap("x", "J", ":move '>+1<CR>gv-gv", silent)
keymap("x", "K", ":move '<-2<CR>gv-gv", silent)

-- Keep visual mode indenting
keymap("v", "H", "<gv", silent)
keymap("v", "L", ">gv", silent)

-- Case change in visual mode
keymap("v", "`", "u", silent)
keymap("v", "<A-`>", "U", silent)

-- Save file by CTRL-S
keymap("n", "<C-s>", ":w<CR>", silent)
keymap("i", "<C-s>", "<ESC> :w<CR>", silent)

-- Telescope
keymap("n", ";f", "<CMD>lua require('telescope.builtin').find_files({ no_ignore = false, hidden = true })<CR>")
keymap("n", ";r", "<CMD>lua require('telescope.builtin').live_grep()<CR>")
keymap("n", "\\\\", "<CMD>lua require('telescope.builtin').buffers()<CR>")
keymap("n", ";t", "<CMD>lua require('telescope.builtin').help_tags()<CR>")
keymap("n", ";;", "<CMD>lua require('telescope.builtin').resume()<CR>")
keymap("n", ";e", "<CMD>lua require('telescope.builtin').diagnostics()<CR>")
keymap("n", "sf", "<CMD>lua require('telescope').extensions.file_browser.file_browser({ path = \"%:p:h\", cwd = vim.fn.expand('%:p:h'), respect_gitignore = false, hidden = true, grouped = true, previewer = false, initial_mode = \"normal\", layout_config = { height = 40 } })<CR>")
keymap("n", "<leader>gc", "<CMD>lua require('telescope.builtin').git_branches()<CR>")
keymap("n", "<leader>gs", "<CMD>lua require('telescope.builtin').git_status()<CR>")








-- Remove highlights
keymap("n", "<CR>", ":noh<CR><CR>", silent)

-- Buffers
keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", silent)
keymap("n", "gn", ":bn<CR>", silent)
keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", silent)
keymap("n", "gp", ":bp<CR>", silent)
keymap("n", "<S-q>", ":lua require('mini.bufremove').delete(0, false)<CR>", silent)

-- Move between barbar buffers
keymap("n", "<Space>1", ":BufferLineGoToBuffer 1<CR>", silent)
keymap("n", "<Space>2", ":BufferLineGoToBuffer 2<CR>", silent)
keymap("n", "<Space>3", ":BufferLineGoToBuffer 3<CR>", silent)
keymap("n", "<Space>4", ":BufferLineGoToBuffer 4<CR>", silent)
keymap("n", "<Space>5", ":BufferLineGoToBuffer 5<CR>", silent)
keymap("n", "<Space>6", ":BufferLineGoToBuffer 6<CR>", silent)
keymap("n", "<Space>7", ":BufferLineGoToBuffer 7<CR>", silent)
keymap("n", "<Space>8", ":BufferLineGoToBuffer 8<CR>", silent)
keymap("n", "<Space>9", ":BufferLineGoToBuffer 9<CR>", silent)
keymap("n", "<A-1>", ":BufferLineGoToBuffer 1<CR>", silent)
keymap("n", "<A-2>", ":BufferLineGoToBuffer 2<CR>", silent)
keymap("n", "<A-3>", ":BufferLineGoToBuffer 3<CR>", silent)
keymap("n", "<A-4>", ":BufferLineGoToBuffer 4<CR>", silent)
keymap("n", "<A-5>", ":BufferLineGoToBuffer 5<CR>", silent)
keymap("n", "<A-6>", ":BufferLineGoToBuffer 6<CR>", silent)
keymap("n", "<A-7>", ":BufferLineGoToBuffer 7<CR>", silent)
keymap("n", "<A-8>", ":BufferLineGoToBuffer 8<CR>", silent)
keymap("n", "<A-9>", ":BufferLineGoToBuffer 9<CR>", silent)

-- Don't yank on delete char
keymap("n", "x", '"_x', silent)
keymap("n", "X", '"_X', silent)
keymap("v", "x", '"_x', silent)
keymap("v", "X", '"_X', silent)

-- Don't yank on visual paste
keymap("v", "p", '"_dP', silent)

-- Quickfix
keymap("n", "<Space>,", ":cp<CR>", silent)
keymap("n", "<Space>.", ":cn<CR>", silent)

-- Toggle quicklist
keymap("n", "<leader>q", "<cmd>lua require('utils').toggle_quicklist()<CR>", silent)

-- Open links under cursor in browser with gx
if vim.fn.has('macunix') == 1 then
  keymap("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>", silent)
else
  keymap("n", "gx", "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<CR>", silent)
end

-- Refactor with spectre
keymap("n", "<Leader>pr", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", silent)
keymap("v", "<Leader>pr", "<cmd>lua require('spectre').open_visual()<CR>")

-- LSP
-- keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", silent) -- Replaced with Glance plugin
-- keymap("n", "gr", "<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>", silent) -- Replaced with Glance plugin
keymap("n", "<C-Space>", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
keymap("v", "<leader>ca", "<cmd>'<,'>lua vim.lsp.buf.code_action()<CR>", silent)
keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", silent)
keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", silent)
keymap("v", "<leader>cf", function()
  local start_row, _ = table.unpack(vim.api.nvim_buf_get_mark(0, "<"))
  local end_row, _ = table.unpack(vim.api.nvim_buf_get_mark(0, ">"))

  vim.lsp.buf.format({
    range = {
      ["start"] = { start_row, 0 },
      ["end"] = { end_row, 0 },
    },
    async = true,
  })
end, silent)
keymap("n", "<leader>cl", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", silent)
keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", silent)
keymap("n", "L", "<cmd>lua vim.lsp.buf.signature_help()<CR>", silent)
keymap("n", "]g", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded', max_width = 100 }})<CR>", silent)
keymap("n", "[g", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded', max_width = 100 }})<CR>", silent)
keymap("n", "K", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end)

-- Comment Box
keymap("n", "<leader>ac", "<cmd>lua require('comment-box').lbox()<CR>", silent)
keymap("v", "<leader>ac", "<cmd>lua require('comment-box').lbox()<CR>", silent)

-- Increment/decrement
keymap("n", "+", "<C-a>")
keymap("n", "-", "<C-x>")

-- Delete a word backwards
keymap("n", "dw", "vb\"_d")

-- Select all
keymap("n", "<C-a>", "gg<S-v>G")

-- New tab
keymap("n", "te", ":tabedit<cr>")

-- Split window
keymap("n", "ss", ":split<Return><C-w>w")
keymap("n", "sv", ":vsplit<Return><C-w>w")

-- Resize window
keymap("n", "<C-w><left>", "<C-w><")
keymap("n", "<C-w><right>", "<C-w>>")
keymap("n", "<C-w><up>", "<C-w>+")
keymap("n", "<C-w><down>", "<C-w>-")