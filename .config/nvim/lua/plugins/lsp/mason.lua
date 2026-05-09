-- INSTALL/UPDATE LSPs, LINTERS, FORMATTERS

return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        -- LSPs to install
        "lua_ls",
        "pyright",
        "html",
        "cssls",
        "ts_ls",
        "jsonls",
        "bashls",
      },
    },
    dependencies = {
      {
        "mason-org/mason.nvim",
        config = function()
          require("mason").setup()
        end,
      },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- formatters
        "prettierd", -- html, js, jsx, ts, tsx, css, md, json, yaml
        "stylua", -- lua
        "isort", -- python
        "autopep8", -- python
        "shfmt", -- shell
        -- linters
        "shellcheck", -- bash
        "pylint", -- python
        "eslint_d", -- javascript, typescript
        "selene", -- lua
      },
    },
    dependencies = { "mason-org/mason.nvim" },
  },
}
