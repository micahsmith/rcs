local ok, cmp = pcall(require, 'cmp')
if not ok then return end

cmp.setup {
    snippet = {expand = function(args) vim.fn["vsnip#anonymous"](args.body) end},
    mapping = {
        ['<s-tab>'] = cmp.mapping.select_prev_item(),
        ['<tab>'] = cmp.mapping.select_next_item(),
        ['<cr>'] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Insert, select = true})
    },
    sources = {{name = 'nvim_lsp'}, {name = 'path'}, {name = 'vsnip'}, {name = 'buffer'}}
}
