return {
  "rose-pine/neovim",
  -- "Mofiqul/dracula.nvim",
  lazy = false,
  priority = 1000,
  opts = {
  },
  config = function()
    require("rose-pine").setup(
      {
        highlight_groups = {
          ["@string.special.symbol.elixir"] = { fg = "love" },
          ["@module.elixir"] = { fg = "gold" },
          ["@string.elixir"] = { fg = "text" },
          ["@variable.elixir"] = { fg = "text", bold = true, italic = true },
          -- ["@keyword.elixir"] = { fg = "love" },
          -- Comment = { fg = "foam" },
          -- StatusLine = { fg = "love", bg = "love", blend = 15 },
          -- VertSplit = { fg = "muted", bg = "muted" },
          -- Visual = { fg = "base", bg = "text", inherit = false },
        }
      }
    )
    vim.cmd("colorscheme rose-pine")
    -- vim.cmd("colorscheme dracula dark")
  end
}
