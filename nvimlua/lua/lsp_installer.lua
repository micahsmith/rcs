local ok, lsp_servers = pcall(require, 'nvim-lsp-installer.servers')
if not ok then return end
local ok, lsp_common = pcall(require, 'lsp_common')
if not ok then return end

local servers = {
    'bashls', 'cssls', 'dockerls', 'efm', 'html', 'groovyls', 'jdtls', 'jsonls', 'pyright',
    'rust_analyzer', 'solargraph', 'sumneko_lua', 'svelte', 'sqlls', 'tsserver', 'yamlls'
}

local eslint = {
    lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
    lintStdin = true,
    lintFormats = {'%f:%l:%c: %m'},
    lintIgnoreExitCode = true,
    formatCommand = 'eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}',
    formatStdin = true
}

local settings = {
    efm = {
        init_options = {documentFormatting = true},
        filetypes = {
            'lua', 'java', 'python', 'ruby', 'sh', 'javascript', 'javascriptreact',
            'javascript.jsx', 'typescript', 'typescript.tsx', 'typescriptreact'
        },
        settings = {
            rootMarkers = {'.git/'},
            languages = {
                -- https://github.com/Koihik/LuaFormatter
                lua = {{formatCommand = 'lua-format -i --column-limit=100', formatStdin = true}},
                -- https://github.com/jhipster/prettier-java
                java = {
                    {formatCommand = 'prettier --parser=java --print-width=100', formatStdin = true}
                },
                -- https://github.com/psf/black
                python = {{formatCommand = 'python3 -m black --quiet -', formatStdin = true}},
                -- https://github.com/prettier/plugin-ruby
                ruby = {
                    {formatCommand = 'prettier --parser=ruby --print-width=100', formatStdin = true}
                },
                -- https://github.com/koalaman/shellcheck
                sh = {
                    {
                        lintCommand = 'shellcheck -f gcc -x',
                        lintSource = 'shellcheck',
                        lintFormats = {
                            '%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'
                        }
                    }, {formatCommand = 'shfmt -ci -s -bn', formatStdin = true}
                },
                javascript = {eslint},
                javascriptreact = {eslint},
                ['javascript.jsx'] = {eslint},
                typescript = {eslint},
                ['typescript.tsx'] = {eslint},
                typescriptreact = {eslint}
            }
        }
    },
    sumneko_lua = {
        settings = {
            Lua = {
                diagnostics = {globals = {'require', 'vim'}},
                workspace = {
                    library = {
                        vim.api.nvim_get_runtime_file('', true),
                        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
                    }
                }
            }
        }
    }
}

for _, server_name in ipairs(servers) do
    local is_available, server = lsp_servers.get_server(server_name)
    if is_available then
        if not server:is_installed() then server:install() end

        server:on_ready(function()
            if server.name == 'jdtls' then return end

            local opts = {}
            if settings[server.name] then opts = settings[server.name] end

            opts.capabilities = lsp_common.capabilities
            opts.flags = {debounce_text_changes = 150}
            opts.on_attach = lsp_common.on_attach

            server:setup(opts)
        end)
    end
end