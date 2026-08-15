require("fzf-lua").setup({
  hls = {
    -- Use the built-in floating window borders
    border = "FloatBorder",
    preview_border = "FloatBorder"
  }
})

-- Find files in cwd
vim.keymap.set("n", "<leader>ff", function()
  require("fzf-lua").files()
end, { desc = "FZF Files" })

-- Live grep
vim.keymap.set("n", "<leader>fg", function()
  require("fzf-lua").live_grep()
end, { desc = "FZF Live Grep" })

-- Current buffers
vim.keymap.set("n", "<leader>fb", function()
  require("fzf-lua").buffers()
end, { desc = "FZF Buffers" })

-- Undotree
vim.keymap.set("n", "<leader>fu", function()
  require("fzf-lua").undotree()
end, { desc = "FZF Undotree" })

-- Recent files in cwd
vim.keymap.set("n", "<leader>fr", function()
  require("fzf-lua").oldfiles({ cwd_only = true })
end, { desc = "FZF Recent Files" })

-- Nvim help
vim.keymap.set("n", "<leader>fh", function()
  require("fzf-lua").help_tags()
end, { desc = "FZF Help Tags" })

-- Diagnostics
vim.keymap.set("n", "<leader>fx", function()
  require("fzf-lua").diagnostics_document()
end, { desc = "FZF Diagnostics Document" })

vim.keymap.set("n", "<leader>fX", function()
  require("fzf-lua").diagnostics_workspace()
end, { desc = "FZF Diagnostics Workspace" })
