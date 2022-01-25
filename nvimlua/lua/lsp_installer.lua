local ok, lsp_installer = pcall(require, "nvim-lsp-installer")

if not ok then return end

local server_settings = {
    efm = {
        init_options = {documentFormatting = true},
        filetypes = {'lua'},
        settings = {
            rootMarkers = {'.git/'},
            languages = {
                -- https://github.com/Koihik/LuaFormatter
                lua = {{formatCommand = 'lua-format -i --column-limit=100', formatStdin = true}}
            }
        }
    },
    sumneko_lua = {
        settings = {
            Lua = {
                diagnostics = {globals = {'require', 'vim'}},
                workspace = {
                    library = {
                        -- vim.api.nvim_get_runtime_file("", true)
                        -- [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                        -- [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
                    }
                }
            }
        }
    }
}

local on_attach = function(client, bufnr)
    local function map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = {noremap = true, silent = true}

    map('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    map('n', '<leader>ge', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    map('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    map('n', '<leader>gh', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    map('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    map('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    map('n', '<leader>gn', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', opts)
    map('n', '<leader>gp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', opts)
    map('n', '<leader>jj', '<cmd>lua vim.lsp.buf.formatting()<cr>', opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
lsp_installer.on_server_ready(function(server)
    local opts = {}

    if server_settings[server.name] then opts = server_settings[server.name] end
    opts.capabilities = capabilities
    opts.on_attach = on_attach

    server:setup(opts)
end)
