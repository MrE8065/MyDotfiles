-- FORMATTING OF FILES

return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      -- Use the formatters installed through Mason
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "autopep8" },
        html = { "prettierd" },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        css = { "prettierd" },
        markdown = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        shell = { "shfmt" },
        bash = { "shfmt" },
      },
      format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 500,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.setup({
        lsp_format = "fallback",
        timeout_ms = 500,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
