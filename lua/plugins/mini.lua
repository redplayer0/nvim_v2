return {
  "echasnovski/mini.nvim",
  event = "BufEnter",
  config = function()
    require("mini.pairs").setup()
    require("mini.surround").setup()
    require("mini.tabline").setup()
    require("mini.statusline").setup()
    require("mini.ai").setup()
    require("mini.jump").setup()
    require("mini.jump2d").setup {
      labels = "asdfghjklcneivm",
      view = {
        n_steps_ahead = 1,
      },
      allowed_lines = {
        blank = false,
        cursor_at = false,
      },
    }
    vim.keymap.set(
      "n",
      "<CR>",
      "<CMD>lua MiniJump2d.start(MiniJump2d.builtin_opts.word_start)<CR>",
      { desc = "Jump to word" }
    )
  end,
}
