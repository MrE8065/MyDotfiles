-- GIT INDICATORS

return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gitsigns = require("gitsigns")

    gitsigns.setup({
      signcolumn = true,
      current_line_blame = false,
    })
  end,
}
