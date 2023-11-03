local M = { 'neovim/nvim-lspconfig' }

M.event = 'VeryLazy'
M.lazy = false

M.config = function()
  local lspconfig = require('lspconfig')

  lspconfig.lua_ls.setup {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
        runtime = {
          version = 'LuaJIT',
        },
        telemetry = {
          enable = false
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
      }
    }
  }

  lspconfig.pyright.setup {}
  lspconfig.tsserver.setup {}
  lspconfig.rust_analyzer.setup {
    settings = {
      ['rust-analyzer'] = {},
    },
  }

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      local nmap = function(lhs, rhs, desc)
        local opts = { buffer = ev.buf, noremap = true, silent = true }
        if desc then opts.desc = desc end
        vim.keymap.set('n', lhs, rhs, opts)
      end

      nmap('<leader>ga', vim.lsp.buf.code_action, 'code action')
      nmap('<leader>gd', vim.lsp.buf.definition, 'definition')
      nmap('<leader>gD', vim.lsp.buf.declaration, 'declaration')
      nmap('<leader>gi', vim.lsp.buf.implementation, 'implementation')
      nmap('<leader>gh', vim.lsp.buf.hover, 'hover')
      nmap('<leader>gs', vim.lsp.buf.signature_help, 'signature help')
      nmap('<leader>gt', vim.lsp.buf.type_definition, 'type definition')
      nmap('<leader>gr', vim.lsp.buf.references, 'references')
      nmap('<leader>rn', vim.lsp.buf.rename, 'rename')
      nmap('<leader>gn', vim.diagnostic.goto_next, 'goto next diagnostic')
      nmap('<leader>gp', vim.diagnostic.goto_prev, 'goto previous diagnostic')
      nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'add workspace folder')
      nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'remove workspace folder')
      nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, 'list workspace folders')
    end
  })
end

M.dependencies = {
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
}

return M
