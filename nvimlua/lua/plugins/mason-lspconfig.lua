local M = { 'williamboman/mason-lspconfig.nvim' }

M.lazy = true

M.dependencies = {
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
}

M.opts = {
  ensure_installed = {
    'bashls',
    'cssls',
    'dockerls',
    'eslint',
    'elixirls',
    'gopls',
    'html',
    'jsonls',
    'jsonnet_ls',
    'lua_ls',
    'pyright',
    'rust_analyzer',
    'sqlls',
    'tsserver',
    'yamlls',
  },
}

return M
