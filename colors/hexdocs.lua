-- colors/hexdocs.lua

vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.g.colors_name = "hexdocs"

local set = vim.api.nvim_set_hl
local c = {
  bg      = "#1d1f21",
  fg      = "#c5c8c6",
  comment = "#969896",
  green   = "#b5bd68",
  orange  = "#de935f",
  purple  = "#b294bb",
  blue    = "#81a2be",
  red     = "#cc6666",
  yellow  = "#f0c674",
  cursor  = "#282a2e",
  visual  = "#373b41",
}

-- UI
set(0, "Normal", { fg = c.fg, bg = c.bg })
set(0, "CursorLine", { bg = c.cursor })
set(0, "Visual", { bg = c.visual })

-- Syntax
set(0, "Comment", { fg = c.comment, italic = true })
set(0, "String", { fg = c.green })
set(0, "Number", { fg = c.orange })
set(0, "Constant", { fg = c.orange })
set(0, "Identifier", { fg = c.red })
set(0, "Function", { fg = c.blue })
set(0, "Type", { fg = c.blue })
set(0, "Keyword", { fg = c.purple })
set(0, "Operator", { fg = c.yellow })
set(0, "Special", { fg = c.yellow })
