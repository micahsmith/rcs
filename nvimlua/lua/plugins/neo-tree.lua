local M = { "nvim-neo-tree/neo-tree.nvim" }

M.branch = "v3.x"
M.cmd = "Neotree"
M.lazy = false

M.dependencies = {
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",
	"MunifTanjim/nui.nvim",
}

M.init = function()
	vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
	vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
	vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
	vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵 ", texthl = "DiagnosticSignHint" })
end

M.keys = {
	{ "<leader>nt", "<cmd>Neotree<cr>", desc = "open file tree" },
}

M.opts = {
	filesystem = {
		hijack_netrw_behavior = "open_default",
		use_libuv_file_watcher = true,
	},
}

return M
