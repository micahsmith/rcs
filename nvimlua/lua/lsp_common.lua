local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp = pcall(require, 'cmp_nvim_lsp')
if ok then capabilities = cmp.default_capabilities(capabilities) end

M.capabilities = capabilities

local on_attach = function(client, bufnr)
    local function map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = {noremap = true, silent = true}

    map('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    map('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    map('n', '<leader>ge', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    map('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    map('n', '<leader>gh', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    map('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    map('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    map('n', '<leader>gn', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', opts)
    map('n', '<leader>gp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', opts)
    map('n', '<leader>jj', '<cmd>lua vim.lsp.buf.format()<cr>', opts)
end

M.on_attach = on_attach

return M
