-- EDITOR COLORSCHEME

return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  config = function()
    local kanagawa = require("kanagawa")

    kanagawa.setup({
      theme = "dragon",
      background = {
        dark = "dragon",
      },
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
              float = {
                bg_border = "none", -- Remove the border background in floating windows (e.g: LSP completion)
              },
            },
          },
        },
      },
    })

    vim.cmd("colorscheme kanagawa")
  end,
}
