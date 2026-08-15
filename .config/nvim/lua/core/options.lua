-- UI
vim.opt.termguicolors = true
vim.opt.number = true -- line numbers
vim.opt.relativenumber = true -- relative line numbers
vim.opt.cursorline = true -- highlight current line
vim.opt.wrap = false -- don't wrap by default
vim.opt.scrolloff = 10 -- keep 10 lines verticaly
vim.opt.sidescrolloff = 10 -- keep 10 lines horizontaly
vim.opt.signcolumn = "yes" -- always show sign column
vim.opt.showmatch = true -- highlight matching brackets
vim.opt.fillchars = { eob = " " } -- hide "~" on empty lines

vim.opt.winborder = "rounded" -- rounded floating windows
vim.opt.pumborder = "rounded" -- rounded completion windows

require("vim._core.ui2").enable({ enable = true }) -- enable modern ui
vim.opt.cmdheight = 0 -- make the cmdline auto hide

-- INDENT
vim.opt.tabstop = 2 -- tab width
vim.opt.shiftwidth = 2 -- indent width
vim.opt.softtabstop = 2 -- soft tab stop not ta bs on tab/backspace
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.smartindent = true -- smart auto-indent
vim.opt.autoindent = true -- copy indent from current line

-- SEARCH
vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- case sensitive if uppercase in string

-- MISC
vim.opt.clipboard:append("unnamedplus") -- use system clipboard
vim.opt.completeopt = "menuone,noinsert,noselect,fuzzy" -- completion options
vim.opt.undofile = true -- create undo file
vim.opt.writebackup = false -- don't write to backup file
vim.opt.swapfile = false -- don't create swapfile
vim.opt.iskeyword:append("-") -- include "-" in words
vim.opt.path:append("**") -- include subdirs in search
vim.opt.mouse = "a" -- mouse mode in all modes

vim.opt.splitbelow = true -- horizontal splits go below
vim.opt.splitright = true -- vertical splits go right

