-- KEYMAPS --

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- Wrap-aware movement
keymap.set("n", "j", function()
  return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })

keymap.set("n", "k", function()
  return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up (wrap-aware)" })

-- Search
keymap.set("n", "<leader>nh", ":nohlsearch<CR>", { desc = "Clear search highlights" })
keymap.set("n", "n", "nzzzv", { desc = "Next result (centered)" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous result (centered)" })

-- Buffers
keymap.set("n", "<leader>bl", ":bnext<CR>", { desc = "Move to the next buffer" })
keymap.set("n", "<leader>bj", ":bprev<CR>", { desc = "Move to the previous buffer" })
keymap.set("n", "<leader>bi", ":bd<CR>", { desc = "Close the current buffer" })

-- Window movement
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Splits
keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })

-- mini.nvim handles this, but I keep them here to remember in case I delete the plugin --
--
-- Moving
-- keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down"})
-- keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up"})
-- keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down"})
-- keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up"})

-- Indentation
-- keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
-- keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

------------------------------------------------------------------------------------------

-- Join lines
keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Show/Copy current file path
keymap.set("n", "<leader>pa", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("file:", path)
end, { desc = "Copy full file path" })

-- Toggle diagnostics
keymap.set("n", "<leader>td", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
  -- Show notifications when toggling
  if vim.diagnostic.is_enabled() then
    vim.notify("Diagnostics enabled", vim.log.levels.INFO)
  else
    vim.notify("Diagnostics disabled", vim.log.levels.WARN)
  end
end, { desc = "Toggle diagnostics" })

-- Toggle text wrap
keymap.set("n", "<leader>tw", ":set wrap!<CR>", { desc = "Toggle text wrap" })
