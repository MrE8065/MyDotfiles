-- INSTALL/UPDATE/REMOVE LANGUAGE PARSERS

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    -- This replaces the old "ensure_installed" option
    --local parsers = { "lua", "markdown", "markdown_inline", "bash" }
    --require("nvim-treesitter").install(parsers)

    -- Auto install config from:
    -- https://github.com/nvim-lua/kickstart.nvim/issues/1951#issuecomment-4100762912

    local function treesitter_try_attach(buf, language)
      -- Check if parser exist
      if not vim.treesitter.language.add(language) then
        return
      end
      -- Enable syntax highlighting
      vim.treesitter.start(buf, language)

      --Enable treesitter based folds
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.wo.foldmethod = "expr"

      -- Enable treesitter base indentation
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end

    local available_parsers = require("nvim-treesitter").get_available()
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local buf, filetype = args.buf, args.match
        local language = vim.treesitter.language.get_lang(filetype)

        if not language then
          return
        end

        local installed_parsers = require("nvim-treesitter").get_installed("parsers")

        if vim.tbl_contains(installed_parsers, language) then
          -- Enable parser if is installed
          treesitter_try_attach(buf, language)
        elseif vim.tbl_contains(available_parsers, language) then
          -- If a parser is available, install it and enable it
          require("nvim-treesitter").install(language):await(function()
            treesitter_try_attach(buf, language)
          end)
        else
          -- Try to enable treesitter in case the parser exist but is not available from nvim-treesitter
          treesitter_try_attach(buf, language)
        end
      end,
    })
  end,
}
