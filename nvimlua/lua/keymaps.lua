vim.g.mapleader = ","

local nmap = function(lhs, rhs, desc)
  local opts = {noremap = true}
  if desc then opts.desc = desc end
  vim.api.nvim_set_keymap("n", lhs, rhs, opts)
end

-- navigation
nmap("<leader>e", ":edit<space>", "edit buffer")
nmap("<leader>bd", ":bdelete<cr>", "delete buffer")
nmap("<leader>bn", ":bnext<cr>", "next buffer")
nmap("<leader>bp", ":bprevious<cr>", "previous buffer")
nmap("<leader>sh", "<c-w>h", "focus left pane")
nmap("<leader>sj", "<c-w>j", "focus lower pane")
nmap("<leader>sk", "<c-w>k", "focus upper pane")
nmap("<leader>sl", "<c-w>l", "focus right pane")

-- regex
nmap("<leader><space>", ":noh<cr>", "clear highlights")
vim.api.nvim_set_keymap("n", "/", "/\\v", {noremap = true, desc = "search buffer"})
