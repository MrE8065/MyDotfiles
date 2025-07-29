return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  event = { "BufReadPre", "BufNewFile" }, -- Only load the plugin when opening a new or existing file
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag", -- Auto close and rename html tags
    "OXY2DEV/markview.nvim", -- In case of syntax issues
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
      auto_install = { enable = true },
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
    })
  end
}
