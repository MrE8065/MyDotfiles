vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.number = true

-- Tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = false

opt.termguicolors = true
opt.signcolumn = 'yes'

opt.backspace = "indent,eol,start"

-- View splits
opt.splitright = true
opt.splitbelow = true

-- Apply the colorscheme when start
vim.cmd("colorscheme lushwal")
