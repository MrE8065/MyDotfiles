require("kanagawa").setup({
  theme = "dragon",
  background = {
    dark = "dragon",
  },
  colors = {
    theme = {
      all = {
        ui = {
          bg_gutter = "none",
        },
      },
    },
  },
  overrides = function(colors)
    local theme = colors.theme
    return {
      -- Dark completion menu
      Pmenu = { fg = theme.ui.shade0, bg = "NONE" },
      PmenuKind = { bg = "NONE" },
      PmenuKindExtra = { bg = "NONE" },

      PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
      PmenuKindSel = { fg = "NONE", bg = theme.ui.bg_p2 },
      PmenuKindExtraSel = { fg = "NONE", bg = theme.ui.bg_p2 },

      PmenuSbar = { bg = theme.ui.bg_m1 },
      PmenuThumb = { bg = theme.ui.bg_p2 },
      -- Transparent floating windows
      Normal = { bg = "none" },
      NormalFloat = { bg = "none" },
      FloatBorder = { bg = "none" },
      FloatTitle = { bg = "none" }
    }
  end,
})

vim.cmd("colorscheme kanagawa")
