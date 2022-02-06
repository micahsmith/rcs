local ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not ok then return end
local ok, lsp_common = pcall(require, 'lsp_common')
if not ok then return end

local jdtls_installed = lsp_installer.get_server('jdtls')
if not jdtls_installed then return end

local jdtls_root = nil
local servers = lsp_installer.get_installed_servers()
for i = 1, #servers do if servers[i].name == 'jdtls' then jdtls_root = servers[i].root_dir end end

if not jdtls_root then return end

local config_suffix = 'win'
local platform = vim.trim(vim.fn.system('uname'))
if platform == 'Darwin' then
    config_suffix = 'mac'
elseif platform == 'Linux' then
    config_suffix = 'linux'
end

local jar_path = vim.fn.glob(jdtls_root .. '/plugins/org.eclipse.equinox.launcher_*.jar')
local config_path = jdtls_root .. '/config_' .. config_suffix
local data_path = vim.fn.stdpath('data') .. '/jdtls'

if not vim.fn.isdirectory(data_path) then vim.fn.mkdir(data_path, 'p', 0700) end

local config = {
    cmd = {
        'java', '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4', '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true', '-Dlog.level=ALL', '-Xms1g', '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED', '--add-opens',
        'java.base/java.lang=ALL-UNNAMED', '-jar', jar_path, '-configuration', config_path, '-data',
        data_path
    },

    capabilities = lsp_common.capabilities,
    init_options = {bundles = {}},
    on_attach = lsp_common.on_attach,
    root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
    settings = {java = {}}
}

require('jdtls').start_or_attach(config)
