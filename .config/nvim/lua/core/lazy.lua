-- LOAD LAZY.NVIM --

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit" },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:append(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" }, -- Import the plugins folder
    { import = "plugins.lsp" }, -- Import the lsp folder inside plugins
  },
  checker = {
    enabled = true, -- Auto-check plugins updates
    notify = false, -- But don´t notify about it
  },
})
