local M = { 'nvim-telescope/telescope.nvim' }

M.cmd = { 'Telescope' }
M.lazy = true

M.dependencies = { 'nvim-lua/plenary.nvim' }

M.keys = {
  { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'find files' },
  { '<leader>ft', '<cmd>Telescope live_grep<cr>',  desc = 'find a string' },
  { '<leader>fb', '<cmd>Telescope buffers<cr>',    desc = 'find buffers' },
  { '<leader>fh', '<cmd>Telescope help_tags<cr>',  desc = 'help' },
  { '<leader>fk', '<cmd>Telescope keymaps<cr>',    desc = 'find keymaps' },
}

M.opts = {
  defaults = {
    prompt_prefix = ' ',
    selection_caret = ' ',
    path_display = { 'smart' },
    file_ignore_patterns = { '.git/', 'node_modules', '.idea' },
  }
}

return M
