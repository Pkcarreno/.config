local status, rose_pine = pcall(require, 'rose-pine')
if (not status) then return end

rose_pine.setup({
  disable_background = true,
  disable_float_background = true,
  comment_italics = true,
})

vim.cmd('colorscheme rose-pine')
