--return {
--    "AlphaTechnolog/pywal.nvim",
--    lazy = false,
--    priority = 1000,
--    config = function()
--        -- Set up pywal and load the colors
--        require("pywal").setup()
--
--    end,
--}

return {
  "oncomouse/lushwal.nvim",
  lazy = false,
  cmd = { "LushwalCompile" },
  dependencies = {
		{ "rktjmp/lush.nvim" },
		{ "rktjmp/shipwright.nvim" },
	},
  init = function()
    vim.g.lushwal_configuration = {
      transparent_background = true,
      addons = {
        indent_blankline_nvim = true,
        markdown = true,
        nvim_cmp = true,
        nvim_tree_lua = true,
        telescope_nvim = true,
        which_key_nvim = true,
      }
    }
  end,
  config = function()
    require("lushwal").add_reload_hook({
      vim.cmd("LushwalCompile")
    })
  end
}
