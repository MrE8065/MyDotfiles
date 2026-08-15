-- Icon provider
local MiniIcons = require("mini.icons")
MiniIcons.setup()
MiniIcons.mock_nvim_web_devicons() -- mock nvim-web-devicons
-- Comment lines
require("mini.comment").setup()
-- Autopairs
require("mini.pairs").setup()
-- Surround actions
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
    -- "[" and "]" keys
    { mode = "n", keys = "[" },
    { mode = "n", keys = "]" },
    -- Built-in completion
    { mode = "i", keys = "<C-x>" },
    -- "g" key
    { mode = "n", keys = "g" },
    -- Marks
    { mode = "n", keys = "'" },
    { mode = "n", keys = "`" },
    -- Registers
    { mode = "n", keys = '"' },
    { mode = "i", keys = "<C-r>" },
    -- Window commands
    { mode = "n", keys = "<C-w>" },
    -- "z" key
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
-- Cmdline autocomplete
require("mini.cmdline").setup({
  autocorrect = {
    enable = false
  }
})
-- Trailspace highlight/remove
require("mini.trailspace").setup()

vim.keymap.set("n", "<leader>rs", "lua MiniTrailspace.trim()", { desc = "Trim all trailing whitespaces" })

-- Notifications system
require("mini.notify").setup({
  lsp_progress = {
    enable = false
  }
})
-- Diff visualizer
require("mini.diff").setup({
  view = {
    style = "sign",
    signs = { add = "▎", change = "▎", delete = "▎" },
	},
})

vim.keymap.set("n", "<leader>hp", "lua MiniDiff.toggle_overlay()", { desc = "Preview diff overlay" })

-- Statusline
local MiniStatusline = require("mini.statusline")
MiniStatusline.setup({
  content = {
    active = function()
      local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
      local git = MiniStatusline.section_git({ trunc_width = 40 })
      local diff = MiniStatusline.section_diff({ trunc_width = 75 })
      local diagnostics = MiniStatusline.section_diagnostics({
        trunc_width = 75,
        signs = { ERROR = "", WARN = "", INFO = "", HINT = "󰠠" },
      })
      local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
      local filename = MiniStatusline.section_filename({ trunc_width = 140 })
      local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
      local location = MiniStatusline.section_location({ trunc_width = 75 })
      local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

      return MiniStatusline.combine_groups({
        { hl = mode_hl, strings = { mode } },
        { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
        "%<", -- Mark general truncate point
        { hl = "MiniStatuslineFilename", strings = { filename } },
        "%=", -- End left alignment
        { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
        { hl = mode_hl, strings = { search, location } },
      })
    end,
  },
})
-- Disable the status line in the file explorer
local disable = function(args) vim.b[args.buf].ministatusline_disable = true end
vim.api.nvim_create_autocmd('FileType', { pattern = 'NvimTree', callback = disable })

-- Tabline
require("mini.tabline").setup()

-- Completion and snippets
local MiniCompletion = require("mini.completion")
MiniCompletion.setup()

-- Hide "S" snippet indicator from completion popup
local mini_completefunc_orig = MiniCompletion.completefunc_lsp
MiniCompletion.completefunc_lsp = function(findstart, base)
  local res = mini_completefunc_orig(findstart, base)
  if type(res) == "table" then
    for _, item in ipairs(res) do
      local lsp_data = item.user_data and item.user_data.lsp
      if lsp_data and lsp_data.needs_snippet_insert and item.menu then
        item.menu = item.menu:gsub("^S ?", "", 1)
      end
    end
  end
  return res
end

local MiniSnippets = require("mini.snippets")
MiniSnippets.setup({
  snippets = {
    MiniSnippets.gen_loader.from_lang()
  },
})
MiniSnippets.start_lsp_server({ match = false })
