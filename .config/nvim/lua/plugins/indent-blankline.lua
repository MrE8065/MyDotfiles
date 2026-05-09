-- SHOW INDENT GUIDES

return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  config = function()
    require("ibl").setup({
      indent = { char = "▏" },
      whitespace = {
        remove_blankline_trail = false,
      },
    })
  end,
}
