return {
  "goolord/alpha-nvim",
  event = "VimEnter", -- Start this plugin after all nvim startup stuff
  config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Set header (check ascii.nvim for more ascii art)
      dashboard.section.header.val = {
        "                                                                       ",
	      "                                                                     ",
	      "       ████ ██████           █████      ██                     ",
	      "      ███████████             █████                             ",
	      "      █████████ ███████████████████ ███   ███████████   ",
	      "     █████████  ███    █████████████ █████ ██████████████   ",
	      "    █████████ ██████████ █████████ █████ █████ ████ █████   ",
	      "  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
	      " ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
	      "                                                                       ",
      }

      -- Set menu
      dashboard.section.buttons.val = {
        dashboard.button("n", "  > New File", "<cmd>ene<CR>"),
        dashboard.button("r", "  > Recent"   , "<cmd>Telescope oldfiles<CR>"),
        dashboard.button("e", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
        dashboard.button("f", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
        dashboard.button("w", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
        dashboard.button("l", "󰒲  > Open Lazy", "<cmd>Lazy<CR>"),
        dashboard.button("q", "  > Quit", "<cmd>qa<CR>"),
      }

      dashboard.section.footer.val = {
        "Happy coding!"
      }

      -- Send config to alpha
      alpha.setup(dashboard.opts)

      -- Disable folding
      vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
