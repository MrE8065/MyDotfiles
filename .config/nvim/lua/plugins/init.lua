vim.pack.add({
  "https://github.com/nvim-tree/nvim-tree.lua",
  "https://github.com/rebelot/kanagawa.nvim",
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/rafamadriz/friendly-snippets",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/mfussenegger/nvim-lint",
  "https://github.com/OXY2DEV/markview.nvim"
})

require("plugins.nvim-tree")
require("plugins.colorscheme")
require("plugins.fzf")
require("plugins.mini")
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.linting")

vim.keymap.set("n", "<leader>mt", "<cmd>Markview toggle<CR>", { desc = "Toggle markdown view globally" })
vim.keymap.set("n", "<leader>ms", "<cmd>Markview splitToggle<CR>", { desc = "Toggle markdown split view" })

require("plugins.plugin-viewer")
vim.keymap.set("n", "<leader>pv", function()
  require("plugins.plugin-viewer").open()
end, { desc = "Open the plugins viewer" })
