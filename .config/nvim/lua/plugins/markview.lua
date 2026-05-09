-- MARKDOWN PREVIEW

return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  dependencies = { "hrsh7th/nvim-cmp" },
  config = function()
    vim.keymap.set("n", "<leader>mt", "<cmd>Markview toggle<CR>", { desc = "Toggle markdown view globally" })
    vim.keymap.set("n", "<leader>ms", "<cmd>Markview splitToggle<CR>", { desc = "Toggle markdown split view" })
  end,
}
