---@class config.utils.ui
local M = {}

-- foldtext for Neovim < 0.10.0
function M.foldtext()
  return vim.api.nvim_buf_get_lines(0, vim.v.lnum - 1, vim.v.lnum, false)[1]
end

-- optimized treesitter foldexpr for Neovim >= 0.10.0
function M.foldexpr()
  local buf = vim.api.nvim_get_current_buf()
  if vim.b[buf].ts_folds == nil then
    -- as long as we don't have a filetype, don't bother
    -- checking if treesitter is available (it won't)
    if vim.bo[buf].filetype == "" then
      return "0"
    end
    if vim.bo[buf].filetype:find("dashboard") then
      vim.b[buf].ts_folds = false
    else
      vim.b[buf].ts_folds = pcall(vim.treesitter.get_parser, buf)
    end
  end
  return vim.b[buf].ts_folds and vim.treesitter.foldexpr() or "0"
end

-- open terminal
function M.open_terminal_bottom()
  vim.cmd.new()
  vim.api.nvim_win_set_height(0, 12)
  vim.opt_local.winfixheight = true
  vim.cmd.term()
end

function M.open_terminal_right()
  vim.cmd.vnew()
  vim.api.nvim_win_set_width(0, 80)
  vim.opt_local.winfixwidth = true
  vim.cmd.term()
end

function M.name_buffer()
  vim.ui.input({ prompt = "Enter terminal name: " }, function(name)
    if name == nil or vim.trim(name) == "" then
      return
    end
    vim.api.nvim_buf_set_name(0, name)
  end)
end

return M
