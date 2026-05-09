-- NVIM BUILTIN OPTIONS --

-- Disable the builtin file explorer (Replaced nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

-- Lines
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = false
opt.scrolloff = 10 -- Keep 10 lines above/below cursor
opt.sidescrolloff = 10 -- Keep 10 lines to left/right of cursor

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Splits
opt.splitbelow = true -- Horizontal splits go below
opt.splitright = true -- Vertical splits go right

-- Extras
opt.termguicolors = true
opt.signcolumn = "yes"
opt.clipboard:append("unnamedplus") -- Append to the system clipboard
opt.swapfile = false
opt.foldlevelstart = 99 -- Start with all folds open
opt.winborder = "rounded" -- Apply rounded borders to all floating windows
opt.fileformat = "unix" -- Set Unix-style EndOfLine
