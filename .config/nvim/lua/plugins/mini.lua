-- COLLECTION OF PLUGINS

return {
  "nvim-mini/mini.nvim",
  version = "*",
  config = function()
    -- Comment lines
    require("mini.comment").setup()
    -- Move lines
    require("mini.move").setup()
    -- Auto paired characters
    require("mini.pairs").setup()
    -- Actions to make surround characters
    require("mini.surround").setup()
    -- Keymaps cheatsheet
    local miniclue = require("mini.clue")
    miniclue.setup({
      window = {
        delay = 500,
        config = {
          width = "auto",
        },
      },
      triggers = {
        -- Leader triggers
        { mode = "n", keys = "<Leader>" },
        -- `[` and `]` keys
        { mode = "n", keys = "[" },
        { mode = "n", keys = "]" },
        -- Built-in completion
        { mode = "i", keys = "<C-x>" },
        -- `g` key
        { mode = "n", keys = "g" },
        -- Marks
        { mode = "n", keys = "'" },
        { mode = "n", keys = "`" },
        -- Registers
        { mode = "n", keys = '"' },
        { mode = "i", keys = "<C-r>" },
        -- Window commands
        { mode = "n", keys = "<C-w>" },
        -- `z` key
        { mode = "n", keys = "z" },
      },
      clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.square_brackets(),
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
      },
    })
    -- Cmdline autocompletion and autocorrect
    require("mini.cmdline").setup()
    -- Mark the words under the cursor
    require("mini.cursorword").setup()
    -- Mark and trim trailing whitespaces in files
    require("mini.trailspace").setup()

    vim.keymap.set("n", "<leader>rs", "<cmd>lua MiniTrailspace.trim()<CR>", { desc = "Trim all trailing whitespaces" })
  end,
}
