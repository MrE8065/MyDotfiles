-- TOP LINE SHOWING CURRENTLY OPEN FILES

return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      separator_style = "slant",
      diagnostics = "nvim_lsp",
      -- Show icon of diagnosctics next to the file name
      diagnostics_indicator = function(_, _, diagnostics_dict, _)
        local s = ""
        for e, _ in pairs(diagnostics_dict) do
          local sym = e == "error" and " " or (e == "warning" and " " or " ")
          s = s .. sym
        end
        return s
      end,
    },
  },
}
