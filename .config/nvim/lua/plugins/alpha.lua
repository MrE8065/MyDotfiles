-- STARTER SCREEN

return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Art from ascii.nvim
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

    dashboard.section.buttons.val = {
      dashboard.button("n", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("r", "  > Recent", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("e", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("f", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("w", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("s", "󰁯  > Restore Session For cwd", "<cmd>AutoSession restore<CR>"),
      dashboard.button("l", "󰒲  > Open Lazy", "<cmd>Lazy<CR>"),
      dashboard.button("q", "  > Quit", "<cmd>qa<CR>"),
    }

    dashboard.section.footer.val = {
      "Happy coding!",
    }

    alpha.setup(dashboard.opts)

    -- Disable folding
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
