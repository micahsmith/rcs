if (vim.g.syntax_on == true) then vim.cmd('syntax enable') end

-- basics
vim.o.encoding = 'utf-8'
vim.o.completeopt = 'menu,menuone,noselect'

-- command-line completion
vim.o.wildmenu = true
vim.o.wildmode = 'longest,list'

-- display
vim.o.background = 'dark'
vim.o.lazyredraw = true
vim.o.matchtime = 2
vim.o.showmatch = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.textwidth = 100
vim.o.wrap = true

-- search
vim.o.gdefault = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.smartcase = true

-- sidebar
vim.o.number = true
vim.o.numberwidth = 1
vim.o.relativenumber = true
vim.o.modeline = false
vim.o.modelines = 0
vim.o.signcolumn = 'auto'
vim.o.showcmd = true

-- whitespace
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.formatoptions = 'qrnj1'
vim.o.expandtab = true
