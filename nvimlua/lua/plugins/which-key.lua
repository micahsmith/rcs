local M = { 'folke/which-key.nvim' }

M.event = 'VeryLazy'
M.lazy = false
M.opts = {}

M.init = function()
  vim.o.timeout = true
  vim.o.timeoutlen = 200
end

return M
