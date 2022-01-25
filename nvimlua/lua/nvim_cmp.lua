local ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')

if not ok then
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
cmp_lsp.update_capabilities(capabilities)

local cmp = require('cmp')
cmp.setup {
    snippet = {expand = function(args) vim.fn["vsnip#anonymous"](args.body) end},
    mapping = {
        ['<s-tab>'] = cmp.mapping.select_prev_item(),
        ['<tab>'] = cmp.mapping.select_next_item(),
        ['<cr>'] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Insert, select = true})
    },
    sources = {{name = 'nvim_lsp'}, {name = 'path'}, {name = 'vsnip'}, {name = 'buffer'}}
}
