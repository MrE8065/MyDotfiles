-- Modified version of:
-- https://github.com/adriankarlen/plugin-view.nvim

local M = {}

local options = {
  win = {
    border = "rounded",
    width = 84,
    height = 15,
    title = "Plugins",
  },
}

M.setup = function(opts)
  options = vim.tbl_deep_extend("force", options, opts or {})
end

M.open = function()
  local w = options.win
  local width, height = w.width, w.height
  local row = math.floor((vim.o.lines - height) / 2 - 1)
  local col = math.floor((vim.o.columns - width) / 2)

  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, {
    style = "minimal",
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    border = w.border,
    title = w.title,
    title_pos = "left",
  })

  local function get_plugin_name()
    return vim.api.nvim_get_current_line():match "^([^%s]+)"
  end

  local function close()
    vim.api.nvim_win_close(win, true)
  end

  vim.keymap.set("n", "q", close, { buffer = buf })
  vim.keymap.set("n", "<ESC>", close, { buffer = buf })
  vim.keymap.set("n", "U", function() vim.pack.update() end, { buffer = buf })
  for _, action in ipairs { "update", "del" } do
    vim.keymap.set("n", action:sub(1, 1), function()
      local name = get_plugin_name()
      if not name then
        vim.notify("Plugin not found in current line", vim.log.levels.ERROR)
        return
      end
      vim.pack[action] { name }
    end, { buffer = buf })
  end

  local plugins = vim.pack.get()
  local name_width = 60
  local lines = {
    string.format("Total: %d", #plugins),
    "Name" .. string.rep(" ", name_width - 4) .. "  Active",
  }
  for _, p in ipairs(plugins) do
    local name = (p.spec.name or ""):sub(1, name_width)
    table.insert(lines, name .. string.rep(" ", name_width - #name)
      .. "  " .. (p.active and "Yes" or "No"))
  end
  table.insert(lines, "")
  table.insert(lines, "U - Update all | u - Update | d - Delete")

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  local ns = vim.api.nvim_create_namespace "plugin_view"
  for _, hl in ipairs {
    { "PluginViewTotal", { bg = vim.api.nvim_get_hl(0, { name = "WinBar" }).bg, bold = true } },
    { "PluginViewHeader", { link = "WinBar" } },
    { "PluginViewLine", { link = "NormalFloat" } },
    { "PluginViewName", { link = "Directory" } },
    { "PluginViewActive", { link = "Boolean" } },
    { "PluginViewHelp", { link = "Comment" } },
  } do
    vim.api.nvim_set_hl(0, hl[1], hl[2])
  end
  vim.api.nvim_buf_set_extmark(buf, ns, 0, 0, { line_hl_group = "PluginViewTotal" })
  vim.api.nvim_buf_set_extmark(buf, ns, 1, 0, { line_hl_group = "PluginViewHeader" })
  for i = 2, #plugins + 1 do
    vim.api.nvim_buf_set_extmark(buf, ns, i, 0, { line_hl_group = "PluginViewLine" })
    vim.api.nvim_buf_set_extmark(buf, ns, i, 0, { hl_group = "PluginViewName", end_col = name_width })
    vim.api.nvim_buf_set_extmark(buf, ns, i, name_width, {
      hl_group = "PluginViewActive", end_col = name_width + 5,
    })
  end
  vim.api.nvim_buf_set_extmark(buf, ns, #lines - 1, 0, { line_hl_group = "PluginViewHelp" })

  for _, opt in ipairs({ { "modifiable", false }, { "readonly", true } }) do
    vim.api.nvim_set_option_value(opt[1], opt[2], { buf = buf })
  end
  vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = buf })
end

return M
