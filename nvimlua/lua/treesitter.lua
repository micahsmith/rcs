local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then return end

configs.setup {
    ensure_installed = "all",
    sync_install = false,
    ignore_install = {},
    highlight = {enable = true, disable = {}, additional_vim_regex_highlighting = false}
}
