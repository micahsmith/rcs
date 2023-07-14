local M = { 'EdenEast/nightfox.nvim' }

M.lazy = false
M.priority = 1000

M.config = function()
  vim.cmd.colorscheme('nightfox')
end

return M
