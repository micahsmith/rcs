local M = { "stevearc/conform.nvim" }

M.cmd = { "ConformInfo" }
M.event = { "BufWritePre" }
M.lazy = false
M.version = "^4"

M.keys = function()
	local conform = require("conform")
	local format = function()
		conform.format({ async = true, lsp_fallback = true })
	end

	return {
		{
			"<leader>jj",
			format,
			desc = "Format buffer",
		},
	}
end

M.opts = {
	formatters_by_ft = {
		go = { "gofmt", "goimports" },
		javascript = { "eslint_d", "prettierd" },
		javascriptreact = { "eslint_d", "prettierd" },
		kotlin = { "ktlint" },
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "rustfmt" },
		typescript = { "eslint_d", "prettierd" },
		typescriptreact = { "eslint_d", "prettierd" },
		yaml = { "yamlfmt" },
		["*"] = { "trim_whitespace" },
	},
}

return M
