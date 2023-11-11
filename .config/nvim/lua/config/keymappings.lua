local keymap = vim.keymap.set
local silent = { silent = true }

table.unpack = table.unpack or unpack -- 5.1 compatibility

-- Keymaps for better default experience
keymap({ 'n', 'v' }, '<Space>', '<Nop>', silent)

-- Remap for dealing with word wrap
keymap('n', 'k', 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })
keymap('n', 'j', 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })

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
keymap("v", "<S-`>", "U", silent)

-- Search
keymap("n", "<leader>sg", "<CMD>lua require('plugins.telescope').project_files()<CR>", { desc = '[S]earch [G]it Files'})
keymap('n', '<leader>so', require('telescope.builtin').oldfiles, { desc = '[S]earch [O]ld Files' })
keymap('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffers' })
keymap('n', '<leader>sc', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[S]earch in [C]urrent buffer' })

keymap('n', ';f', function()
   require('telescope.builtin').find_files({ no_ignore = false, hidden = true })
  end,
  { desc = 'Search file by word' }
)
keymap('n', ';r', require('telescope.builtin').live_grep, { desc = 'Search by grep' })
keymap('n', 'sf', function()
    require('telescope').extensions.file_browser.file_browser({
      path = '%:p:h',
      cwd = vim.fn.expand('%:p:h'),
      respect_gitignore = false,
      hidden = true,
      grouped = true,
      previewer = false,
      initial_mode = 'normal',
      layout_config = { height = 40 }
    })
  end,
  {
   desc = '[S]earch [F]iles',
})

-- Diagnostics
keymap('n', '<leader>d', require('telescope.builtin').diagnostics, { desc = '[D]iagnostics' })
keymap('n', '<leader>dr', require('telescope.builtin').resume, { desc = '[D]iagnostics: [R]esume' })
keymap('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = '[D]iagnostic [P]revious message' })
keymap('n', '<leader>dn', vim.diagnostic.goto_next, { desc = '[D]iagnostic [N]ext message' })
keymap('n', '<leader>dm', vim.diagnostic.open_float, { desc = 'Open floating [D]iagnostic [M]essage' })
keymap('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open [D]iagnostics [L]ist' })

-- LSP
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

-- Buffers
keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", silent)
keymap("n", "<leader>bn", ":bn<CR>", { desc = '[B]uffer [N]ext' })
keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", silent)
keymap("n", "<leader>bp", ":bp<CR>", { desc = '[B]uffer [P]revious' })
keymap("n", "<S-q>", ":lua require('mini.bufremove').delete(0, false)<CR>", silent)

-- Increment/decrement
keymap("n", "+", "<C-a>", silent)
keymap("n", "-", "<C-x>", silent)

-- Delete a word backwards
keymap("n", "dw", "vb\"_d", silent)

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", silent)

-- Split window
keymap("n", "<leader>ss", ":split<Return><C-w>w", { desc = '[S]plit Window' })
keymap("n", "<leader>sv", ":vsplit<Return><C-w>w", { desc = '[S]plit [V]ertical Window' })

-- Resize window
keymap("n", "<C-w><left>", "<C-w><", silent)
keymap("n", "<C-w><right>", "<C-w>>", silent)
keymap("n", "<C-w><up>", "<C-w>+", silent)
keymap("n", "<C-w><down>", "<C-w>-", silent)

-- Don't yank on delete char
keymap("n", "x", '"_x', silent)
keymap("n", "X", '"_X', silent)
keymap("v", "x", '"_x', silent)
keymap("v", "X", '"_X', silent)

-- Don't yank on visual paste
keymap("v", "p", '"_dP', silent)

-- Do nothing on capital Q
keymap("n", "Q", "<nop>", silent)

-- Replace current word
keymap("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[R]eplace current word'})
