-- COLOR HIGHLIGHTER

return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  config = function()
    require("colorizer").setup({
      options = {
        parsers = {
          css = true,
          tailwind = { enable = true, lsp = true, update_names = true },
        },
      },
      filetypes = {
        "*",
        html = { names = true },
        css = { names = true },
      },
    })
  end,
}
