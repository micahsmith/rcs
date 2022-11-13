local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp = pcall(require, 'cmp_nvim_lsp')
if ok then capabilities = cmp.default_capabilities(capabilities) end

M.capabilities = capabilities

local on_attach = function(client, bufnr)
    local opts = {buffer = bufnr, noremap = true, silent = true}

    vim.keymap.set('n', '<leader>ga', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>ge', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>gh', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>gs', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>gn', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>gp', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<leader>jj', function() vim.lsp.buf.format {async = true} end, opts)
end

M.on_attach = on_attach

return M
