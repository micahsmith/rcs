local M = { 'nvim-neo-tree/neo-tree.nvim' }

M.branch = 'v3.x'
M.cmd = 'Neotree'
M.lazy = false

M.dependencies = {
  'nvim-lua/plenary.nvim',
  'nvim-tree/nvim-web-devicons',
  'MunifTanjim/nui.nvim',
}

M.keys = {
  { '<leader>nt', '<cmd>Neotree<cr>', desc = 'open file tree' },
}

M.opts = function()
  return {
    filesystem = {
       hijack_netrw_behavior = "open_default",
       use_libuv_file_watcher = true
    }
  }
end

return M
