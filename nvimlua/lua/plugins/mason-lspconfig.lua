local M = { "williamboman/mason-lspconfig.nvim" }

M.lazy = true

M.dependencies = {
  "williamboman/mason.nvim",
  "neovim/nvim-lspconfig",
}

M.opts = {
  ensure_installed = {
    "bashls",
    "dockerls",
    "eslint",
    "gopls",
    "html",
    "jsonls",
    "jsonnet_ls",
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "sqlls",
    "tsserver",
    "yamlls"
  },
}

return M
