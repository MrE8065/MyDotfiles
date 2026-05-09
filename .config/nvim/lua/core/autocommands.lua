-- AUTOCOMMANDS --

local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })
local create_autocmd = vim.api.nvim_create_autocmd

-- Highlight yanked text
create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Return to last cursor position
create_autocmd("BufReadPost", {
  group = augroup,
  desc = "Restore last cursor position",
  callback = function()
    if vim.o.diff then -- Except in diff mode
      return
    end

    local last_pos = vim.api.nvim_buf_get_mark(0, '"') -- {line, col}
    local last_line = vim.api.nvim_buf_line_count(0)

    local row = last_pos[1]
    if row < 1 or row > last_line then
      return
    end

    pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
  end,
})

-- Wrap, linebreak and spellcheck on text and gitcommit files
create_autocmd("FileType", {
  group = augroup,
  pattern = { "text", "gitcommit" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.spell = true
  end,
})
