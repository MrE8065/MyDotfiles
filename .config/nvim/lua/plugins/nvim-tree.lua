-- BETTER FILE EXPLORER

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")
    nvimtree.setup({
      view = {
        width = 30,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        group_empty = true,
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
      filters = {
        dotfiles = false,
      },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse folders in file explorer" })
  end,
}
