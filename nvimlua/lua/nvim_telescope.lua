local ok, telescope = pcall(require, 'telescope')
if not ok then return end

telescope.setup {}

local map = vim.api.nvim_set_keymap
local opts = {noremap = true}

-- navigation
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)
