local M = { "mfussenegger/nvim-lint" }

M.event = { "BufWritePost", "BufReadPost", "InsertLeave" }
M.lazy = true
M.version = false

M.config = function()
	local lint = require("lint")
	local try_lint = function()
		lint.try_lint()
	end

	vim.api.nvim_create_autocmd({ "BufWritePost" }, { callback = try_lint })
end

M.opts = {
	linters_by_ft = {
		bash = { "shellcheck" },
		javascript = { "eslint_d" },
		javascriptreact = { "eslint_d" },
		kotlin = { "ktlint" },
		markdown = { "markdownlint" },
		lua = { "selene" },
		typescript = { "eslint_d" },
		typescriptreact = { "eslint_d" },
		yaml = { "cfn_lint", "yamllint" },
	},
}

return M
