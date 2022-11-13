local ok, nvim_tree = pcall(require, 'nvim-tree')
if not ok then return end

nvim_tree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {},
    hijack_cursor = true,
    hijack_directories = {enable = true, auto_open = true},
    update_cwd = true,
    diagnostics = {enable = true},
    update_focused_file = {enable = false, update_cwd = false, ignore_list = {}},
    git = {enable = true, ignore = true, timeout = 500},
    view = {adaptive_size = true}
}

local map = vim.api.nvim_set_keymap
local opts = {noremap = true}

map('n', '<leader>nt', '<cmd>NvimTreeToggle<cr>', opts)
map('n', '<leader>nw', '<cmd>NvimTreeRefresh<cr>', opts)
map('n', '<leader>nf', '<cmd>NvimTreeFindFile<cr>', opts)
