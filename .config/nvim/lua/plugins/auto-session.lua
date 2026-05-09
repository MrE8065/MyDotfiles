-- AUTO CREATE SESSIONS FOR CWD

return {
  "rmagatti/auto-session",
  lazy = false,
  config = function()
    require("auto-session").setup({
      auto_restore = false,
      suppressed_dirs = { "/", "~/", "~/Downloads/", "~/Documents/", "~/Desktop/" },
    })

    vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions" -- Recommended options to save

    vim.keymap.set("n", "<leader>wr", "<cmd>AutoSession restore<CR>", { desc = "Restore session for cwd" })
    vim.keymap.set("n", "<leader>ws", "<cmd>AutoSession save<CR>", { desc = "Save session for cwd" })
  end,
}
