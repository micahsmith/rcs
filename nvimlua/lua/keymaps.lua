vim.g.mapleader = ","

local map = vim.api.nvim_set_keymap
local opts = {noremap = true}

-- navigation
map('n', '<leader>e', ':edit<space>', opts)
map('n', '<leader>bn', ':bnext<cr>', opts)
map('n', '<leader>bp', ':bprevious<cr>', opts)
map('n', '<leader>sh', '<c-w>h', opts)
map('n', '<leader>sj', '<c-w>j', opts)
map('n', '<leader>sk', '<c-w>k', opts)
map('n', '<leader>sl', '<c-w>l', opts)

-- regex
map('n', '/', '/\\v', {noremap = true})
map('v', '/', '/\\v', {noremap = true})
map('n', '<leader><space>', ':noh<cr>', {noremap = true})
