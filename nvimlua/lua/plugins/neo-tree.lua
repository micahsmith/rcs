vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

local M = { 'nvim-neo-tree/neo-tree.nvim' }

M.branch = 'v2.x'
M.cmd = 'Neotree'
M.lazy = true

M.dependencies = {
  'nvim-lua/plenary.nvim',
  'nvim-tree/nvim-web-devicons',
  'MunifTanjim/nui.nvim',
}

M.keys = {
  { '<leader>nt', '<cmd>Neotree<cr>', desc = 'open file tree' },
}

return M
