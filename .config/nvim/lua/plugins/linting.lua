require("lint").linters_by_ft = {
  python = { "pylint" },
  javascript = { "eslint_d" },
  typesript = { "eslint_d" },
  bash = { "shellcheck" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
