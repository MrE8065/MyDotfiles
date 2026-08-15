local treesitter = require("nvim-treesitter")

local ensure_installed = {
  "python", "html", "css", "javascript", "json", "bash",
}

treesitter.install(ensure_installed)

-- https://github.com/igorlfs/dotfiles/blob/main/nvim/.config/nvim/plugin/nvim-treesitter.lua
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(event)
    local name, kind = event.data.spec.name, event.data.kind

    if name == "nvim-treesitter" and kind == "update" then
      if not event.data.active then
        return
      end
      vim.cmd("TSUpdate")
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    local buf = args.buf -- buffer index
    local ft = vim.bo[buf].filetype -- buffer filetype

    local lang = vim.treesitter.language.get_lang(ft) -- get the language of the buffer
    if not lang then
      return
    end

    local ok_add = pcall(vim.treesitter.language.add, lang) -- try to attach parser
    if not ok_add then
      return
    end

    pcall(vim.treesitter.start, buf, lang) -- start treesitter
  end,
})
